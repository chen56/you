import 'dart:collection';

import 'package:flutter/widgets.dart';

/// 判断类型Sub是否是Super的子类型
bool isSubtype<Super, Sub>() {
  return <Sub>[] is List<Super>;
}

class TypeIs<T> {}

isType<T>(Object o, TypeIs<T> type) {
  return o is T;
}

/// 判断类型T是否是nullable的:
///     expect(isNullable<int>(), isFalse);
///     expect(isNullable<int?>(), isTrue);
bool isNullable<T>() {
  return null is T;
}

bool isNullableOf<T>(T t) {
  return null is T;
}

class ListenableMap extends MapBase<String, Object> with ChangeNotifier {
  final Map<String, Object> _attributes = {};

  ListenableMap();

  @override
  Object? operator [](Object? key) {
    return _attributes[key];
  }

  @override
  void operator []=(String key, Object value) {
    _attributes[key] = value;
    notifyListeners();
  }

  @override
  void clear() {
    _attributes.clear();
    notifyListeners();
  }

  @override
  Iterable<String> get keys => _attributes.keys;

  @override
  Object? remove(Object? key) {
    var result = _attributes.remove(key);
    notifyListeners();
    return result;
  }
}
