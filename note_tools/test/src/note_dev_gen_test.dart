import 'package:flutter_test/flutter_test.dart';
import 'package:note_tools/src/note_dev_gen.dart';

void main() {
  group("flatLibPath", () {
    test('normal', () {
      expect(pathToName("zdraft/2.dev/note.dart"), "zdraft_dev");
      expect(pathToName("2.dev/note.dart"), "dev");

      // abstract is ok
      expect(pathToName("/x/note.dart"), "x");
    });
    test('root', () {
      expect(pathToName("note.dart"), "root");

      // abstract is ok
      expect(pathToName("/note.dart"), "root");
    });
    test('数字前缀', () {
      expect(pathToName("1.x/page.dart"), "x");
      expect(pathToName("/notes/1.x/page.dart"), "notes_x");
    });
    test('dartPackageNameParse', () {
      {
        var package = Uri.parse("package:flutter_note/page.dart");
        expect(package.scheme, "package");
        expect("flutter_note", package.pathSegments[0]);
      }
      {
        var package = Uri.parse("dart:ui");
        expect(package.scheme, "dart");
        expect("ui", package.pathSegments[0]);
      }
    });
  });
}
