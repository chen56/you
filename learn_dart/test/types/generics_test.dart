// ignore_for_file: unused_local_variable


import 'package:checks/checks.dart';
import 'package:test/test.dart';

typedef OnClick = void Function();
// ignore: camel_case_types
typedef OnClick_ = void Function()?;

class Value<T> {
  Value(this.value);

  final T value;

  void p() {
    print("$T T == int:${T == int}   ${value.runtimeType is int}");
  }

  Value<T> copyType() {
    return Value<T>(value);
  }
}

void main() {

  group("is 的用法", () {
    test('is string ', () {
      dynamic s = "";
      dynamic b = false;

      check(s is String).equals(true);
      check(b is String).equals(false);
      check(b is! String).equals(true);

    });
  });
  group("类型和可空类型的比较", () {
    test('本质是范型类型T是严格的 ', () {
      Type getType<T>(T arg) => T;

      int i = 1;
      int? i_ = 1;
      Type t = getType<int>(1);
      Type t_ = getType<int?>(1);

      expect(int == i.runtimeType, true);
      expect(int == i_.runtimeType, true);
      expect(i.runtimeType == i_.runtimeType, true);

      expect(t == i.runtimeType, true);
      expect(t == i_.runtimeType, true);

      expect(t_ != i.runtimeType, true);
      expect(t_ != i_.runtimeType, true);

      expect(t_ != t, true);
    });
    test('本质是范型类型T是严格的 Enum ', () {
      Type getType<T>(T arg) => T;

      String i = "str";
      String? i_ = "" as String?;
      Type t = getType<String>(i);
      Type t_ = getType<String?>(i_);

      expect(String == i.runtimeType, true);
      expect(String == i.runtimeType, true);
      expect(String == i_.runtimeType, true);
      expect(i.runtimeType == i_.runtimeType, true);

      expect(t == i.runtimeType, true);
      expect(t == i_.runtimeType, true);

      expect(t_ != i.runtimeType, true);
      expect(t_ != i_.runtimeType, true);

      expect(t_ != t, true);
    });
    test('本质是范型类型T是严格的 Enum ', () {
      List<int> i = [1];
      List<Object> o = i;
      List<Object>? o$ = i;
      var oToI = o as List<int>;
      var o$ToI = o$ as List<int>;
      var o$ToI$ = o$ as List<int>?;
    });
  });
}

bool isNullable<T>() {
  return null is T;
}

/// result = Sub is Super
bool isType<Sub, Super>() {
  return <Sub>[] is List<Super> || <Sub>[] is List<Super?>;
}
