// ignore_for_file: unnecessary_type_check

import 'package:you_note_dart/src/note/contents/params.dart';
import 'package:flutter_test/flutter_test.dart';

typedef OnClick = void Function();
// ignore: camel_case_types
typedef OnClick_ = void Function(int?)?;

void isInt<T>() {
  // ignore: avoid_print
  print("${T == int}");
}

void main() {
  late ObjectParam obj;
  Editors editors =
      Editors(emitter: defaultEmitter, formatter: defaultDartFormatter);
  setUp(() {
    obj = ObjectParam.root(editors: editors);
  });

  group("editors", () {
    test("core type", () {
      obj.use<int>("offset", 10);
      obj.use<int>("end", 20);

      // ObjectParam sub = obj.useObject("sub", null);
      // sub.use("age", 22);

      expect(
          obj.toCodeExpressionString(), "ObjectParam(offset: 10, end: 20, )");
    });
  });
}
