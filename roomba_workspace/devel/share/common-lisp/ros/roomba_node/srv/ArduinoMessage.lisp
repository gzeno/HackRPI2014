; Auto-generated. Do not edit!


(cl:in-package roomba_node-srv)


;//! \htmlinclude ArduinoMessage-request.msg.html

(cl:defclass <ArduinoMessage-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass ArduinoMessage-request (<ArduinoMessage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArduinoMessage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArduinoMessage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roomba_node-srv:<ArduinoMessage-request> is deprecated: use roomba_node-srv:ArduinoMessage-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <ArduinoMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roomba_node-srv:command-val is deprecated.  Use roomba_node-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArduinoMessage-request>) ostream)
  "Serializes a message object of type '<ArduinoMessage-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArduinoMessage-request>) istream)
  "Deserializes a message object of type '<ArduinoMessage-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArduinoMessage-request>)))
  "Returns string type for a service object of type '<ArduinoMessage-request>"
  "roomba_node/ArduinoMessageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArduinoMessage-request)))
  "Returns string type for a service object of type 'ArduinoMessage-request"
  "roomba_node/ArduinoMessageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArduinoMessage-request>)))
  "Returns md5sum for a message object of type '<ArduinoMessage-request>"
  "485eb60f460f461f5df4d087b91eb8d3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArduinoMessage-request)))
  "Returns md5sum for a message object of type 'ArduinoMessage-request"
  "485eb60f460f461f5df4d087b91eb8d3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArduinoMessage-request>)))
  "Returns full string definition for message of type '<ArduinoMessage-request>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArduinoMessage-request)))
  "Returns full string definition for message of type 'ArduinoMessage-request"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArduinoMessage-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArduinoMessage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ArduinoMessage-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude ArduinoMessage-response.msg.html

(cl:defclass <ArduinoMessage-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass ArduinoMessage-response (<ArduinoMessage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArduinoMessage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArduinoMessage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roomba_node-srv:<ArduinoMessage-response> is deprecated: use roomba_node-srv:ArduinoMessage-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ArduinoMessage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roomba_node-srv:result-val is deprecated.  Use roomba_node-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArduinoMessage-response>) ostream)
  "Serializes a message object of type '<ArduinoMessage-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArduinoMessage-response>) istream)
  "Deserializes a message object of type '<ArduinoMessage-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArduinoMessage-response>)))
  "Returns string type for a service object of type '<ArduinoMessage-response>"
  "roomba_node/ArduinoMessageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArduinoMessage-response)))
  "Returns string type for a service object of type 'ArduinoMessage-response"
  "roomba_node/ArduinoMessageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArduinoMessage-response>)))
  "Returns md5sum for a message object of type '<ArduinoMessage-response>"
  "485eb60f460f461f5df4d087b91eb8d3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArduinoMessage-response)))
  "Returns md5sum for a message object of type 'ArduinoMessage-response"
  "485eb60f460f461f5df4d087b91eb8d3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArduinoMessage-response>)))
  "Returns full string definition for message of type '<ArduinoMessage-response>"
  (cl:format cl:nil "int64 result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArduinoMessage-response)))
  "Returns full string definition for message of type 'ArduinoMessage-response"
  (cl:format cl:nil "int64 result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArduinoMessage-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArduinoMessage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ArduinoMessage-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ArduinoMessage)))
  'ArduinoMessage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ArduinoMessage)))
  'ArduinoMessage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArduinoMessage)))
  "Returns string type for a service object of type '<ArduinoMessage>"
  "roomba_node/ArduinoMessage")