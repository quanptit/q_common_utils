import 'dart:core';

extension ListExtensions<E> on List<E> {
  List<E> addSkipNull(E? element) {
    if (element != null) add(element);
    return this;
  }
}
