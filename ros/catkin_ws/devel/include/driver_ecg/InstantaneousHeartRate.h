// Generated by gencpp from file driver_ecg/InstantaneousHeartRate.msg
// DO NOT EDIT!


#ifndef DRIVER_ECG_MESSAGE_INSTANTANEOUSHEARTRATE_H
#define DRIVER_ECG_MESSAGE_INSTANTANEOUSHEARTRATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace driver_ecg
{
template <class ContainerAllocator>
struct InstantaneousHeartRate_
{
  typedef InstantaneousHeartRate_<ContainerAllocator> Type;

  InstantaneousHeartRate_()
    : Stamp()
    , Data(0)  {
    }
  InstantaneousHeartRate_(const ContainerAllocator& _alloc)
    : Stamp()
    , Data(0)  {
  (void)_alloc;
    }



   typedef ros::Time _Stamp_type;
  _Stamp_type Stamp;

   typedef int32_t _Data_type;
  _Data_type Data;





  typedef boost::shared_ptr< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> const> ConstPtr;

}; // struct InstantaneousHeartRate_

typedef ::driver_ecg::InstantaneousHeartRate_<std::allocator<void> > InstantaneousHeartRate;

typedef boost::shared_ptr< ::driver_ecg::InstantaneousHeartRate > InstantaneousHeartRatePtr;
typedef boost::shared_ptr< ::driver_ecg::InstantaneousHeartRate const> InstantaneousHeartRateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator1> & lhs, const ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator2> & rhs)
{
  return lhs.Stamp == rhs.Stamp &&
    lhs.Data == rhs.Data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator1> & lhs, const ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace driver_ecg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> >
{
  static const char* value()
  {
    return "62319192c96336faca0699ec60ba97af";
  }

  static const char* value(const ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x62319192c96336faULL;
  static const uint64_t static_value2 = 0xca0699ec60ba97afULL;
};

template<class ContainerAllocator>
struct DataType< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> >
{
  static const char* value()
  {
    return "driver_ecg/InstantaneousHeartRate";
  }

  static const char* value(const ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> >
{
  static const char* value()
  {
    return "time Stamp\n"
"int32 Data\n"
;
  }

  static const char* value(const ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.Stamp);
      stream.next(m.Data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct InstantaneousHeartRate_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::driver_ecg::InstantaneousHeartRate_<ContainerAllocator>& v)
  {
    s << indent << "Stamp: ";
    Printer<ros::Time>::stream(s, indent + "  ", v.Stamp);
    s << indent << "Data: ";
    Printer<int32_t>::stream(s, indent + "  ", v.Data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DRIVER_ECG_MESSAGE_INSTANTANEOUSHEARTRATE_H
