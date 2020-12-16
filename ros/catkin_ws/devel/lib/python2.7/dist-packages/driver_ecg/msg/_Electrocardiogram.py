# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from driver_ecg/Electrocardiogram.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy

class Electrocardiogram(genpy.Message):
  _md5sum = "0a9422f8764dc275e6eec28053e841aa"
  _type = "driver_ecg/Electrocardiogram"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """time Stamp
int32[] DataArray
"""
  __slots__ = ['Stamp','DataArray']
  _slot_types = ['time','int32[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       Stamp,DataArray

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Electrocardiogram, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.Stamp is None:
        self.Stamp = genpy.Time()
      if self.DataArray is None:
        self.DataArray = []
    else:
      self.Stamp = genpy.Time()
      self.DataArray = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2I().pack(_x.Stamp.secs, _x.Stamp.nsecs))
      length = len(self.DataArray)
      buff.write(_struct_I.pack(length))
      pattern = '<%si'%length
      buff.write(struct.Struct(pattern).pack(*self.DataArray))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.Stamp is None:
        self.Stamp = genpy.Time()
      end = 0
      _x = self
      start = end
      end += 8
      (_x.Stamp.secs, _x.Stamp.nsecs,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%si'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.DataArray = s.unpack(str[start:end])
      self.Stamp.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2I().pack(_x.Stamp.secs, _x.Stamp.nsecs))
      length = len(self.DataArray)
      buff.write(_struct_I.pack(length))
      pattern = '<%si'%length
      buff.write(self.DataArray.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.Stamp is None:
        self.Stamp = genpy.Time()
      end = 0
      _x = self
      start = end
      end += 8
      (_x.Stamp.secs, _x.Stamp.nsecs,) = _get_struct_2I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%si'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.DataArray = numpy.frombuffer(str[start:end], dtype=numpy.int32, count=length)
      self.Stamp.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I