import 'package:file/file.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/yaml.dart';


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
      PubspecEdit pubspec =   PubspecEdit.parseFileSync(file);
      expect(pubspec.assets, ["assets/manual1"]);

      // when
      pubspec.updateAssets(toUpdatePath: "lib/routes/notes/", toUpdate: ["lib/routes/notes/new/"]);

      // then
      expect(pubspec.assets, ['assets/manual1', 'lib/routes/notes/new/']);
    });

    test('remove not exists', () async {
      File file = createMemoryPubspecFile("""
flutter:
  assets:
    - assets/manual1                   # manual config, keep it
    - lib/routes/notes/rm/              # to remove
""");
      PubspecEdit pubspec =   PubspecEdit.parseFileSync(file);
      var old = pubspec.assets;
      expect(old, ["assets/manual1" ,"lib/routes/notes/rm/"]);

      // when
      pubspec.updateAssets(toUpdatePath: "lib/routes/notes/", toUpdate: ["lib/routes/notes/new/"]);

      // then
      expect(pubspec.assets, ['assets/manual1', 'lib/routes/notes/new/']);
    });
  });
}
