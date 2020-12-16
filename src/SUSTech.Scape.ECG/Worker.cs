using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using SUSTech.Scape.ECG.RosBridgeClient;
using SUSTech.Scape.ECG.RosBridgeClient.BaseMessages.Std.msg;
using SUSTech.Scape.ECG.RosBridgeClient.MessageTypes.DriverEcg.msg;
using SUSTech.Scape.ECG.RosBridgeClient.Protocols;
using Debug = SUSTech.Scape.ECG.RosBridgeClient.MessageTypes.DriverEcg.msg.Debug;

namespace SUSTech.Scape.ECG
{
    public class Worker : BackgroundService
    {
        private const int DefaultBaudRate = 19200;
        private const int DefaultDataBits = 8;
        private const StopBits DefaultStopBits = StopBits.One;
        private const Parity DefaultParity = Parity.None;
        
        private readonly ILogger<Worker> _logger;
        private readonly IConfiguration _configuration;
        private bool _initStartup;
        private bool _headerMsgReceived;
        private ulong _debugCounter;
        private DateTime _firstDataReceiveTime;

        private List<string> _availableSerialPortNames;
        private SerialPort _device;
        
        private RosSocket _ros;
        private string _currentTopic;
        private string _debugTopic;

        private long _rt0 = -1;
        private int _rms = 300;
        private int _ar = 25;
        private int _data0 = -1;

        private readonly Queue<int> _instantaneousHeartRateQueue;
        private const int AveragedCount = 5;

        private DateTime _lastRosMsgSend;
        private TimeSpan _rosMsgTimeSpan = TimeSpan.FromMilliseconds(100);
        private readonly List<int> _ecgCache;

        
        public Worker(ILogger<Worker> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
            _availableSerialPortNames = new List<string>();
            _instantaneousHeartRateQueue = new Queue<int>();
            _ecgCache = new List<int>();
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            // Execute init procedure first
            Init();
            
            // Waiting device can connect
            var confirmConnectFlag = false;
            _logger.LogInformation($"Waiti` for connect...");
            while (!stoppingToken.IsCancellationRequested && !confirmConnectFlag)
            {
                UpdateAvailableSerialPortNames();
                
                if (_device.IsOpen)
                {
                    _logger.LogError("Connection Failure: Device serial port is busy now. Press enter for retry.");
                    Console.Read();
                    continue;
                }

                try
                {
                    _device.Open();
                    confirmConnectFlag = true;
                    _logger.LogInformation("Connection Success!");
                }
                catch (UnauthorizedAccessException)
                {
                    _logger.LogError("Connection Failure:\n" +
                                     "-> Please check device connection\n" +
                                     "-> Please check device serial port path configuration\n" +
                                     "-> Please make sure you are under sudo or su\n" +
                                     "Press enter for retry.");
                    Console.Read();
                }
            }
            
            // Data received.
            _device.DataReceived += DeviceOnDataReceived;

            // Data collection and computing.
            while (!stoppingToken.IsCancellationRequested)
            {
                if (DateTime.Now - _lastRosMsgSend >= _rosMsgTimeSpan)
                {
                    // Get time once at the first time.
                    var time = DateTime.Now;
                    var timestamp = GetTimestamp(time);
                    // Ready for send msg
                    var msg = new Current
                    {
                        RosTime = new Time(timestamp.sec, timestamp.nsec),
                        DateTime = time.ToString("u"),
                        InstantaneousHeartRate = _instantaneousHeartRateQueue.Any()?_instantaneousHeartRateQueue.Last():0,
                        AverageHeartRate = GetAverageHeartRate(),
                        Electrocardiogram = _ecgCache.ToArray()
                    };
                    
                    var debug = new Debug
                    {
                        RosTime = new Time(timestamp.sec, timestamp.nsec),
                        DateTime = time.ToString("u"),
                        SequenceId = ++_debugCounter,
                        CacheLength = _device.BytesToRead,
                        InstantaneousHeartRate = _instantaneousHeartRateQueue.Any()?_instantaneousHeartRateQueue.Last():0,
                        AverageHeartRate = GetAverageHeartRate(),
                        Electrocardiogram = _ecgCache.ToArray()
                    };
                    
                    // Reset debug counter to avoid crash.
                    if (_debugCounter == ulong.MaxValue)
                    {
                        _debugCounter = 0;
                    }

                    _lastRosMsgSend = DateTime.Now;
                    // Publish Msg
                    _ros.Publish(_debugTopic, debug);
                    _ros.Publish(_currentTopic, msg);

                    // File System Write
                    using (var fs = new FileStream("./data.txt",FileMode.Append))
                    {
                        using var writer = new StreamWriter(fs);
                        foreach (var i in _ecgCache)
                        {
                            writer.WriteLine(i);
                        }
                    }
                    // Clear ECG buffer
                    _ecgCache.Clear();
                    UpdateAvailableSerialPortNames();
                }
                
                
                await Task.Delay(TimeSpan.FromMilliseconds(1), stoppingToken);
            }
            
        }

        /// <summary>
        /// Init procedure
        /// </summary>
        private void Init()
        {
            UpdateAvailableSerialPortNames();
            SetupDevice();
            SetupRosBridge();
            
            // End init procedure
            _initStartup = false;
            _lastRosMsgSend = DateTime.Now;
        }
        
        /// <summary>
        /// Data receiver process.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DeviceOnDataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            if (_headerMsgReceived)
            {
                // Read data.
                var buffer = new byte[10];
                _device.Read(buffer, 0, 10);
                var data = buffer
                    .Select(bufferData => bufferData & 0xff)
                    .Where(tempData => tempData != 0)
                    .ToList();
                if (!data.Any()) return;
                
                // Save data to ecg cache.
                _ecgCache.AddRange(data);
                    
                // Calculation and processing.
                var ihr = GetInstantaneousHeartRate(data.Last());
                if (ihr == -1) return;
                _logger.LogInformation($"R wave received. Current heart rate:{ihr}");
                _instantaneousHeartRateQueue.Enqueue(ihr);
                if (_instantaneousHeartRateQueue.Count > AveragedCount)
                {
                    _instantaneousHeartRateQueue.Dequeue();
                }
            }
            else
            {
                _logger.LogInformation("Message received, Ignore header.");
                _device.ReadExisting();
                _headerMsgReceived = true;
                _firstDataReceiveTime = DateTime.Now;
            }
        }

        /// <summary>
        /// Get instantaneous heart rate
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private int GetInstantaneousHeartRate(int data)
        {
            var timer = (DateTime.Now - _firstDataReceiveTime).Ticks;

            // Special case: only one data can use
            if (_data0 == -1)
            {
                _data0 = data;
                return -1;
            }

            if (timer - _rt0 > _rms)
            {
                if (_data0 - data > _ar)
                {
                    if (_rt0 == -1)
                    {
                        _rt0 = timer;
                    }
                    else
                    {
                        var result = (int) ((600*1000*1000) / (timer - _rt0));
                        // ignore error case.
                        if (result < 50 || result > 250)
                        {
                            _logger.LogWarning($"R wave received. Data drop:{result}."); 
                            result = -1;
                        }
                        _rt0 = timer;
                        _data0 = data;
                        return result;
                    }
                }
                else
                {
                    _data0 = data;
                    return -1;
                }
            }

            // Storage data to _data0 waiting for next data received.
            _data0 = data;
            return -1;
        }

        /// <summary>
        /// Get average heart rate
        /// </summary>
        /// <returns></returns>
        private int GetAverageHeartRate()
        {
            if (!_instantaneousHeartRateQueue.Any()) return 0;
            var sum = _instantaneousHeartRateQueue.Sum();
            var count = _instantaneousHeartRateQueue.Count;
            return sum / count;
        }

        /// <summary>
        /// Setup ROS bridge with configuration.
        /// </summary>
        private void SetupRosBridge()
        {
            // Startup socket
            var uri = _configuration["ROS:RosBridgeServerAddress"];
            if (string.IsNullOrWhiteSpace(uri))
            {
                _logger.LogCritical("Program Exit: Can't find ROS bridge server address port configuration in appsetting.json");
                Process.GetCurrentProcess().Kill();
            }

            try
            {
                _ros = new RosSocket(new WebSocketSharpProtocol(uri));
            }
            catch (Exception e)
            {
                _logger.LogCritical("Connection with ROS bridge failure!\n" +
                                    "-> Check ROS Core and ROS bridge server with websocket.\n" + 
                                    "-> Restart ROS bridge server and then restart this application.");
            }
            
            // Init tropics
            _debugTopic = _ros.Advertise<Debug>("/driver_ecg/debug");
            _currentTopic = _ros.Advertise<Current>("/driver_ecg/current");
            
            _logger.LogInformation("Ready connection to ROS");
        }

        /// <summary>
        /// Setup ECG hardware device from configuration
        /// </summary>
        private void SetupDevice()
        {
            var port = _configuration["Device:SerialPort"];
            if (string.IsNullOrWhiteSpace(port))
            {
                _logger.LogCritical("Program Exit: Can't find device serial port configuration in appsetting.json");
                Process.GetCurrentProcess().Kill();
            }

            if (!int.TryParse(_configuration["Device:BaudRate"], out var rate))
            {
                _logger.LogWarning("Bad Configuration: Baud rate. Use application default configuration.\n" +
                                   $"{_configuration["Device:BaudRate"]} -> (Default){DefaultBaudRate}");
                rate = DefaultBaudRate;
            }
            
            if (!int.TryParse(_configuration["Device:DataBits"], out var bits))
            {
                _logger.LogWarning("Bad Configuration: Data bits. Use application default configuration.\n" +
                                   $"{_configuration["Device:DataBits"]}] -> (Default)[{DefaultDataBits}");
                rate = DefaultBaudRate;
            }

            _logger.LogInformation("Device target configurations:\n" +
                                   $"Serial Port:\t{port}\n" +
                                   $"Baud Rate:\t{rate}\n" +
                                   $"Data Bits: \t{bits}\n" +
                                   $"Parity:\t\t{DefaultParity}\n" +
                                   $"Stop Bits:\t{DefaultStopBits}");
            
            _device = new SerialPort(port)
            {
                BaudRate = rate,
                Parity = DefaultParity,
                StopBits = DefaultStopBits,
                DataBits = bits
            };
        }
        
        /// <summary>
        /// Change DateTime to system unix timestamp
        /// </summary>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        private (uint sec,uint nsec) GetTimestamp(DateTime dateTime)
        {
            var dt1970 = new DateTime(1970, 1, 1, 0, 0, 0, 0);
            var sec = (dateTime.Ticks - dt1970.Ticks) / 10000000;
            var nsec = (dateTime.Ticks - dt1970.Ticks) - sec*10000000 ;
            return ((uint)sec, (uint)nsec);
        }

        /// <summary>
        /// Search serial ports and update available serial port names. 
        /// </summary>
        private void UpdateAvailableSerialPortNames()
        {
            var list = SerialPort.GetPortNames().ToList();
            if (_availableSerialPortNames.SequenceEqual(list))
            {
                // If equal, do nothing
            }
            else
            {
                // Notice and update current list.
                var builder = new StringBuilder();
                builder.AppendLine("Serial port connection statement changed.");
                foreach (var old in _availableSerialPortNames.Where(old => !list.Contains(old)))
                {
                    builder.AppendLine($"[Remove]\t{old}");
                }
                foreach (var add in list.Where(add => !_availableSerialPortNames.Contains(add)))
                {
                    builder.AppendLine($"[Connect]\t{add}");
                }

                if (_initStartup)
                {
                    _logger.LogInformation(builder.ToString());
                }
                else
                {
                    _logger.LogWarning(builder.ToString());
                }
                _availableSerialPortNames = list;
            }
        }
    }
}