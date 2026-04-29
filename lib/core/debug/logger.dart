import 'package:flutter/material.dart';

extension OB on Object {
  // Green Color Success or Event
  void get debug => debugPrint('✔️ \x1B[32m${toString()}\x1B[0m');
  // Yellow Color Warning
  void get warning => debugPrint('📍 \x1B[33m${toString()}\x1B[0m');
  // Red Color Error
  void get error => debugPrint('❌ \x1B[31m${toString()}\x1B[0m');
  // Purple color for testing info
  void get info => debugPrint('\x1B[35m${toString()}\x1B[0m');

  void get wtf => debugPrint('🖕🏼 \x1B[31m${toString()}\x1B[0m');
}

extension OdNull on Object? {
  // Green Color Success or Event
  void get debug => debugPrint('✔️ \x1B[32m${toString()}\x1B[0m');
  // Yellow Color Warning
  void get warning => debugPrint('📍 \x1B[33m${toString()}\x1B[0m');
  // Red Color Error
  void get error => debugPrint('❌ \x1B[31m${toString()}\x1B[0m');
  // Purple color for testing info
  void get info => debugPrint('\x1B[35m${toString()}\x1B[0m');

  void get wtf => debugPrint('🖕🏼 \x1B[31m${toString()}\x1B[0m');
}