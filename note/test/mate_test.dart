// ignore_for_file: unnecessary_type_check

import 'package:flutter/widgets.dart';
import 'package:note/mate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note/mate_api_experiment.dart';

void main() {
  late ObjectParam<Widget?> p;

  setUp(() {
    p = ObjectParam(init: Container());
  });
  test('ObjectParam.pub(atomValue)', () {
    Param<double?> width = p.put("width", 1);
    expect(1, p.get("width").value);
    expect(1, width.value);

    // null
    Param<double?> height = p.put<double?>("height", null);
    expect(null, p.get("height").value);
    expect(null, height.value);
  });

  test('ObjectParam.put(Meta)', () {
    ObjectParam<Container> mate =
        p.put("mate", ContainerMate(width: 100)) as ObjectParam<Container>;
    expect(true, mate.value is ContainerMate);

    Param<Container> getMate = p.get("mate") as ObjectParam<Container>;
    expect(true, getMate.value is ContainerMate);
  });

  test('ObjectParam.put(Meta?)', () {
    {
      ObjectParam<Container?> mate =
          p.put("mate", ContainerMate(width: 100)) as ObjectParam<Container?>;
      expect(true, mate.value is ContainerMate);

      Param<Container?> getMate = p.get("mate") as ObjectParam<Container?>;
      expect(true, getMate.value is ContainerMate);
    }
  });

  test('ObjectParam.put(null)', () {
    {
      // null值无法识别其是否是Mate，所以只能作为ValueParam处理
      ValueParam<Container?> mate = p.put<Container?>("mate", null) as ValueParam<Container?>;
      expect(true, mate.value == null);

      ValueParam<Container?> getMate = p.get("mate") as ValueParam<Container?>;
      expect(true, getMate.value == null);
    }
  });
}
