import 'package:flutter/cupertino.dart';

class LoaderCallbacks {
  final Function({Object? obj})? onLoadedCallback;
  final Function({Object? error})? onLoadFailedCallback;

  LoaderCallbacks({this.onLoadedCallback, this.onLoadFailedCallback});
}

class ShowCallback {
  final Function({Object? obj})? onAdDisplayedCallback;
  final Function({Object? obj})? onAdDisplayFailedCallback;
  final Function({Object? obj})? onAdClickedCallback;
  final Function({Object? obj})? onAdHiddenCallback;

  ShowCallback(
      {this.onAdDisplayedCallback, this.onAdDisplayFailedCallback, this.onAdClickedCallback, this.onAdHiddenCallback});
}

/// đảm bảo callback chỉ thực hiện 1 lần
class VoidCallbackResultWrap {
  final VoidCallback _callback;
  bool _called = false;

  VoidCallbackResultWrap(this._callback);
  
  bool get  isCalled => _called;

  runCallback() {
    if (_called) return;
    _called = true;
    _callback();
  }
}

mixin Cloneable<T>{
  Cloneable<T> clone();
}

enum SliverType{list, grig}
/// Xác định render một list hay grid cho customscrollview
class SliverItemModel {
  final SliverType sliverType;
  final  List<Object> list;

  SliverItemModel({required this.sliverType, required this.list});
}
