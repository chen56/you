import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

class Pubspec {
  final YamlMap document;

  Pubspec._(this.document);

  static Future<Pubspec> parseFile(File file) async {
    String content = await file.readAsString();
    return parseString(content);
  }

  static Pubspec parseFileSync(File file) {
    String content = file.readAsStringSync();
    return parseString(content);
  }

  static Pubspec parseString(String content) {
    YamlMap document = loadYaml(content);
    return Pubspec._(document);
  }

  String get name => document["name"] as String;
}

class PubspecEdit {
  static const _yamlPathAssets = ["flutter", "assets"];
  late final YamlEditor _yamlEditor;
  late List<String> _assetsCache;

  File file;

  static Future<PubspecEdit> parseFile(File file) async {
    String content = await file.readAsString();
    return PubspecEdit._(file, content);
  }

  static PubspecEdit parseFileSync(File file) {
    String content = file.readAsStringSync();
    return PubspecEdit._(file, content);
  }

  PubspecEdit._(this.file, String content) {
    _yamlEditor = YamlEditor(content);
    _assetsCache = assets;
  }

  List<String> get assets {
    return (_yamlEditor.parseAt(_yamlPathAssets) as List).map((e) => "$e").toList();
  }

  void removeAsset(String noteAsset) {
    _yamlEditor.remove([..._yamlPathAssets, assets.indexOf(noteAsset)]);
  }

  void addAsset(String noteAsset) {
    if (assets.contains(noteAsset)) return;
    _yamlEditor.appendToList([..._yamlPathAssets], noteAsset);
  }

  /// 1. remove previously Generated
  /// 2. add new
  void updateAssets({required String toUpdatePath, required List<String> toUpdate}) {
    List<String> toAdd = List.from(toUpdate, growable: true);

    var oldAssets = assets;
    var removed = 0;
    for (int i = 0; i < oldAssets.length; i++) {
      var oldAsset = oldAssets[i];
      // manual config, leave it
      // lib/routes is our Generated
      if (!oldAsset.startsWith(toUpdatePath)) {
        continue;
      }
      // our Generated, no change , no need to repeat add
      if (toAdd.contains(oldAsset)) {
        toAdd.remove(oldAsset);
        continue;
      }

      // prefix lib/routes is previously Generated ,and now not exists
      _yamlEditor.remove([..._yamlPathAssets, i - removed]);
      removed++;
    }
    for (var add in toAdd) {
      _yamlEditor.appendToList(_yamlPathAssets, add);
    }
  }

  Future<File> save() async {
    const ListEquality<String> listEquality = ListEquality();
    // no change , no need to save
    if (listEquality.equals(_assetsCache, assets)) {
      return Future.value(file);
    }
    return file.writeAsString(_yamlEditor.toString());
  }

  @override
  String toString() {
    return _yamlEditor.toString();
  }
}
