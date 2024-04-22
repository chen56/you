// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_dart/src/state_json.dart';
import 'package:you_dart/src/state.dart';

JsonConverts jsons = JsonConverts([]);

void main() {
  group("String", () {
    test('string', () {
      T.string("value").checkCurrent('{"field":"value"}');
      T.string("").checkCurrent('{"field":""}');
    });
    test('string?', () {
      T.stringNull(null).checkCurrent('{"field":null}');
      T.stringNull("value").checkCurrent('{"field":"value"}');
    });
    test("load", () {
      // String
      T.string("value").checkLoad('{"field":"value"}', '{"field":"value"}');

      T.string("").checkLoad("{}", '{"field":""}');
      T.string("no override").checkLoad("{}", '{"field":"no override"}');
      T.string("").checkLoad('{"field":null}', '{"field":""}');

      // String?
      T.stringNull("value").checkLoad('{"field":"value"}', '{"field":"value"}');

      T.stringNull().checkLoad("{}", '{"field":null}');
      // TODO 这块逻辑没处理，无值不覆盖
      // T.stringNull("no override,无值不覆盖").checkReJson("{}", '{"field":"no override,无值不覆盖"}');
      T.stringNull("override,有值，哪怕null也覆盖").checkLoad('{"field":null}', '{"field":null}');
    });
  });
  group("DateTime 自定义类型", () {
    test('DateTime', () {
      var store = T.dateTime();
      store.checkCurrent('{"field":"0000-01-01T00:00:00.000Z"}');

      store.testField.value = DateTime.utc(2000);

      store.checkCurrent('{"field":"2000-01-01T00:00:00.000Z"}');
    });
    test('DateTime?', () {
      T.dateTimeNull(null).checkCurrent('{"field":null}');
      T.dateTimeNull(DateTime.utc(2000)).checkCurrent('{"field":"2000-01-01T00:00:00.000Z"}');
    });
    test("load", () {
      // not null
      T.dateTime().checkLoad('{"field":"2000-01-01T00:00:00.000Z"}', '{"field":"2000-01-01T00:00:00.000Z"}');

      T.dateTime(DateTime.utc(2000)).checkLoad("{}", '{"field":"2000-01-01T00:00:00.000Z"}');
      T.dateTime(DateTime.utc(2000)).checkLoad('{"field":null}', '{"field":"2000-01-01T00:00:00.000Z"}');

      // nullable
      T.dateTime(DateTime.utc(2000)).checkLoad('{"field":"2000-01-01T00:00:00.000Z"}', '{"field":"2000-01-01T00:00:00.000Z"}');

      T.dateTimeNull().checkLoad("{}", '{"field":null}');
      // TODO 这块逻辑没处理，无值不覆盖
      // T.dateTimeNull(DateTime.utc(2000)).checkLoad("{}", '{"field":"2000-01-01T00:00:00.000Z"}');
      T.dateTimeNull().checkLoad('{"field":null}', '{"field":null}');
    });
  });
  group("list", () {
    test('list', () {
      var store = T.list(["0", "1"]);
      store.checkCurrent('{"field":["0","1"]}');

      store.testField.addAll(["3"]);
      store.checkCurrent('{"field":["0","1","3"]}');
    });
    test("load", () {
      T.list([]).checkLoad("{}", '{"field":[]}');
      T.list([]).checkLoad('{"field":null}', '{"field":[]}');
    });
  });
}

/// Test Store
final class T<F> extends Store  {
  T(void Function(FieldBuilder) updates) {
    FieldBuilder.build(this, updates);
  }

  F get testField => fields["field"] as F;

  void checkCurrent(String expected) {
    check(jsons.toJsonString(this)).equals(expected);
  }

  void checkLoad(String jsonInput, String expected) {
    jsons.loadJsonString(jsonInput, this);
    check(jsons.toJsonString(this)).equals(expected);
  }

  static T<Value<String>> string([String init = ""]) => T((b) => b.field("field", init.signal()));

  static T<Value<String?>> stringNull([String? init]) => T((b) => b.field("field", init.signal()));

  static T<Value<int>> integer([int init = 0]) => T((b) => b.field("field", init.signal()));

  static T<Value<int?>> integerNull([int? init]) => T((b) => b.field("field", init.signal()));

  static T<Value<DateTime>> dateTime([DateTime? init]) => T((b) => b.field("field", (init ?? DateTime.utc(0)).signal()));

  static T<Value<DateTime?>> dateTimeNull([DateTime? init]) => T((b) => b.field("field", init.signal()));

  static T<List<E>> list<E>(List<E> init) => T((b) => b.field("field", init.signal()));
}
