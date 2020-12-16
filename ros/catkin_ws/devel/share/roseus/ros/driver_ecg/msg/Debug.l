;; Auto-generated. Do not edit!


(when (boundp 'driver_ecg::Debug)
  (if (not (find-package "DRIVER_ECG"))
    (make-package "DRIVER_ECG"))
  (shadow 'Debug (find-package "DRIVER_ECG")))
(unless (find-package "DRIVER_ECG::DEBUG")
  (make-package "DRIVER_ECG::DEBUG"))

(in-package "ROS")
;;//! \htmlinclude Debug.msg.html


(defclass driver_ecg::Debug
  :super ros::object
  :slots (_RosTime _DateTime _AverageHeartRate _InstantaneousHeartRate _Electrocardiogram _CacheLength _SequenceId ))

(defmethod driver_ecg::Debug
  (:init
   (&key
    ((:RosTime __RosTime) (instance ros::time :init))
    ((:DateTime __DateTime) "")
    ((:AverageHeartRate __AverageHeartRate) 0)
    ((:InstantaneousHeartRate __InstantaneousHeartRate) 0)
    ((:Electrocardiogram __Electrocardiogram) (make-array 0 :initial-element 0 :element-type :integer))
    ((:CacheLength __CacheLength) 0)
    ((:SequenceId __SequenceId) 0)
    )
   (send-super :init)
   (setq _RosTime __RosTime)
   (setq _DateTime (string __DateTime))
   (setq _AverageHeartRate (round __AverageHeartRate))
   (setq _InstantaneousHeartRate (round __InstantaneousHeartRate))
   (setq _Electrocardiogram __Electrocardiogram)
   (setq _CacheLength (round __CacheLength))
   (setq _SequenceId (round __SequenceId))
   self)
  (:RosTime
   (&optional __RosTime)
   (if __RosTime (setq _RosTime __RosTime)) _RosTime)
  (:DateTime
   (&optional __DateTime)
   (if __DateTime (setq _DateTime __DateTime)) _DateTime)
  (:AverageHeartRate
   (&optional __AverageHeartRate)
   (if __AverageHeartRate (setq _AverageHeartRate __AverageHeartRate)) _AverageHeartRate)
  (:InstantaneousHeartRate
   (&optional __InstantaneousHeartRate)
   (if __InstantaneousHeartRate (setq _InstantaneousHeartRate __InstantaneousHeartRate)) _InstantaneousHeartRate)
  (:Electrocardiogram
   (&optional __Electrocardiogram)
   (if __Electrocardiogram (setq _Electrocardiogram __Electrocardiogram)) _Electrocardiogram)
  (:CacheLength
   (&optional __CacheLength)
   (if __CacheLength (setq _CacheLength __CacheLength)) _CacheLength)
  (:SequenceId
   (&optional __SequenceId)
   (if __SequenceId (setq _SequenceId __SequenceId)) _SequenceId)
  (:serialization-length
   ()
   (+
    ;; time _RosTime
    8
    ;; string _DateTime
    4 (length _DateTime)
    ;; int32 _AverageHeartRate
    4
    ;; int32 _InstantaneousHeartRate
    4
    ;; int32[] _Electrocardiogram
    (* 4    (length _Electrocardiogram)) 4
    ;; int32 _CacheLength
    4
    ;; uint64 _SequenceId
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _RosTime
       (write-long (send _RosTime :sec) s) (write-long (send _RosTime :nsec) s)
     ;; string _DateTime
       (write-long (length _DateTime) s) (princ _DateTime s)
     ;; int32 _AverageHeartRate
       (write-long _AverageHeartRate s)
     ;; int32 _InstantaneousHeartRate
       (write-long _InstantaneousHeartRate s)
     ;; int32[] _Electrocardiogram
     (write-long (length _Electrocardiogram) s)
     (dotimes (i (length _Electrocardiogram))
       (write-long (elt _Electrocardiogram i) s)
       )
     ;; int32 _CacheLength
       (write-long _CacheLength s)
     ;; uint64 _SequenceId
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _SequenceId (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _SequenceId) (= (length (_SequenceId . bv)) 2)) ;; bignum
              (write-long (ash (elt (_SequenceId . bv) 0) 0) s)
              (write-long (ash (elt (_SequenceId . bv) 1) -1) s))
             ((and (class _SequenceId) (= (length (_SequenceId . bv)) 1)) ;; big1
              (write-long (elt (_SequenceId . bv) 0) s)
              (write-long (if (>= _SequenceId 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _SequenceId s)(write-long (if (>= _SequenceId 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _RosTime
     (send _RosTime :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _RosTime :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _DateTime
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _DateTime (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _AverageHeartRate
     (setq _AverageHeartRate (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _InstantaneousHeartRate
     (setq _InstantaneousHeartRate (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _Electrocardiogram
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Electrocardiogram (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _Electrocardiogram i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32 _CacheLength
     (setq _CacheLength (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint64 _SequenceId
     
#+(or :alpha :irix6 :x86_64)
      (setf _SequenceId (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _SequenceId (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get driver_ecg::Debug :md5sum-) "76c689e5f8091168cc6edafa3a989eae")
(setf (get driver_ecg::Debug :datatype-) "driver_ecg/Debug")
(setf (get driver_ecg::Debug :definition-)
      "time RosTime
string DateTime
int32 AverageHeartRate
int32 InstantaneousHeartRate
int32[] Electrocardiogram
int32 CacheLength
uint64 SequenceId

")



(provide :driver_ecg/Debug "76c689e5f8091168cc6edafa3a989eae")


