// ignore_for_file: unused_local_variable

import 'package:learn_flutter/param/param.dart';
import 'package:test/test.dart';

void main() {
  test('Param.ofString()  定义Param', () {
    var root = Params();
    expect(root.path("not exists path").isEmpty, equals(true));
    expect(root.path("not exists path").value, equals("Empty"));

    expect(root.ofString("text.data", value: "default").value, equals("default"));
    expect(root.path("text.data").value, equals("default"));

    expect(root.ofString("text.data", value: "default2").value, equals("default"), reason: "只有第一次初始化有效");
    expect(root.path("text.data").value, equals("default"), reason: "只有第一次初始化有效");
  });

  test('Param.value  runtimeType', () {
    var root = Params();
    expect(root.ofString(next()).value.runtimeType, equals(Null));
    expect(root.ofString(next()).notNull().value, equals(""));
    expect(root.ofString(next()).notNull().value.runtimeType, equals(String));
    expect(root.ofString(next(), value: "s").value.runtimeType, equals(String));
  });
}

Iterator<String> paths = Iterable.generate(100, ((index) => "param.$index")).iterator;
String next() {
  paths.moveNext();
  return paths.current;
}
