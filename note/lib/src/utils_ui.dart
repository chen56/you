/// 基础包，不依赖其他业务代码

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

/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum WindowClass {
  // phone
  compact,
  // pad
  medium,
  // full screen pc
  expanded;

  factory WindowClass.of(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 1400) return WindowClass.expanded;
    if (width >= 900) return WindowClass.medium;
    return WindowClass.compact;
  }
}
