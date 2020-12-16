;; Auto-generated. Do not edit!


(when (boundp 'driver_ecg::InstantaneousHeartRate)
  (if (not (find-package "DRIVER_ECG"))
    (make-package "DRIVER_ECG"))
  (shadow 'InstantaneousHeartRate (find-package "DRIVER_ECG")))
(unless (find-package "DRIVER_ECG::INSTANTANEOUSHEARTRATE")
  (make-package "DRIVER_ECG::INSTANTANEOUSHEARTRATE"))

(in-package "ROS")
;;//! \htmlinclude InstantaneousHeartRate.msg.html


(defclass driver_ecg::InstantaneousHeartRate
  :super ros::object
  :slots (_Stamp _Data ))

(defmethod driver_ecg::InstantaneousHeartRate
  (:init
   (&key
    ((:Stamp __Stamp) (instance ros::time :init))
    ((:Data __Data) 0)
    )
   (send-super :init)
   (setq _Stamp __Stamp)
   (setq _Data (round __Data))
   self)
  (:Stamp
   (&optional __Stamp)
   (if __Stamp (setq _Stamp __Stamp)) _Stamp)
  (:Data
   (&optional __Data)
   (if __Data (setq _Data __Data)) _Data)
  (:serialization-length
   ()
   (+
    ;; time _Stamp
    8
    ;; int32 _Data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _Stamp
       (write-long (send _Stamp :sec) s) (write-long (send _Stamp :nsec) s)
     ;; int32 _Data
       (write-long _Data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _Stamp
     (send _Stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _Stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Data
     (setq _Data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get driver_ecg::InstantaneousHeartRate :md5sum-) "62319192c96336faca0699ec60ba97af")
(setf (get driver_ecg::InstantaneousHeartRate :datatype-) "driver_ecg/InstantaneousHeartRate")
(setf (get driver_ecg::InstantaneousHeartRate :definition-)
      "time Stamp
int32 Data

")



(provide :driver_ecg/InstantaneousHeartRate "62319192c96336faca0699ec60ba97af")


