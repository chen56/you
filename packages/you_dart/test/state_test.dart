// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_dart/src/state.dart';

void main() {
  group("not null data is ok", () {
    test('value', () {
      {
        var x = "x".signal();
        check(x()).equals("x");
        x.value = "y";
        check(x()).equals("y");
      }
    });
    test('list', () {
      List<int> x = [1, 2].signal();
      check(x.toList()).deepEquals([1, 2]);

      x.addAll([3, 4]);
      check(x.toList()).deepEquals([1, 2, 3, 4]);

      x.removeLast();
      check(x.toList()).deepEquals([1, 2, 3]);
    });
    test('set', () {
      var x = {1, 2}.signal();
      check(x.toList()).deepEquals([1, 2]);

      x.addAll([3, 4]);
      check(x.toList()).deepEquals([1, 2, 3, 4]);

      x.removeAll({2, 3});
      check(x.toList()).deepEquals([1, 4]);
    });
    test('map', () {
      Map<String, int> x = {"a": 1}.signal();
      check(x.keys.toList()).deepEquals(["a"]);
      check(x.values.toList()).deepEquals([1]);

      x.addAll({"b": 2});
      check(x.keys.toList()).deepEquals(["a", "b"]);
      check(x.values.toList()).deepEquals([1, 2]);

      x.remove("b");
      check(x.keys.toList()).deepEquals(["a"]);
      check(x.values.toList()).deepEquals([1]);
    });
  });

  group(" null data is ok", () {
    test('value', () {
      {
        var x = (null as String?).signal();
        check(x()).equals(null);
        x.value = "y";
        check(x()).equals("y");
      }
      {
        int? i;
        var x = i.signal();
        check(x()).equals(null);
        x.value = 2;
        check(x()).equals(2);
      }
    });
    test('list', () {
      List<int?> x = [null, 2].signal();
      check(x.toList()).deepEquals([null, 2]);

      x.addAll([3, null]);
      check(x.toList()).deepEquals([null, 2, 3, null]);
    });
    test('set', () {
      var x = {null, 2}.signal();
      check(x.toList()).deepEquals([null, 2]);

      x.addAll([3, null]);
      check(x.toList()).deepEquals([null, 2, 3]);
    });
    test('map', () {
      Map<String, int?> x = <String, int?>{"a": null}.signal();
      check(x.keys.toList()).deepEquals(["a"]);
      check(x.values.toList()).deepEquals([null]);

      x.addAll(<String, int?>{"b": 2});
      check(x.keys.toList()).deepEquals(["a", "b"]);
      check(x.values.toList()).deepEquals([null, 2]);
    });
  });
  // TODO 回头看看需要管吗？
  // 暂时不限制重复定义
  // group("multiple definitions 多次调用断言失败", () {
  //   test("value", () {
  //     try {
  //       var s = "1".signal();
  //       s.signal();
  //       fail("not here,should be fail");
  //     } catch (e) {
  //       check(e.toString()).contains('''already signal()''');
  //     }
  //   });
  //   test("list", () {
  //     try {
  //       var s = ["1"].signal();
  //       s.signal();
  //       fail("not here,should be fail");
  //     } catch (e) {
  //       check(e.toString()).contains('''already signal()''');
  //     }
  //   });
  //   test("set", () {
  //     try {
  //       var s = {"1"}.signal();
  //       s.signal();
  //       fail("not here,should be fail");
  //     } catch (e) {
  //       check(e.toString()).contains('''already signal()''');
  //     }
  //   });
  //   test("map", () {
  //     try {
  //       var s = {"a": "b"}.signal();
  //       s.signal();
  //       fail("not here,should be fail");
  //     } catch (e) {
  //       check(e.toString()).contains('''already signal()''');
  //     }
  //   });
  // });
}
