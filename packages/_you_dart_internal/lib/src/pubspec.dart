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
    return _yamlEditor.parseAt(["name"],orElse: ()=>YamlScalar.wrap("")).value;
  }

  set name(String newName) {
    _yamlEditor.update(["name"], newName);
  }

  List<String> get assets {
    return (_yamlEditor.parseAt(["flutter", "assets"]) as List).map((e) => e.toString()).toList();
  }

  Set<String> get assetsSet {
    return (_yamlEditor.parseAt(["flutter", "assets"]) as List).map((e) => e.toString()).toSet();
  }

  void assetsUpdate(List<String> newAssets) {
    var olds = assets;
    for (int i = 0; i < olds.length; i++) {
      if (!newAssets.contains(olds[i])) {
        _yamlEditor.remove(["flutter", "assets", i]);
      }
    }

    for (var e in newAssets) {
      if (!olds.contains(e)) {
        _yamlEditor.appendToList(["flutter", "assets"], e);
      }
    }
  }

  String toYamlString() {
    return _yamlEditor.toString();
  }

  @override
  String toString() {
    return _yamlEditor.toString();
  }
}
