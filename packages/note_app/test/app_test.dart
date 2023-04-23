import 'package:flutter_test/flutter_test.dart';
import 'package:note/mate.dart';
import 'package:note_mate_flutter/cupertino.dart';

import '../tools/gen_pages.dart';

void main() {
  group("gen pages", () {
    test('flatLibPath', () {
      expect(flatLibPath("package:note_app/page.dart"), "root");
      expect(flatLibPath("package:note_app/1.x/page.dart"), "x");
      expect(flatLibPath("package:note_app/n/1.x/page.dart"), "n_x");
    });
  });
  group("mate sample", () {
    test('code', () {
      Mate m = Container$Mate();
      print(m.toRootParam(editors: Editors()).toCodeExpressionString());
    });
  });
}
