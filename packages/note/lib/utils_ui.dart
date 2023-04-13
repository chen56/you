import 'dart:collection';

import 'package:flutter/widgets.dart';

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
