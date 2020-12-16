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

class Current {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.RosTime = null;
      this.DateTime = null;
      this.AverageHeartRate = null;
      this.InstantaneousHeartRate = null;
      this.Electrocardiogram = null;
    }
    else {
      if (initObj.hasOwnProperty('RosTime')) {
        this.RosTime = initObj.RosTime
      }
      else {
        this.RosTime = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('DateTime')) {
        this.DateTime = initObj.DateTime
      }
      else {
        this.DateTime = '';
      }
      if (initObj.hasOwnProperty('AverageHeartRate')) {
        this.AverageHeartRate = initObj.AverageHeartRate
      }
      else {
        this.AverageHeartRate = 0;
      }
      if (initObj.hasOwnProperty('InstantaneousHeartRate')) {
        this.InstantaneousHeartRate = initObj.InstantaneousHeartRate
      }
      else {
        this.InstantaneousHeartRate = 0;
      }
      if (initObj.hasOwnProperty('Electrocardiogram')) {
        this.Electrocardiogram = initObj.Electrocardiogram
      }
      else {
        this.Electrocardiogram = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Current
    // Serialize message field [RosTime]
    bufferOffset = _serializer.time(obj.RosTime, buffer, bufferOffset);
    // Serialize message field [DateTime]
    bufferOffset = _serializer.string(obj.DateTime, buffer, bufferOffset);
    // Serialize message field [AverageHeartRate]
    bufferOffset = _serializer.int32(obj.AverageHeartRate, buffer, bufferOffset);
    // Serialize message field [InstantaneousHeartRate]
    bufferOffset = _serializer.int32(obj.InstantaneousHeartRate, buffer, bufferOffset);
    // Serialize message field [Electrocardiogram]
    bufferOffset = _arraySerializer.int32(obj.Electrocardiogram, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Current
    let len;
    let data = new Current(null);
    // Deserialize message field [RosTime]
    data.RosTime = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [DateTime]
    data.DateTime = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [AverageHeartRate]
    data.AverageHeartRate = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [InstantaneousHeartRate]
    data.InstantaneousHeartRate = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Electrocardiogram]
    data.Electrocardiogram = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.DateTime.length;
    length += 4 * object.Electrocardiogram.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'driver_ecg/Current';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '05b0a81def6f0a0e8d8bfe927633e4c8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time RosTime
    string DateTime
    int32 AverageHeartRate
    int32 InstantaneousHeartRate
    int32[] Electrocardiogram
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Current(null);
    if (msg.RosTime !== undefined) {
      resolved.RosTime = msg.RosTime;
    }
    else {
      resolved.RosTime = {secs: 0, nsecs: 0}
    }

    if (msg.DateTime !== undefined) {
      resolved.DateTime = msg.DateTime;
    }
    else {
      resolved.DateTime = ''
    }

    if (msg.AverageHeartRate !== undefined) {
      resolved.AverageHeartRate = msg.AverageHeartRate;
    }
    else {
      resolved.AverageHeartRate = 0
    }

    if (msg.InstantaneousHeartRate !== undefined) {
      resolved.InstantaneousHeartRate = msg.InstantaneousHeartRate;
    }
    else {
      resolved.InstantaneousHeartRate = 0
    }

    if (msg.Electrocardiogram !== undefined) {
      resolved.Electrocardiogram = msg.Electrocardiogram;
    }
    else {
      resolved.Electrocardiogram = []
    }

    return resolved;
    }
};

module.exports = Current;
