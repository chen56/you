import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("code analyzer", () {
    test("block", () async {//packages/you_note_dart/lib/src/note_core.dart
      File file=File.fromUri(Uri.file("test/code_analyzer/use_case_basic.dart"));
      var parseResult = parseString(content: file.readAsStringSync(), featureSet: FeatureSet.latestLanguageVersion());
      var unit = parseResult.unit;
      unit.visitChildren(CodeVisitor());
    });
  });
}

class CodeVisitor extends GeneralizingAstVisitor{
  @override
  visitFunctionDeclaration(FunctionDeclaration node) {
    return super.visitFunctionDeclaration(node);
  }
 }
