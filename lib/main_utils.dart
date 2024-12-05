import 'package:flutter/material.dart';
import 'dart:io';

import 'l.dart';

class MyHttpOverrides extends HttpOverrides {
//blindly accept all certificates 
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MainUtils {
  static firstBaseSettingForMain() {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      L.e("FlutterError View Debug console for detail: "+details.toString());
    };
    HttpOverrides.global = MyHttpOverrides();
    WidgetsFlutterBinding.ensureInitialized();
  }

}
