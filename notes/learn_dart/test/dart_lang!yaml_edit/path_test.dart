// ignore_for_file: unnecessary_type_check

import 'package:checks/checks.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

void main() {
  test('string.split', () {
    final doc = YamlEditor("""
  name: app
  flutter:
    assets:
  """);
    // doc.update(['flutter'], wrapAsYamlNode({}, collectionStyle: CollectionStyle.BLOCK));
    doc.update(['flutter', "assets"], wrapAsYamlNode(["ss","s"], collectionStyle: CollectionStyle.BLOCK));
    // doc.insertIntoList(['flutter', "assets"], 0, wrapAsYamlNode("images/", scalarStyle: ScalarStyle.SINGLE_QUOTED, collectionStyle: CollectionStyle.BLOCK));

    check(doc.toString()).equals('YAML: test');
  });
}
