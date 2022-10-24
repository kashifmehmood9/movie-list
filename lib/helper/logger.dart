import 'package:flutter/foundation.dart';

class Logger {
  static void log(var argument) {
    if (kDebugMode) {
      debugPrint(argument);
    }
  }
}
