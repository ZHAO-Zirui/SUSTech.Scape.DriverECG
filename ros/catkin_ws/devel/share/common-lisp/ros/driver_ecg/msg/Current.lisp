; Auto-generated. Do not edit!


(cl:in-package driver_ecg-msg)


;//! \htmlinclude Current.msg.html

(cl:defclass <Current> (roslisp-msg-protocol:ros-message)
  ((RosTime
    :reader RosTime
    :initarg :RosTime
    :type cl:real
    :initform 0)
   (DateTime
    :reader DateTime
    :initarg :DateTime
    :type cl:string
    :initform "")
   (AverageHeartRate
    :reader AverageHeartRate
    :initarg :AverageHeartRate
    :type cl:integer
    :initform 0)
   (InstantaneousHeartRate
    :reader InstantaneousHeartRate
    :initarg :InstantaneousHeartRate
    :type cl:integer
    :initform 0)
   (Electrocardiogram
    :reader Electrocardiogram
    :initarg :Electrocardiogram
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass Current (<Current>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Current>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Current)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name driver_ecg-msg:<Current> is deprecated: use driver_ecg-msg:Current instead.")))

(cl:ensure-generic-function 'RosTime-val :lambda-list '(m))
(cl:defmethod RosTime-val ((m <Current>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driver_ecg-msg:RosTime-val is deprecated.  Use driver_ecg-msg:RosTime instead.")
  (RosTime m))

(cl:ensure-generic-function 'DateTime-val :lambda-list '(m))
(cl:defmethod DateTime-val ((m <Current>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driver_ecg-msg:DateTime-val is deprecated.  Use driver_ecg-msg:DateTime instead.")
  (DateTime m))

(cl:ensure-generic-function 'AverageHeartRate-val :lambda-list '(m))
(cl:defmethod AverageHeartRate-val ((m <Current>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driver_ecg-msg:AverageHeartRate-val is deprecated.  Use driver_ecg-msg:AverageHeartRate instead.")
  (AverageHeartRate m))

(cl:ensure-generic-function 'InstantaneousHeartRate-val :lambda-list '(m))
(cl:defmethod InstantaneousHeartRate-val ((m <Current>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driver_ecg-msg:InstantaneousHeartRate-val is deprecated.  Use driver_ecg-msg:InstantaneousHeartRate instead.")
  (InstantaneousHeartRate m))

(cl:ensure-generic-function 'Electrocardiogram-val :lambda-list '(m))
(cl:defmethod Electrocardiogram-val ((m <Current>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driver_ecg-msg:Electrocardiogram-val is deprecated.  Use driver_ecg-msg:Electrocardiogram instead.")
  (Electrocardiogram m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Current>) ostream)
  "Serializes a message object of type '<Current>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'RosTime)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'RosTime) (cl:floor (cl:slot-value msg 'RosTime)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'DateTime))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'DateTime))
  (cl:let* ((signed (cl:slot-value msg 'AverageHeartRate)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'InstantaneousHeartRate)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Electrocardiogram))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'Electrocardiogram))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Current>) istream)
  "Deserializes a message object of type '<Current>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'RosTime) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'DateTime) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'DateTime) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'AverageHeartRate) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'InstantaneousHeartRate) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Electrocardiogram) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Electrocardiogram)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Current>)))
  "Returns string type for a message object of type '<Current>"
  "driver_ecg/Current")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Current)))
  "Returns string type for a message object of type 'Current"
  "driver_ecg/Current")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Current>)))
  "Returns md5sum for a message object of type '<Current>"
  "05b0a81def6f0a0e8d8bfe927633e4c8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Current)))
  "Returns md5sum for a message object of type 'Current"
  "05b0a81def6f0a0e8d8bfe927633e4c8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Current>)))
  "Returns full string definition for message of type '<Current>"
  (cl:format cl:nil "time RosTime~%string DateTime~%int32 AverageHeartRate~%int32 InstantaneousHeartRate~%int32[] Electrocardiogram~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Current)))
  "Returns full string definition for message of type 'Current"
  (cl:format cl:nil "time RosTime~%string DateTime~%int32 AverageHeartRate~%int32 InstantaneousHeartRate~%int32[] Electrocardiogram~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Current>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'DateTime))
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Electrocardiogram) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Current>))
  "Converts a ROS message object to a list"
  (cl:list 'Current
    (cl:cons ':RosTime (RosTime msg))
    (cl:cons ':DateTime (DateTime msg))
    (cl:cons ':AverageHeartRate (AverageHeartRate msg))
    (cl:cons ':InstantaneousHeartRate (InstantaneousHeartRate msg))
    (cl:cons ':Electrocardiogram (Electrocardiogram msg))
))
