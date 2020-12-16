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

class InstantaneousHeartRate {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Stamp = null;
      this.Data = null;
    }
    else {
      if (initObj.hasOwnProperty('Stamp')) {
        this.Stamp = initObj.Stamp
      }
      else {
        this.Stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('Data')) {
        this.Data = initObj.Data
      }
      else {
        this.Data = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InstantaneousHeartRate
    // Serialize message field [Stamp]
    bufferOffset = _serializer.time(obj.Stamp, buffer, bufferOffset);
    // Serialize message field [Data]
    bufferOffset = _serializer.int32(obj.Data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InstantaneousHeartRate
    let len;
    let data = new InstantaneousHeartRate(null);
    // Deserialize message field [Stamp]
    data.Stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [Data]
    data.Data = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'driver_ecg/InstantaneousHeartRate';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '62319192c96336faca0699ec60ba97af';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time Stamp
    int32 Data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InstantaneousHeartRate(null);
    if (msg.Stamp !== undefined) {
      resolved.Stamp = msg.Stamp;
    }
    else {
      resolved.Stamp = {secs: 0, nsecs: 0}
    }

    if (msg.Data !== undefined) {
      resolved.Data = msg.Data;
    }
    else {
      resolved.Data = 0
    }

    return resolved;
    }
};

module.exports = InstantaneousHeartRate;
