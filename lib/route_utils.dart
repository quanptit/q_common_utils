import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AnimateRouteType { rightToLeft, bottomToTop }

class RouteUtils {
  static backPress<T extends Object?>({required BuildContext context, T? result}) {
    Navigator.of(context).pop(result);
  }

  static pushReplacementNamed(BuildContext context, String routerName) {
    return Navigator.pushReplacementNamed(context, routerName);
  }

  static pushNamed(BuildContext context, String routerName) {
    return Navigator.pushNamed(context, routerName);
  }

  /// Pop cho đến khi return true.
  /// ex: Navigator.of(context).popUntil((route){
  //       return route.isFirst;
  //     });
  static void popUtils(BuildContext context, RoutePredicate predicate) {
    Navigator.of(context).popUntil(predicate);
  }

  static Future<dynamic> pushWithMaterialPageRoute({required BuildContext context,required Widget screen}) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => screen));
  }

  static Future<dynamic> push({required BuildContext context,
    required Widget screen,
    AnimateRouteType animateRouteType = AnimateRouteType.rightToLeft}) {
    return Navigator.of(context)
        .push(RouteUtils._createSlideRightRoute(screen: screen, animateRouteType: animateRouteType));
  }

  static Route _createSlideRightRoute({required Widget screen, required AnimateRouteType animateRouteType}) {
    return CupertinoPageRouteCustom(builder: (context) => screen); // suport drag to finish

    // return PageRouteBuilder(
    //   pageBuilder: (context, animation, secondaryAnimation) => screen,
    //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //     final begin =
    //         (animateRouteType == AnimateRouteType.rightToLeft ? const Offset(1.0, 0.0) : const Offset(0.0, 1.0));
    //     const end = Offset.zero;
    //     const curve = Curves.ease;

    //     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    //     return SlideTransition(
    //       position: animation.drive(tween),
    //       child: child,
    //     );
    //   },
    // );
  }
}

/// Alow WillPopScope work with CupertinoPageRoute
class CupertinoPageRouteCustom extends CupertinoPageRoute {
  CupertinoPageRouteCustom({required super.builder});

  @override
  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }

}
