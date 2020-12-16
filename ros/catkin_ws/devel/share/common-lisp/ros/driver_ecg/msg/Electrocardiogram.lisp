; Auto-generated. Do not edit!


(cl:in-package driver_ecg-msg)


;//! \htmlinclude Electrocardiogram.msg.html

(cl:defclass <Electrocardiogram> (roslisp-msg-protocol:ros-message)
  ((Stamp
    :reader Stamp
    :initarg :Stamp
    :type cl:real
    :initform 0)
   (DataArray
    :reader DataArray
    :initarg :DataArray
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass Electrocardiogram (<Electrocardiogram>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Electrocardiogram>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Electrocardiogram)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name driver_ecg-msg:<Electrocardiogram> is deprecated: use driver_ecg-msg:Electrocardiogram instead.")))

(cl:ensure-generic-function 'Stamp-val :lambda-list '(m))
(cl:defmethod Stamp-val ((m <Electrocardiogram>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driver_ecg-msg:Stamp-val is deprecated.  Use driver_ecg-msg:Stamp instead.")
  (Stamp m))

(cl:ensure-generic-function 'DataArray-val :lambda-list '(m))
(cl:defmethod DataArray-val ((m <Electrocardiogram>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader driver_ecg-msg:DataArray-val is deprecated.  Use driver_ecg-msg:DataArray instead.")
  (DataArray m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Electrocardiogram>) ostream)
  "Serializes a message object of type '<Electrocardiogram>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'DataArray))))
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
   (cl:slot-value msg 'DataArray))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Electrocardiogram>) istream)
  "Deserializes a message object of type '<Electrocardiogram>"
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'DataArray) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'DataArray)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Electrocardiogram>)))
  "Returns string type for a message object of type '<Electrocardiogram>"
  "driver_ecg/Electrocardiogram")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Electrocardiogram)))
  "Returns string type for a message object of type 'Electrocardiogram"
  "driver_ecg/Electrocardiogram")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Electrocardiogram>)))
  "Returns md5sum for a message object of type '<Electrocardiogram>"
  "0a9422f8764dc275e6eec28053e841aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Electrocardiogram)))
  "Returns md5sum for a message object of type 'Electrocardiogram"
  "0a9422f8764dc275e6eec28053e841aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Electrocardiogram>)))
  "Returns full string definition for message of type '<Electrocardiogram>"
  (cl:format cl:nil "time Stamp~%int32[] DataArray~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Electrocardiogram)))
  "Returns full string definition for message of type 'Electrocardiogram"
  (cl:format cl:nil "time Stamp~%int32[] DataArray~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Electrocardiogram>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'DataArray) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Electrocardiogram>))
  "Converts a ROS message object to a list"
  (cl:list 'Electrocardiogram
    (cl:cons ':Stamp (Stamp msg))
    (cl:cons ':DataArray (DataArray msg))
))
