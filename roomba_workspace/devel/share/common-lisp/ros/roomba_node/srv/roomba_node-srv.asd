
(cl:in-package :asdf)

(defsystem "roomba_node-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ArduinoMessage" :depends-on ("_package_ArduinoMessage"))
    (:file "_package_ArduinoMessage" :depends-on ("_package"))
    (:file "CreateMessage" :depends-on ("_package_CreateMessage"))
    (:file "_package_CreateMessage" :depends-on ("_package"))
  ))