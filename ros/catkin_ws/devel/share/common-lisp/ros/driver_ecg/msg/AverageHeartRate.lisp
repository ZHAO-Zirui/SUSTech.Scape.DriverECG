; Auto-generated. Do not edit!


(cl:in-package driver_ecg-msg)


;//! \htmlinclude AverageHeartRate.msg.html

(cl:defclass <AverageHeartRate> (roslisp-msg-protocol:ros-message)
  ((Stamp
    :reader Stamp
    :initarg :Stamp
    :type cl:real
    :initform 0)
   (Data
    :reader Data
    :initarg :Data
    :type cl:integer
    :initform 0))
)

(cl:defclass AverageHeartRate (<AverageHeartRate>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AverageHeartRate>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AverageHeartRate)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name driver_ecg-msg:<AverageHeartRate> is deprecated: use driver_ecg-msg:AverageHeartRate instead.")))

(cl:ensure-generic-function 'Stamp-val :lambda-list '(m))
(cl:defmethod Stamp-val ((m <AverageHeartRate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driver_ecg-msg:Stamp-val is deprecated.  Use driver_ecg-msg:Stamp instead.")
  (Stamp m))

(cl:ensure-generic-function 'Data-val :lambda-list '(m))
(cl:defmethod Data-val ((m <AverageHeartRate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driver_ecg-msg:Data-val is deprecated.  Use driver_ecg-msg:Data instead.")
  (Data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AverageHeartRate>) ostream)
  "Serializes a message object of type '<AverageHeartRate>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'Stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'Stamp) (cl:floor (cl:slot-value msg 'Stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let* ((signed (cl:slot-value msg 'Data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AverageHeartRate>) istream)
  "Deserializes a message object of type '<AverageHeartRate>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Data) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AverageHeartRate>)))
  "Returns string type for a message object of type '<AverageHeartRate>"
  "driver_ecg/AverageHeartRate")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AverageHeartRate)))
  "Returns string type for a message object of type 'AverageHeartRate"
  "driver_ecg/AverageHeartRate")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AverageHeartRate>)))
  "Returns md5sum for a message object of type '<AverageHeartRate>"
  "62319192c96336faca0699ec60ba97af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AverageHeartRate)))
  "Returns md5sum for a message object of type 'AverageHeartRate"
  "62319192c96336faca0699ec60ba97af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AverageHeartRate>)))
  "Returns full string definition for message of type '<AverageHeartRate>"
  (cl:format cl:nil "time Stamp~%int32 Data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AverageHeartRate)))
  "Returns full string definition for message of type 'AverageHeartRate"
  (cl:format cl:nil "time Stamp~%int32 Data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AverageHeartRate>))
  (cl:+ 0
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AverageHeartRate>))
  "Converts a ROS message object to a list"
  (cl:list 'AverageHeartRate
    (cl:cons ':Stamp (Stamp msg))
    (cl:cons ':Data (Data msg))
))
