import 'package:file/file.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

import '../../bin/you_cli.dart';

void main() {
  late MemoryFileSystem fs;
  File createMemoryPubspecFile(String content) {
    var file = fs.file("/note/pubspec.yaml");
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(content);
    return file;
  }

  group("Pubspec.putNoteAssets", () {
    setUp(() {
      fs = MemoryFileSystem();
      print("setup"); //TODO remove
    });

    test('add', () async {
      File file = createMemoryPubspecFile("""
flutter:
  assets:
    - assets/manual1                   # manual config, keep it
""");
      Pubspec pubspec = await Pubspec.parseFile(file);
      expect(pubspec.assets, ["assets/manual1"]);

      // when
      pubspec.updateAssets(toUpdatePath: "lib/pages/notes/", toUpdate: ["lib/pages/notes/new/"]);

      // then
      expect(pubspec.assets, ['assets/manual1', 'lib/pages/notes/new/']);
    });

    test('remove not exists', () async {
      File file = createMemoryPubspecFile("""
flutter:
  assets:
    - assets/manual1                   # manual config, keep it
    - lib/pages/notes/rm/              # to remove
""");
      Pubspec pubspec = await Pubspec.parseFile(file);
      var old = pubspec.assets;
      expect(old, ["assets/manual1" ,"lib/pages/notes/rm/"]);

      // when
      pubspec.updateAssets(toUpdatePath: "lib/pages/notes/", toUpdate: ["lib/pages/notes/new/"]);

      // then
      expect(pubspec.assets, ['assets/manual1', 'lib/pages/notes/new/']);
    });
  });
}
