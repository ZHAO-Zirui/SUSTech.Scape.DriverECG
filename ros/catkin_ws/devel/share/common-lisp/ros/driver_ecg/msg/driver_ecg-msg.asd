
(cl:in-package :asdf)

(defsystem "driver_ecg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AverageHeartRate" :depends-on ("_package_AverageHeartRate"))
    (:file "_package_AverageHeartRate" :depends-on ("_package"))
    (:file "Current" :depends-on ("_package_Current"))
    (:file "_package_Current" :depends-on ("_package"))
    (:file "Debug" :depends-on ("_package_Debug"))
    (:file "_package_Debug" :depends-on ("_package"))
    (:file "Electrocardiogram" :depends-on ("_package_Electrocardiogram"))
    (:file "_package_Electrocardiogram" :depends-on ("_package"))
    (:file "InstantaneousHeartRate" :depends-on ("_package_InstantaneousHeartRate"))
    (:file "_package_InstantaneousHeartRate" :depends-on ("_package"))
  ))