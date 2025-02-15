import 'dart:core';

extension ListExtensions<E> on List<E> {
  List<E> addSkipNull(E? element) {
    if (element != null) add(element);
    return this;
  }

  E? firstWhereNullIfNotFound(bool test(E e)){
    try {
      final find = firstWhere((element) =>test(element));
      return find;
    } catch (e) {
      return null;
    }
  }
}
