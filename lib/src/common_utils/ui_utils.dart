import 'dart:async';
import 'package:flutter/material.dart';
import 'package:q_common_utils/index.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

class UiUtils {
  /// Need add snackbarKey to Root MaterialApp for show no context
  /// MaterialApp(
  //          .....
  //           scaffoldMessengerKey: snackbarKey,
  //           home: const _HomeWidget(),
  //         ),
  static showSnackBar(String text,
      {SnackBarBehavior behavior = SnackBarBehavior.floating,
      BuildContext? context,
      EdgeInsetsGeometry margin =
          const EdgeInsets.only(bottom: 30, left: 12, right: 12)}) {
    final SnackBar snackBar =
        SnackBar(content: Text(text), behavior: behavior, margin: margin);
    if (context != null) {
      final snackBar = SnackBar(
        content: Text(text),
        behavior: behavior,
        // duration: ,
      );
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      snackbarKey.currentState?.removeCurrentSnackBar();
      snackbarKey.currentState?.showSnackBar(snackBar);
    }
  }

  static Future<bool?> showDialogInfo(BuildContext context,
      {String? title, required String content}) {
    return showAlertDialog(context, content: content, title: title, actions: [
      TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text("OK"))
    ]);
  }

  static Future<bool?> showAlertDialog(BuildContext context,
      {String? title, required String content, required List<Widget> actions}) {
    AlertDialog alert = AlertDialog(
      title: title == null ? null : Text(title),
      content: Text(content),
      actions: actions,
    );

    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void excuteActionAndShowSnackBarState(
      {required FutureOr Function() action,
      String? successMsg,
      String? errorMsg}) async {
    snackbarKey.currentState?.removeCurrentSnackBar();

    SnackBar snackBar;
    void hideSnackbar() {
      snackbarKey.currentState?.removeCurrentSnackBar();
    }

    try {
      await action.call();
      L.d("excuteActionAndShowSnackBarState Success");
      snackBar =
          _createSnackBarWithState(successMsg ?? "Thành công", isError: false);
    } catch (e) {
      L.e(e);
      snackBar = _createSnackBarWithState("${errorMsg ?? ""}$e",
          isError: true, hideSnackbar: hideSnackbar);
    }
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  static void excuteActionAndShowSnackBarStateV2(
      {required FutureOr Function() action,
      String? beforeActionMsg,
      String? successMsg,
      String? errorMsg}) async {
    snackbarKey.currentState?.removeCurrentSnackBar();

    SnackBar snackBar;
    void hideSnackbar() {
      snackbarKey.currentState?.removeCurrentSnackBar();
    }

    if (beforeActionMsg != null && beforeActionMsg.isNotEmpty) {
      snackbarKey.currentState?.showSnackBar(_createSnackBarWithState(
          successMsg ?? beforeActionMsg,
          isError: false));
    }

    try {
      await action.call();
      L.d("excuteActionAndShowSnackBarState Success");
      snackBar =
          _createSnackBarWithState(successMsg ?? "Thành công", isError: false);
    } catch (e) {
      L.e(e);
      snackBar = _createSnackBarWithState("${errorMsg ?? ""}$e",
          isError: true, hideSnackbar: hideSnackbar);
    }
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  static SnackBar _createSnackBarWithState(String message,
      {bool isError = false, VoidCallback? hideSnackbar}) {
    return SnackBar(
      content: isError
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("ERROR",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(message, style: const TextStyle(color: Colors.white)),
              ],
            )
          : Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
      backgroundColor: isError ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
      duration:
          isError ? const Duration(seconds: 30) : const Duration(seconds: 3),
      action: isError
          ? SnackBarAction(
              label: "Close",
              textColor: Colors.white,
              onPressed: () {
                // hideSnackbar?.call();
              },
            )
          : null,
    );
  }

  UiUtils._();
}
