/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/bryant/HackRPI2014/roomba_workspace/src/roomba_node/srv/CreateMessage.srv
 *
 */


#ifndef ROOMBA_NODE_MESSAGE_CREATEMESSAGERESPONSE_H
#define ROOMBA_NODE_MESSAGE_CREATEMESSAGERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace roomba_node
{
template <class ContainerAllocator>
struct CreateMessageResponse_
{
  typedef CreateMessageResponse_<ContainerAllocator> Type;

  CreateMessageResponse_()
    : returnvalue(0)  {
    }
  CreateMessageResponse_(const ContainerAllocator& _alloc)
    : returnvalue(0)  {
    }



   typedef int64_t _returnvalue_type;
  _returnvalue_type returnvalue;




  typedef boost::shared_ptr< ::roomba_node::CreateMessageResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::roomba_node::CreateMessageResponse_<ContainerAllocator> const> ConstPtr;

}; // struct CreateMessageResponse_

typedef ::roomba_node::CreateMessageResponse_<std::allocator<void> > CreateMessageResponse;

typedef boost::shared_ptr< ::roomba_node::CreateMessageResponse > CreateMessageResponsePtr;
typedef boost::shared_ptr< ::roomba_node::CreateMessageResponse const> CreateMessageResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::roomba_node::CreateMessageResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::roomba_node::CreateMessageResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace roomba_node

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::roomba_node::CreateMessageResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::roomba_node::CreateMessageResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::roomba_node::CreateMessageResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::roomba_node::CreateMessageResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::roomba_node::CreateMessageResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::roomba_node::CreateMessageResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::roomba_node::CreateMessageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "36ec9b3b90f6c873a52e6996e7916ed9";
  }

  static const char* value(const ::roomba_node::CreateMessageResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x36ec9b3b90f6c873ULL;
  static const uint64_t static_value2 = 0xa52e6996e7916ed9ULL;
};

template<class ContainerAllocator>
struct DataType< ::roomba_node::CreateMessageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "roomba_node/CreateMessageResponse";
  }

  static const char* value(const ::roomba_node::CreateMessageResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::roomba_node::CreateMessageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 returnvalue\n\
\n\
";
  }

  static const char* value(const ::roomba_node::CreateMessageResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::roomba_node::CreateMessageResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.returnvalue);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct CreateMessageResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::roomba_node::CreateMessageResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::roomba_node::CreateMessageResponse_<ContainerAllocator>& v)
  {
    s << indent << "returnvalue: ";
    Printer<int64_t>::stream(s, indent + "  ", v.returnvalue);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROOMBA_NODE_MESSAGE_CREATEMESSAGERESPONSE_H
