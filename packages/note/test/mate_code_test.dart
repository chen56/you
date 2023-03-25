// ignore_for_file: unnecessary_type_check

import 'package:flutter/widgets.dart';
import 'package:note/mate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note/mate_api_experiment.dart';

void main() {
  setUp(() {});

  // fixme 省略init为缺省值的参数ContainerMate(clipBehavior: 'Clip.none')
  group("toList()", () {
    test('print', () {
      var x = ContainerMate(
        width: 100,
        child: ColumnMate(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerMate(),
          ],
        ),
      );
      var y = ObjectParam.rootFrom(x);
      print(y.toCodeString());
    });
  });
}
