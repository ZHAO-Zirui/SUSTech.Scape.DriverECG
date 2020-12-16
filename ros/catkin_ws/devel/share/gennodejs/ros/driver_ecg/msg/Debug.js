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

class Debug {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.RosTime = null;
      this.DateTime = null;
      this.AverageHeartRate = null;
      this.InstantaneousHeartRate = null;
      this.Electrocardiogram = null;
      this.CacheLength = null;
      this.SequenceId = null;
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
      if (initObj.hasOwnProperty('CacheLength')) {
        this.CacheLength = initObj.CacheLength
      }
      else {
        this.CacheLength = 0;
      }
      if (initObj.hasOwnProperty('SequenceId')) {
        this.SequenceId = initObj.SequenceId
      }
      else {
        this.SequenceId = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Debug
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
    // Serialize message field [CacheLength]
    bufferOffset = _serializer.int32(obj.CacheLength, buffer, bufferOffset);
    // Serialize message field [SequenceId]
    bufferOffset = _serializer.uint64(obj.SequenceId, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Debug
    let len;
    let data = new Debug(null);
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
    // Deserialize message field [CacheLength]
    data.CacheLength = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [SequenceId]
    data.SequenceId = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.DateTime.length;
    length += 4 * object.Electrocardiogram.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'driver_ecg/Debug';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '76c689e5f8091168cc6edafa3a989eae';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time RosTime
    string DateTime
    int32 AverageHeartRate
    int32 InstantaneousHeartRate
    int32[] Electrocardiogram
    int32 CacheLength
    uint64 SequenceId
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Debug(null);
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

    if (msg.CacheLength !== undefined) {
      resolved.CacheLength = msg.CacheLength;
    }
    else {
      resolved.CacheLength = 0
    }

    if (msg.SequenceId !== undefined) {
      resolved.SequenceId = msg.SequenceId;
    }
    else {
      resolved.SequenceId = 0
    }

    return resolved;
    }
};

module.exports = Debug;
