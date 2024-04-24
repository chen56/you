import 'package:file/file.dart';
import 'package:file/memory.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';

import '../../bin/notecli.dart';



MemoryFileSystem fs = MemoryFileSystem();
NotesGenerator gen = NotesGenerator(packageBaseName: "test_note", fs: fs, projectDir: fs.directory(path.absolute("/note")));
File memoryPubspec(String content) {
  MemoryFileSystem fs = MemoryFileSystem();
  var file = fs.file("/note/pubspec.yaml");
  file.parent.createSync(recursive: true);
  file.writeAsStringSync(content);
  return file;
}

void main() {
  group("Pubspec.putNoteAssets", () {
    test('normal', () async {
      var file = memoryPubspec("""
flutter:
  assets:
    - assets/manual1                   # manual config, keep it
    - lib/pages/                       # previously Generated ,keep it
    - lib/pages/rm/              # previously Generated ,remove it
    - assets/manual2                   # manual config, keep it
""");
      Pubspec pubspec = await Pubspec.parseFile(file);
      var old = pubspec.assets;
      expect(old, ["assets/manual1", "lib/pages/", "lib/pages/rm/", "assets/manual2"]);

      // when
      pubspec.noteAssetsUpdate(["lib/pages/", "lib/pages/new/"]);

      // then
      expect(pubspec.assets, ['assets/manual1', 'lib/pages/', 'assets/manual2', 'lib/pages/new/']);
    });
  });
}
