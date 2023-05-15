import 'package:flutter/material.dart';

List<Log> logList = [];

class Log {
  String value;
  String time;

  Log(this.value, this.time);

  String get getValue {
    return value;
  }

  String get gettime {
    return time;
  }
}
