import 'package:flutter/foundation.dart';

class L {
  static d(String? log) {
    debugPrint(log);
  }

  static void e(Object err) {
    // ignore: avoid_print
    print("ERROR ============> $err");
  }
}
