import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("code analyzer benchmarks", () {
    ///解析600行的文件 100次，1.7秒，足够做实时解析了
    test("parse", () async {
      File file = File.fromUri(Uri.file("lib/src/note_core.dart"));
      for (var _ in List.generate(100, (i) => i)) {
        var parseResult = parseString(content: file.readAsStringSync(), featureSet: FeatureSet.latestLanguageVersion());
        var unit = parseResult.unit;
        unit.visitChildren(GeneralizingAstVisitor());
      }
    });
  });
}
