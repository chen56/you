// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:note/mate_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_mate_flutter/material.dart';

void main() {
  setUp(() {});
  String toCode(Mate mate, {format = false}) {
    var y = ObjectParam.rootFromMate(mate, editors: Editors());
    var result = y.toSampleCode(format: format);
    // ignore: avoid_print
    print(result);
    return result;
  }

  group("toList()", () {
    test('print', () {
      print("xxxx: ${toCode(Column$Mate(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container$Mate(),
            ],
          ), format: true)}");
      expect(
          toCode(
              Column$Mate(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container$Mate(),
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
          toCode(Container$Mate(
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
