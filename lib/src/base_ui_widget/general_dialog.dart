
import 'package:flutter/material.dart';

import '../common_utils/route_utils.dart';

class GeneralDialog extends StatefulWidget {
  final Widget child;
  final bool dismisAble;
  final void Function()? onDismiss;
  const GeneralDialog({super.key, required this.child, required this.dismisAble, this.onDismiss});

  @override
  State<GeneralDialog> createState() => _GeneralDialogState();
}

class _GeneralDialogState extends State<GeneralDialog> {
  @override
  Widget build(BuildContext context) {
    if (!widget.dismisAble) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          backgroundColor: Colors.black45,
          body: widget.child,
        ),
      );
    }

    return GestureDetector(
      onTap: () => RouteUtils.backPress(context: context),
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: GestureDetector(onTap: () {}, child: widget.child),
      ),
    );
  }

  @override
  void dispose() {
    widget.onDismiss?.call();
    super.dispose();
  }
}
