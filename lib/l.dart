import 'package:flutter/foundation.dart';

class L {
  // static var logger = Logger();

  static d(dynamic log) {
    if (kDebugMode) {
      debugPrint(log);
      // logger.d(log);
    }
  }

  static void e(dynamic err) {
    // logger.e("ERROR ============> $err");
    debugPrint("ERROR ============> $err");
  }
}
