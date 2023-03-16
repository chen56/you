// ignore_for_file: unnecessary_type_check

import 'package:flutter/widgets.dart';
import 'package:note/mate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note/mate_api_experiment.dart';

void main() {
  late ObjectParam<Widget?> obj;

  setUp(() {
    obj = ObjectParam(init: Container(), builder: (m) => Container());
  });

  test("description", () {
    List<String> x = List.empty();
    List<String?> y = x as List<String?>;
    x = y as List<String>;
  });

  group("put(value)", () {
    test('put(value)', () {
      Param<double> p = obj.put("width", 1);
      expect(p, obj.get("width"));
      expect(1, p.value);
      expect(true, !p.isNullable);
      expect(true, p.isValue);
    });
    test('put(value? )', () {
      Param<double?> p = obj.put("width", 1);

      expect(1, obj.get("width").value);
      expect(1, p.value);
      expect(true, p.isNullable);
      expect(true, p.isValue);
    });
    test('put(null)', () {
      Param<double?> p = obj.put<double?>("width", null);
      expect(null, obj.get("width").value);
      expect(null, p.value);
      expect(true, p.isNullable);
      expect(true, p.isValue);
    });
  });

  group("put(Meta)", () {
    test('put(Meta)', () {
      ObjectParam<Container> p =
          obj.put("mate", ContainerMate(width: 100)) as ObjectParam<Container>;
      Param<Container> getP = obj.get("mate") as ObjectParam<Container>;
      expect(p, getP);

      expect(true, p.value is ContainerMate);
      expect(true, !p.isNullable);
      expect(true, p.isObject);
    });

    test('put(Meta?)', () {
      Param<Container?> p = obj.put<Container?>("mate", ContainerMate(width: 100));
      Param<Container?> getP = obj.get("mate") as ObjectParam<Container?>;
      expect(p, getP);

      expect(true, p.value is ContainerMate);
      expect(true, p.isNullable);
      expect(true, p.isObject);
    });

    test('put(null)', () {
      // null值无法识别其是否是Mate，所以只能作为ValueParam处理
      ValueParam<Container?> p = obj.put<Container?>("mate", null) as ValueParam<Container?>;
      ValueParam<Container?> getP = obj.get("mate") as ValueParam<Container?>;
      expect(p, getP);

      expect(true, p.value == null);
      expect(true, p.isNullable);
      expect(true, p.isValue);
    });
  });

  group("putList(List)", () {
    test('putList(List)', () {
      Param<List<int>> p = obj.putList("list", [1, 2]);
      Param<List<int>> getP = obj.get("list");
      expect(p, getP);

      // expect([1, 2], list.toValueList());
      expect(true, p.value is List);
      expect(true, !p.isNullable);
      expect(true, p.isList);
    });

    test('putList(List?)', () {
      Param<List<int>?> p = obj.putList("list", [1, 2]);
      Param<List<int>?> getP = obj.get("list");
      expect(p, getP);

      expect(true, p.value is List);
      expect(true, p.isNullable);
      expect(true, p.isList);
    });

    test('putList(null)', () {
      Param<List<int>?> p = obj.putList("list", null);
      Param<List<int>?> getP = obj.get("list");
      expect(p, getP);

      expect(true, p.value == null);
      expect(true, p.isNullable);
      expect(true, p.isList);
    });
  });
}
