;; Auto-generated. Do not edit!


(when (boundp 'driver_ecg::Current)
  (if (not (find-package "DRIVER_ECG"))
    (make-package "DRIVER_ECG"))
  (shadow 'Current (find-package "DRIVER_ECG")))
(unless (find-package "DRIVER_ECG::CURRENT")
  (make-package "DRIVER_ECG::CURRENT"))

(in-package "ROS")
;;//! \htmlinclude Current.msg.html


(defclass driver_ecg::Current
  :super ros::object
  :slots (_RosTime _DateTime _AverageHeartRate _InstantaneousHeartRate _Electrocardiogram ))

(defmethod driver_ecg::Current
  (:init
   (&key
    ((:RosTime __RosTime) (instance ros::time :init))
    ((:DateTime __DateTime) "")
    ((:AverageHeartRate __AverageHeartRate) 0)
    ((:InstantaneousHeartRate __InstantaneousHeartRate) 0)
    ((:Electrocardiogram __Electrocardiogram) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _RosTime __RosTime)
   (setq _DateTime (string __DateTime))
   (setq _AverageHeartRate (round __AverageHeartRate))
   (setq _InstantaneousHeartRate (round __InstantaneousHeartRate))
   (setq _Electrocardiogram __Electrocardiogram)
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
   ;;
   self)
  )

(setf (get driver_ecg::Current :md5sum-) "05b0a81def6f0a0e8d8bfe927633e4c8")
(setf (get driver_ecg::Current :datatype-) "driver_ecg/Current")
(setf (get driver_ecg::Current :definition-)
      "time RosTime
string DateTime
int32 AverageHeartRate
int32 InstantaneousHeartRate
int32[] Electrocardiogram

")



(provide :driver_ecg/Current "05b0a81def6f0a0e8d8bfe927633e4c8")


