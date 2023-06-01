import 'package:file/local.dart';
import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_tools/src/note_dev_gen.dart';
import 'package:path/path.dart' as path;

MemoryFileSystem fs = MemoryFileSystem();
NotesGenerator gen = NotesGenerator(
    packageBaseName: "test_note", fs: fs, projectDir: path.absolute("/note"));
void main() {
  group("Pubspec.putNoteAssets", () {
    test('normal', () {
      var pubspec = Pubspec.parse("""
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
      pubspec.noteAssetsUpdate(["lib/notes/", "lib/notes/new/"]);

      // then
      expect(pubspec.assets,
          ['assets/manual1', 'lib/notes/', 'assets/manual2', 'lib/notes/new/']);
    });
  });
  group("note assets dir", () {
    test('note assets dir', () {
      // gen.noteLibOf("lib/notes/1.x/note.dart");
      fs.file("./");
      // Glob("**").listFileSystemSync(LocalFileSystem()).forEach(print);
      NotesGenerator(
              packageBaseName: "test_note",
              fs: LocalFileSystem(),
              projectDir: path.absolute("./"))
          .watch()
          .listen((event) {
        // debugPrint("watch: $event");
      });
      ;

      expect(path.normalize("/"), "/");
      expect(path.dirname("note.dart"), ".");
      expect(path.normalize(path.dirname("note.dart")), ".");
    });
  });
}
