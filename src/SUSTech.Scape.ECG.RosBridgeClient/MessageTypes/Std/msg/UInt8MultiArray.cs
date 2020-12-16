/* 
 * This message is auto generated by ROS#. Please DO NOT modify.
 * Note:
 * - Comments from the original code will be written in their own line 
 * - Variable sized arrays will be initialized to array of size 0 
 * Please report any issues at 
 * <https://github.com/siemens/ros-sharp> 
 */

using SUSTech.Scape.ECG.RosBridgeClient.BaseMessages;

namespace SUSTech.Scape.ECG.RosBridgeClient.MessageTypes.Std.msg
{
    public class UInt8MultiArray : Message
    {
        public const string RosMessageName = "std_msgs/UInt8MultiArray";

        //  Please look at the MultiArrayLayout message definition for
        //  documentation on all multiarrays.
        public MultiArrayLayout layout { get; set; }
        //  specification of data layout
        public byte[] data { get; set; }
        //  array of data

        public UInt8MultiArray()
        {
            this.layout = new MultiArrayLayout();
            this.data = new byte[0];
        }

        public UInt8MultiArray(MultiArrayLayout layout, byte[] data)
        {
            this.layout = layout;
            this.data = data;
        }
    }
}