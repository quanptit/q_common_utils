import 'package:flutter/material.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class RouteAwareWidget extends StatefulWidget {
  final Widget child;

  /// Called when the current route has been pushed.  ==> Like Created. It call after first time Screen Build() call
  final VoidCallback? didPush;
  /// Called when the top route has been popped off, and the current route shows up.  ==> Resume
  final VoidCallback? didPopNext;
  /// Called when the current route has been popped off. ==> Like Dispose
  final VoidCallback? didPop;
   /// Called when a new route has been pushed, and the current route is no longer visible. ==> PAUSE
  final VoidCallback? didPushNext;

  const RouteAwareWidget({Key? key, required this.child, this.didPush, this.didPopNext, this.didPop, this.didPushNext})
      : super(key: key);

  @override
  State<RouteAwareWidget> createState() => _RouteAwareWidgetState();
}

// Implement RouteAware in a widget's state and subscribe it to the RouteObserver.
class _RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() => widget.didPush?.call();

  @override
  void didPopNext() => widget.didPopNext?.call();

  @override
  void didPop() => widget.didPop?.call();

  @override
  void didPushNext() => widget.didPushNext?.call();

  @override
  Widget build(BuildContext context) => widget.child;
}
