// Auto-generated. Do not edit!

// (in-package driver_ecg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Electrocardiogram {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Stamp = null;
      this.DataArray = null;
    }
    else {
      if (initObj.hasOwnProperty('Stamp')) {
        this.Stamp = initObj.Stamp
      }
      else {
        this.Stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('DataArray')) {
        this.DataArray = initObj.DataArray
      }
      else {
        this.DataArray = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Electrocardiogram
    // Serialize message field [Stamp]
    bufferOffset = _serializer.time(obj.Stamp, buffer, bufferOffset);
    // Serialize message field [DataArray]
    bufferOffset = _arraySerializer.int32(obj.DataArray, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Electrocardiogram
    let len;
    let data = new Electrocardiogram(null);
    // Deserialize message field [Stamp]
    data.Stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [DataArray]
    data.DataArray = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.DataArray.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'driver_ecg/Electrocardiogram';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0a9422f8764dc275e6eec28053e841aa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time Stamp
    int32[] DataArray
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Electrocardiogram(null);
    if (msg.Stamp !== undefined) {
      resolved.Stamp = msg.Stamp;
    }
    else {
      resolved.Stamp = {secs: 0, nsecs: 0}
    }

    if (msg.DataArray !== undefined) {
      resolved.DataArray = msg.DataArray;
    }
    else {
      resolved.DataArray = []
    }

    return resolved;
    }
};

module.exports = Electrocardiogram;
