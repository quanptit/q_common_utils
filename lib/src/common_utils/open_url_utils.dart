import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'l.dart';

class OpenUrlUtils {
  static openUrlWithExternalApplication(String url) {
    openUrl(url, mode: LaunchMode.externalApplication);
  }

  static openUrl(String url, {LaunchMode mode = LaunchMode.platformDefault}) async {
    debugPrint("openUrl $url");
    try {
      if (!await launchUrlString(url, mode: mode)) {
        throw 'Could not launch $url';
      }
    } catch (err) {
      L.e(err);
    }
  }

  static openStore(String packageName, {String? appStoreId}) async {
    if (Platform.isAndroid) {
      LaunchMode mode = LaunchMode.externalApplication;
      String url = "market://details?id=$packageName";
      try {
        if (await launchUrlString(url, mode: mode)) return;
      } catch (err) {
        L.e(err);
      }

      url = "https://play.google.com/store/apps/details?id=$packageName";
      if (!await launchUrlString(url, mode: mode)) {
        throw 'Could not launch $url';
      }
    }else if(Platform.isIOS && appStoreId!=null){
      String url = 'https://apps.apple.com/app/id$appStoreId';
      if (!await launchUrlString(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }
  }
}
