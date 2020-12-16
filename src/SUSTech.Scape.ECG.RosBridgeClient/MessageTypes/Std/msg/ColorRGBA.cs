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
    public class ColorRGBA : Message
    {
        public const string RosMessageName = "std_msgs/ColorRGBA";

        public float r { get; set; }
        public float g { get; set; }
        public float b { get; set; }
        public float a { get; set; }

        public ColorRGBA()
        {
            this.r = 0.0f;
            this.g = 0.0f;
            this.b = 0.0f;
            this.a = 0.0f;
        }

        public ColorRGBA(float r, float g, float b, float a)
        {
            this.r = r;
            this.g = g;
            this.b = b;
            this.a = a;
        }
    }
}