import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

class UiUtils {
  /// Need add snackbarKey to Root MaterialApp for show no context
  /// MaterialApp(
  //          .....
  //           scaffoldMessengerKey: snackbarKey,
  //           home: const _HomeWidget(),
  //         ),
  static showSnackBar(String text,
      {SnackBarBehavior behavior = SnackBarBehavior
          .floating, BuildContext? context, EdgeInsetsGeometry margin = const EdgeInsets.only(
          bottom: 30, left: 12, right: 12)}) {
    final SnackBar snackBar = SnackBar(content: Text(text), behavior: behavior, margin: margin);
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

  static Future<bool?> showDialogInfo(BuildContext context, {String? title, required String content}) {
    return showAlertDialog(context, content: content, title: title, actions: [TextButton(onPressed: () {
      Navigator.of(context).pop(true);
    }, child: const Text("OK"))
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
}
