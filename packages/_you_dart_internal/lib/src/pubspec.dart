// ignore_for_file: non_constant_identifier_names,constant_identifier_names

import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

class Pubspec {
  late final YamlEditor _yamlEditor;

  Pubspec.parse(String content) : this._(content);

  Pubspec._(String content) {
    _yamlEditor = YamlEditor(content);
  }

  String get name {
    return _yamlEditor.parseAt(["name"], orElse: () => YamlScalar.wrap("")).value;
  }

  set name(String newName) {
    _yamlEditor.update(["name"], newName);
  }

  YamlMap get flutterNode {
    var empty = wrapAsYamlNode({}, collectionStyle: CollectionStyle.BLOCK);
    var result = _yamlEditor.parseAt(["flutter"], orElse: () => empty) as YamlMap;
    if (empty == result) {
      _yamlEditor.update(["flutter"], empty);
    }
    return result;
  }

  List<String> get assets {
    flutterNode; //ensure init
    var empty = wrapAsYamlNode([], collectionStyle: CollectionStyle.BLOCK);
    YamlList assetsNode = _yamlEditor.parseAt(["flutter", "assets"], orElse: () => empty) as YamlList;
    if (empty == assetsNode) {
      _yamlEditor.update(["flutter", "assets"], empty);
    }
    return assetsNode.map((e) => e.toString()).toList();
  }

  void assetsUpdate(List<String> newAssets) {
    var olds = assets;
    for (int i = 0; i < olds.length; i++) {
      if (!newAssets.contains(olds[i])) {
        _yamlEditor.remove(["flutter", "assets", i]);
      }
    }

    var result = Set.of(assets);
    result.addAll(newAssets);
    _yamlEditor.update(["flutter", "assets"], result.map((e) => wrapAsYamlNode(e, collectionStyle: CollectionStyle.BLOCK)).toList());

    // for (var e in newAssets) {
    //   if (!olds.contains(e)) {
    //     _yamlEditor.appendToList(["flutter", "assets"], wrapAsYamlNode(e,collectionStyle: CollectionStyle.BLOCK));
    //   }
    // }
  }

  String toYamlString() {
    return _yamlEditor.toString();
  }

  @override
  String toString() {
    return _yamlEditor.toString();
  }
}
