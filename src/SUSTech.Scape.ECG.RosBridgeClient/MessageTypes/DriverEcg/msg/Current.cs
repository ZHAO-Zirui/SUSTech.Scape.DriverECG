using SUSTech.Scape.ECG.RosBridgeClient.BaseMessages;
using SUSTech.Scape.ECG.RosBridgeClient.BaseMessages.Std.msg;

namespace SUSTech.Scape.ECG.RosBridgeClient.MessageTypes.DriverEcg.msg
{
    public class Current : Message
    {
        public const string RosMessageName = "driver_ecg/Current";

        public Time RosTime { get; set; } 

        public string DateTime { get; set; }

        public int AverageHeartRate { get; set; }

        public int InstantaneousHeartRate { get; set; }

        public int[] Electrocardiogram { get; set; }
    }
}