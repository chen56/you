// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
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
      Param<Clip> p = obj.use("arg", Clip.none);
      expect(p, obj.get("arg"));

      expect(p.value, Clip.none);
      expect(!p.isNullable, true);
      expect(p.isValue, true);

      Clip c = Clip.none;

      expect(c is Enum, true);
      expect(p.init is Enum, true);

      Param pp = p;
      expect(pp.init is Enum, true);
    });
  });
  group("Enums", () {
    test('cast', () {
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
      Param<double> p = obj.use("width", 1);
      expect(p, obj.get("width"));

      expect(p.value, 1);
      expect(!p.isNullable, true);
      expect(p.isValue, true);
    });
    test('declare(value? )', () {
      Param<double?> p = obj.use<double?>("width", 1);
      expect(p, obj.get("width"));

      expect(p.value, 1);
      expect(p.isNullable, true);
      expect(p.isValue, true);
    });
    test('declare(null)', () {
      Param<double?> p = obj.use<double?>("width", null);
      expect(obj.get("width"), p);

      expect(p.value, null);
      expect(p.isNullable, true);
      expect(p.isValue, true);
    });
  });

  group("declare(Meta)", () {
    test('declare(Meta)', () {
      Param<Container> p = obj.use("mate", ContainerMate(width: 100));
      expect(p, obj.get("mate"));

      expect(p.value is ContainerMate, true);
      expect(!p.isNullable, true);
      expect(p.isObject, true);
    });

    test('declare(Meta?)', () {
      Param<Container?> p = obj.use<Container?>("mate", ContainerMate(width: 100));
      expect(p, obj.get("mate"));

      expect(p.value is ContainerMate, true);
      expect(p.isNullable, true);
      expect(p.isObject, true);
    });

    test('declare(null)', () {
      // null值无法识别其是否是Mate，所以只能作为ValueParam处理
      Param<Container?> p = obj.use<Container?>("mate", null);
      expect(p, obj.get("mate"));

      expect(p.value == null, true);
      expect(p.isNullable, true);
      expect(p.isValue, true);
    });
  });

  group("declare(List)", () {
    test('putList<List?>()', () {
      List<int> origin = [1, 2];
      Param<List<int>> p = obj.useList("list", origin);
      expect(p, obj.get("list"));

      expect(p.value is List, true);
      expect(!p.isNullable, true, reason: "ListParam统一为init可空，返回非空");
      expect(p.isList, true);

      // no error
      List<int> build = p.build();
      expect(build, origin);
    });

    test('declare<List?>(null)', () {
      ListParam<int> p = obj.useList("list", null);
      expect(p, obj.get("list"));

      expect(p.value, [], reason: "ListParam统一为init可空，返回非空");
      expect(p.isNullable, false, reason: "ListParam统一为init可空，返回非空");
      expect(p.isList, true);

      // no error
      List<int> build = p.build();
      expect(build, []);
    });
  });

  group("print test()", () {
    test('list', () {
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
    test("function", () {
      var x = (ElevatedButton(
        onPressed: () {},
        autofocus: false,
        clipBehavior: Clip.none,
        child: Text('ElevatedButton'),
      ));
      print("${x.onPressed.runtimeType}");
    });
  });
}
