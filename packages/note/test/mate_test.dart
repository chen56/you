// ignore_for_file: unnecessary_type_check

import 'package:flutter/widgets.dart';
import 'package:note/mate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note/mate_api_experiment.dart';
import 'package:code_builder/code_builder.dart' as code;

void main() {
  late ObjectParam obj;

  setUp(() {
    obj = ObjectParam(
        init: Container(), builder: (m) => Container(), builderRefer: code.refer("Container"));
  });
  group("范型", () {
    test('declare(enum)', () {
      Param<Clip> p = obj.declare("arg", Clip.none);
      expect(p, obj.get("arg"));

      expect(Clip.none, p.value);
      expect(true, !p.isNullable);
      expect(true, p.isValue);

      Clip c = Clip.none;
      // Enum e = Clip.none;

      expect(c is Enum, true);
      expect(p.init is Enum, true);

      Param pp = p;
      expect(pp.init is Enum, true);
    });
  });
  group("Enumss", () {
    test('castss', () {
      bool isEnum<T>(T x) {
        return x is Enum;
      }

      Enum e = DiagnosticLevel.debug;
      DiagnosticLevel? c = DiagnosticLevel.debug;
      expect(isEnum<DiagnosticLevel>(DiagnosticLevel.debug), true);
      expect(isEnum(e), true);
      expect(e is Enum, true);
      expect(c is Enum, true);
      expect(isEnum(c), true);
    });
  });

  group("declare(value)", () {
    test('declare(value)', () {
      Param<double> p = obj.declare("width", 1);
      expect(p, obj.get("width"));

      expect(1, p.value);
      expect(true, !p.isNullable);
      expect(true, p.isValue);
    });
    test('declare(value? )', () {
      Param<double?> p = obj.declare<double?>("width", 1);
      expect(p, obj.get("width"));

      expect(1, p.value);
      expect(true, p.isNullable);
      expect(true, p.isValue);
    });
    test('declare(null)', () {
      Param<double?> p = obj.declare<double?>("width", null);
      expect(p, obj.get("width"));

      expect(null, p.value);
      expect(true, p.isNullable);
      expect(true, p.isValue);
    });
  });

  group("declare(Meta)", () {
    test('declare(Meta)', () {
      Param<Container> p = obj.declare("mate", ContainerMate(width: 100));
      expect(p, obj.get("mate"));

      expect(true, p.value is ContainerMate);
      expect(true, !p.isNullable);
      expect(true, p.isObject);
    });

    test('declare(Meta?)', () {
      Param<Container?> p = obj.declare<Container?>("mate", ContainerMate(width: 100));
      expect(p, obj.get("mate"));

      expect(true, p.value is ContainerMate);
      expect(true, p.isNullable);
      expect(true, p.isObject);
    });

    test('declare(null)', () {
      // null值无法识别其是否是Mate，所以只能作为ValueParam处理
      Param<Container?> p = obj.declare<Container?>("mate", null);
      expect(p, obj.get("mate"));

      expect(true, p.value == null);
      expect(true, p.isNullable);
      expect(true, p.isValue);
    });
  });

  group("declare(List)", () {
    test('putList(List)', () {
      Param<List<int>> p = obj.declare("list", [1, 2]);
      expect(p, obj.get("list"));

      // expect([1, 2], list.toValueList());
      expect(true, p.value is List);
      expect(true, !p.isNullable);
      expect(true, p.isList);
    });

    test('declare(List?)', () {
      Param<List<int>?> p = obj.declare("list", [1, 2]);
      expect(p, obj.get("list"));

      expect(true, p.value is List);
      expect(true, p.isNullable);
      expect(true, p.isList);
    });

    test('declare<List?>(null)', () {
      Param<List<int>?> p = obj.declare("list", null);
      expect(p, obj.get("list"));

      expect(true, p.value == null);
      expect(true, p.isNullable);
      expect(true, p.isList);
    });
  });

  group("toList()", () {
    test('print', () {
      var x = ColumnMate(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ContainerMate(
            width: 100,
            child: CenterMate(
              widthFactor: 100,
            ),
          ),
          ContainerMate(
            width: 100,
            child: CenterMate(
              widthFactor: 100,
            ),
          ),
        ],
      );
      var y = ObjectParam.rootFrom(x);
      y.flat(test: (e) => true).forEach((e) {
        // ignore: avoid_print
        print("${"  " * e.level} ${e.name}");
      });
    });
  });
}
