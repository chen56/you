// ignore_for_file: unused_local_variable

import 'package:learn_flutter/src/note/param.dart';
import 'package:test/test.dart';

void main() {
  test('Param.ofString()  定义Param', () {
    {
      var param = Params();
      expect(param.ofString("a").value, equals(null));
      expect(param.ofString("a").value, equals(null));
      expect(param.ofString("a").isNullable, equals(true));

      //初始化value
      expect(param.ofString("a").nullable("default"), equals("default"));
      expect(param.ofString("a").value, equals("default"));
      expect(param.ofString("a").isNullable, equals(true));

      //再次init 无效
      expect(param.ofString("a").nullable("new default"), equals("default"));
      expect(param.ofString("a").nullable("new default"), equals("default"));
      expect(param.ofString("a").notNull("new default"), equals("default"));
    }

  });

  test('Param.value  runtimeType', () {
    var root = Params();
    expect(root.ofString(next()).value.runtimeType, equals(Null));
    expect(root.ofString(next()).nullable("default").runtimeType, equals(String));
    expect(root.ofString(next()).notNull("value").runtimeType,
        equals(String));
  });

  test('Param.ofString()  定义Param', () {
    var param = Params();
    expect(param.path("not exists path").isEmpty, equals(true));
    expect(param.path("not exists path").value, equals("Empty"));

    param.ofString("not exists path");
    expect(param.path("not exists path").isEmpty, equals(false));
    expect(param.path("not exists path").value, equals(null));
  });

  test('Param.value  runtimeType', () {
    var root = Params();
    expect(root.ofString(next()).value.runtimeType, equals(Null));
    expect(root.ofString(next()).nullable("default").runtimeType, equals(String));
    expect(root.ofString(next()).notNull("value").runtimeType,
        equals(String));
  });
}

Iterator<String> paths =
    Iterable.generate(100, ((index) => "param.$index")).iterator;

String next() {
  paths.moveNext();
  return paths.current;
}
