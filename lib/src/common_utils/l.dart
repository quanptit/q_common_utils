import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class L {
  static var logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      noBoxingByDefault: true
      // Number of method calls to be displayed
      // errorMethodCount: 8,
      // // Number of method calls if stacktrace is provided
      // lineLength: 120,
      // // Width of the output
      // colors: true,
      // // Colorful log messages
      // printEmojis: true,
      // // Print an emoji for each log message
      // // Should each log print contain a timestamp
      // dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static d(dynamic log) {
    if (kDebugMode) {
      // debugPrint(log);
      logger.d(log);
    }
  }

  static void e(dynamic err, {stackTrace}) {
    if (err is Error) {
      logger.e("ERROR ============> $err", error: err, stackTrace: err.stackTrace??stackTrace);
    } else {
      logger.e("ERROR ============> $err");
    }
    // debugPrint("ERROR ============> $err");
  }
}
