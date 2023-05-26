import 'package:flutter_test/flutter_test.dart';
import 'package:mate/mate_core.dart';
import 'package:note/note_dev_gen.dart' as note_gen;
import 'package:mate_flutter/cupertino.dart';

void main() {
  group("gen pages", () {
    test('flatLibPath', () {
      expect(note_gen.flatLibPath("package:note_app/page.dart"), "root");
      expect(note_gen.flatLibPath("package:note_app/1.x/page.dart"), "x");
      expect(note_gen.flatLibPath("package:note_app/n/1.x/page.dart"), "n_x");
    });
  });
  group("mate sample", () {
    test('code', () {
      Mate m = Container$Mate();
      print(m.toRootParam(editors: Editors()).toCodeExpressionString());
    });
  });
}
