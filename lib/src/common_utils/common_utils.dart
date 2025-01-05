import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'l.dart';

class CommonUtils {
  CommonUtils._();

  static bool isEmpty(List? l) {
    if (l == null) return true;
    return l.isEmpty;
  }

  static Future<void> delayed({required int milliseconds, VoidCallback? runFunction}) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    runFunction?.call();
  }

  // ignore: non_constant_identifier_names
  static double? _ScreenW;

  static double getScreenW(BuildContext context) {
    _ScreenW ??= MediaQuery.of(context).size.width;
    return _ScreenW!;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static String select({required String android, required String ios}) {
    return Platform.isIOS ? ios : android;
  }

  static void excuteSelect({required Function() android, required Function() ios}) {
    if (Platform.isIOS) {
      ios();
    } else {
      android();
    }
  }

  static EdgeInsets selectSize(BuildContext context, {required EdgeInsets small, required EdgeInsets normal}) {
    return isSmall(context) ? small : normal;
  }

  static bool isSmall(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 350;
  }

  //region DataType Convert
  static int? intParse(String? source) {
    return source == null ? null : int.tryParse(source!);
  }

  static double? doubleParse(String? source) {
    return source == null ? null : double.tryParse(source!);
  }

//endregion

//region open url
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
    } else if (Platform.isIOS && appStoreId != null) {
      String url = 'https://apps.apple.com/app/id$appStoreId';
      if (!await launchUrlString(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }
  }
//endregion
}
