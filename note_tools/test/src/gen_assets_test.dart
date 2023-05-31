import 'package:file/local.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;
import 'package:yaml_edit/yaml_edit.dart';

void main() {
  group("gen pages", () {
    test('flatLibPath', () {
      LocalFileSystem fs = LocalFileSystem();
      var pubspec =
          fs.file(fs.file(path.absolute("./pubspec.yaml"))).readAsStringSync();
      final yamlEditor = YamlEditor(pubspec);
      List assets = yamlEditor.parseAt(["flutter", "assets"]) as List;
      expect(assets.length, 1);
      expect(assets[0], "assets/");
      assets.add("assets/2/");

      print(yamlEditor.toString());
    });
  });
}

class Pubspec {
  void putNoteAssets(List<String> noteDir) {}
}
