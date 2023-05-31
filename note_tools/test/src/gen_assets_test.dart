import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_tools/src/note_dev_gen.dart';

MemoryFileSystem fs = MemoryFileSystem();

void main() {
  group("Pubspec.putNoteAssets", () {
    test('normal', () {
      var pubspec = Pubspec.loadSync("""
flutter:
  assets:
    - assets/manual1                   # manual config, keep it
    - lib/notes/                       # previously Generated ,keep it
    - lib/notes/rm/              # previously Generated ,remove it
    - assets/manual2                   # manual config, keep it
""");
      var old = pubspec.assets;
      expect(old,
          ["assets/manual1", "lib/notes/", "lib/notes/rm/", "assets/manual2"]);

      // when
      pubspec.putNoteAssets(["lib/notes/", "lib/notes/new/"]);

      // then
      expect(pubspec.assets,
          ['assets/manual1', 'lib/notes/', 'assets/manual2', 'lib/notes/new/']);
    });
  });
}
