import 'package:flutter_test/flutter_test.dart';

import '../tools/gen_pages.dart';

void main() {
  group("stub", () {
    test('stub', () {
      expect(flatLibPath("package:note_app/page.dart"), "root");
      expect(flatLibPath("package:note_app/1.x/page.dart"), "x");
      expect(flatLibPath("package:note_app/n/1.x/page.dart"), "n_x");
    });
  });
}
