; Auto-generated. Do not edit!


(cl:in-package roomba_node-srv)


;//! \htmlinclude CreateMessage-request.msg.html

(cl:defclass <CreateMessage-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform "")
   (argument1
    :reader argument1
    :initarg :argument1
    :type cl:float
    :initform 0.0))
)

(cl:defclass CreateMessage-request (<CreateMessage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CreateMessage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CreateMessage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roomba_node-srv:<CreateMessage-request> is deprecated: use roomba_node-srv:CreateMessage-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <CreateMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roomba_node-srv:command-val is deprecated.  Use roomba_node-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'argument1-val :lambda-list '(m))
(cl:defmethod argument1-val ((m <CreateMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roomba_node-srv:argument1-val is deprecated.  Use roomba_node-srv:argument1 instead.")
  (argument1 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CreateMessage-request>) ostream)
  "Serializes a message object of type '<CreateMessage-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'argument1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CreateMessage-request>) istream)
  "Deserializes a message object of type '<CreateMessage-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'argument1) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CreateMessage-request>)))
  "Returns string type for a service object of type '<CreateMessage-request>"
  "roomba_node/CreateMessageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CreateMessage-request)))
  "Returns string type for a service object of type 'CreateMessage-request"
  "roomba_node/CreateMessageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CreateMessage-request>)))
  "Returns md5sum for a message object of type '<CreateMessage-request>"
  "8b3e68a0a5fa14bfae984203e5adfb4f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CreateMessage-request)))
  "Returns md5sum for a message object of type 'CreateMessage-request"
  "8b3e68a0a5fa14bfae984203e5adfb4f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CreateMessage-request>)))
  "Returns full string definition for message of type '<CreateMessage-request>"
  (cl:format cl:nil "string command~%float64 argument1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CreateMessage-request)))
  "Returns full string definition for message of type 'CreateMessage-request"
  (cl:format cl:nil "string command~%float64 argument1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CreateMessage-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CreateMessage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CreateMessage-request
    (cl:cons ':command (command msg))
    (cl:cons ':argument1 (argument1 msg))
))
;//! \htmlinclude CreateMessage-response.msg.html

(cl:defclass <CreateMessage-response> (roslisp-msg-protocol:ros-message)
  ((returnvalue
    :reader returnvalue
    :initarg :returnvalue
    :type cl:integer
    :initform 0))
)

(cl:defclass CreateMessage-response (<CreateMessage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CreateMessage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CreateMessage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roomba_node-srv:<CreateMessage-response> is deprecated: use roomba_node-srv:CreateMessage-response instead.")))

(cl:ensure-generic-function 'returnvalue-val :lambda-list '(m))
(cl:defmethod returnvalue-val ((m <CreateMessage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roomba_node-srv:returnvalue-val is deprecated.  Use roomba_node-srv:returnvalue instead.")
  (returnvalue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CreateMessage-response>) ostream)
  "Serializes a message object of type '<CreateMessage-response>"
  (cl:let* ((signed (cl:slot-value msg 'returnvalue)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CreateMessage-response>) istream)
  "Deserializes a message object of type '<CreateMessage-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'returnvalue) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CreateMessage-response>)))
  "Returns string type for a service object of type '<CreateMessage-response>"
  "roomba_node/CreateMessageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CreateMessage-response)))
  "Returns string type for a service object of type 'CreateMessage-response"
  "roomba_node/CreateMessageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CreateMessage-response>)))
  "Returns md5sum for a message object of type '<CreateMessage-response>"
  "8b3e68a0a5fa14bfae984203e5adfb4f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CreateMessage-response)))
  "Returns md5sum for a message object of type 'CreateMessage-response"
  "8b3e68a0a5fa14bfae984203e5adfb4f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CreateMessage-response>)))
  "Returns full string definition for message of type '<CreateMessage-response>"
  (cl:format cl:nil "int64 returnvalue~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CreateMessage-response)))
  "Returns full string definition for message of type 'CreateMessage-response"
  (cl:format cl:nil "int64 returnvalue~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CreateMessage-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CreateMessage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CreateMessage-response
    (cl:cons ':returnvalue (returnvalue msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CreateMessage)))
  'CreateMessage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CreateMessage)))
  'CreateMessage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CreateMessage)))
  "Returns string type for a service object of type '<CreateMessage>"
  "roomba_node/CreateMessage")