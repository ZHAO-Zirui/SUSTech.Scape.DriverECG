namespace SUSTech.Scape.ECG.RosBridgeClient.MessageTypes.DriverEcg.msg
{
    public class Debug : Current
    {
        public new const string RosMessageName = "driver_ecg/Debug";

        public int CacheLength { get; set; }

        public ulong SequenceId { get; set; }
        
    }
}