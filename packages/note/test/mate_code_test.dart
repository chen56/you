// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note/mate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note/mate_api_experiment.dart';

void main() {
  setUp(() {});
  String toCode(Mate mate, {format = false}) {
    var y = ObjectParam.rootFrom(mate);
    var result = y.toSampleCodeString(format: format);
    print(result);
    return result;
  }

  group("toList()", () {
    test('print', () {
      expect(
          toCode(
              ColumnMate(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerMate(),
                ],
              ),
              format: true),
          """Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [Container()],
);""");
    });
  });
  group("type:Color", () {
    test('print', () {
      expect(
          toCode(ContainerMate(
            color: Colors.green.shade100,
          )),
          """Container(color: Colors.green.shade100);""");
    });
  });
  group("type:String", () {
    test('print', () {
      expect(toCode(Text$Mate("hello")), """Text('hello');""");
    });
  });
}
