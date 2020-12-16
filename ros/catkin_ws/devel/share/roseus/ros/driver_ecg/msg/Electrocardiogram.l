;; Auto-generated. Do not edit!


(when (boundp 'driver_ecg::Electrocardiogram)
  (if (not (find-package "DRIVER_ECG"))
    (make-package "DRIVER_ECG"))
  (shadow 'Electrocardiogram (find-package "DRIVER_ECG")))
(unless (find-package "DRIVER_ECG::ELECTROCARDIOGRAM")
  (make-package "DRIVER_ECG::ELECTROCARDIOGRAM"))

(in-package "ROS")
;;//! \htmlinclude Electrocardiogram.msg.html


(defclass driver_ecg::Electrocardiogram
  :super ros::object
  :slots (_Stamp _DataArray ))

(defmethod driver_ecg::Electrocardiogram
  (:init
   (&key
    ((:Stamp __Stamp) (instance ros::time :init))
    ((:DataArray __DataArray) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _Stamp __Stamp)
   (setq _DataArray __DataArray)
   self)
  (:Stamp
   (&optional __Stamp)
   (if __Stamp (setq _Stamp __Stamp)) _Stamp)
  (:DataArray
   (&optional __DataArray)
   (if __DataArray (setq _DataArray __DataArray)) _DataArray)
  (:serialization-length
   ()
   (+
    ;; time _Stamp
    8
    ;; int32[] _DataArray
    (* 4    (length _DataArray)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _Stamp
       (write-long (send _Stamp :sec) s) (write-long (send _Stamp :nsec) s)
     ;; int32[] _DataArray
     (write-long (length _DataArray) s)
     (dotimes (i (length _DataArray))
       (write-long (elt _DataArray i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _Stamp
     (send _Stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _Stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _DataArray
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _DataArray (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _DataArray i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get driver_ecg::Electrocardiogram :md5sum-) "0a9422f8764dc275e6eec28053e841aa")
(setf (get driver_ecg::Electrocardiogram :datatype-) "driver_ecg/Electrocardiogram")
(setf (get driver_ecg::Electrocardiogram :definition-)
      "time Stamp
int32[] DataArray

")



(provide :driver_ecg/Electrocardiogram "0a9422f8764dc275e6eec28053e841aa")


