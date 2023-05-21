// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:note/mate_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_mate_flutter/material.dart';

void main() {
  late ObjectParam root;

  setUp(() {
    root = ObjectParam.root(editors: Editors());
  });
  group("范型", () {
    test('declare(enum)', () {
      BuilderArg<Clip> p = root.use("arg", Clip.none);
      expect(p, root.get("arg"));

      expect(p.value, Clip.none);
      expect(!p.isNullable, true);
      expect(p.isValue, true);
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
      BuilderArg<double> p = root.use("width", 1);
      expect(p, root.get("width"));

      expect(p.value, 1);
      expect(!p.isNullable, true);
      expect(p.isValue, true);
    });
    test('declare(value? )', () {
      BuilderArg<double?> p = root.use<double?>("width", 1);
      expect(p, root.get("width"));

      expect(p.value, 1);
      expect(p.isNullable, true);
      expect(p.isValue, true);
    });
    test('declare(null)', () {
      BuilderArg<double?> p = root.use<double?>("width", null);
      expect(root.get("width"), p);

      expect(p.value, null);
      expect(p.isNullable, true);
      expect(p.isValue, true);
    });
  });

  group("declare(Meta)", () {
    test('declare(Meta)', () {
      BuilderArg<Container> p = root.use("mate", Container$Mate(width: 100));
      expect(p, root.get("mate"));

      expect(p.value is Container$Mate, true);
      expect(!p.isNullable, true);
      expect(p.isObject, true);
    });

    test('declare(Meta?)', () {
      BuilderArg<Container?> p =
          root.use<Container?>("mate", Container$Mate(width: 100));
      expect(p, root.get("mate"));

      expect(p.value is Container$Mate, true);
      expect(p.isNullable, true);
      expect(p.isObject, true);
    });

    test('declare(null)', () {
      // null值无法识别其是否是Mate，所以只能作为ValueParam处理
      BuilderArg<Container?> p = root.use<Container?>("mate", null);
      expect(p, root.get("mate"));

      expect(p.value == null, true);
      expect(p.isNullable, true);
      expect(p.isValue, true);
    });
  });

  group("declare(List)", () {
    test('putList<List?>()', () {
      List<int> origin = [1, 2];
      BuilderArg<List<int>> p = root.use("list", origin);
      expect(p, root.get("list"));

      expect(p.value is List, true);
      expect(!p.isNullable, true, reason: "ListParam统一为init可空，返回非空");
      expect(p.isList, true);

      // no error
      List<int> build = p.build();
      expect(build, origin);
    });

    test('declare<List?>(null)', () {
      BuilderArg<List<int>?> p = root.use("list", null);
      expect(p, root.get("list"));

      expect(p.value, null);
      expect(p.isNullable, true);
      expect(p.isList, true);

      List<int>? build = p.build();
      expect(build, null);
    });
  });
}
