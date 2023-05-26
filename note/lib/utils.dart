import 'dart:collection';

import 'package:flutter/widgets.dart';

// todo 这么多utils是咋回事，要删一下
/// result = Sub is Super
bool isType<Sub, Super>() {
  return <Sub>[] is List<Super> || <Sub>[] is List<Super?>;
}

bool isSubTypeOf<Sub, Super>(Sub object) {
  return <Sub>[] is List<Super> || <Sub>[] is List<Super?> || object is Super;
}

/// 判断类型T是否是nullable的:
///     expect(isNullable<int>(), isFalse);
///     expect(isNullable<int?>(), isTrue);
bool isNullable<T>() {
  return null is T;
}

bool isNullableOf<T>(T t) {
  return null is T || t == null;
}

// 集合的直接类型转换会报错：
//     exception : return params.map((e)=>e.build()).toList() as T
// 可以利用原类型集合复制出来做基础，再填充，然后转型就不会错了。
R castList<R>({required Iterable from, required List to}) {
  assert(to is R, "arg to:$to , type should be $R");
//copy same type list
  var result = to.sublist(0, 0);
// or
// var result = to.toList()..clear();

// fill
  for (var e in from) {
    result.add(e);
  }

//cast, no exception ,because : to is R == true
  return result as R;
}

R castSet<R>({required Iterable from, required Set to}) {
  assert(to is R, "arg to:$to , type should be $R");
//copy same type list
  var result = to.toSet();
// or
// var result = to.toList()..clear();

// fill
  for (var e in from) {
    result.add(e);
  }

//cast, no exception ,because : to is R == true
  return result as R;
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

extension StringExt on String {
  String safeSubstring(int start, [int? end]) {
    end ??= length;
    start = start <= length ? start : length;
    end = end <= length ? end : length;
    start = start <= end ? start : end;
    try {
      return substring(start, end);
    } catch (e) {
      throw Exception("safeSubstring($start:$end,$length) $e, string $this");
    }
  }
}
