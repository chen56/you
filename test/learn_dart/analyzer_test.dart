import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:learn_flutter/analyzer.dart';

main() {
  read(File(
      "/usr/local/Cellar/flutter/packages/flutter/lib/src/widgets/container.dart"));
}

read(File file) {
  // print(file.readAsStringSync());
  String content = file.readAsStringSync();
  // RegExp regExp = RegExp("");
  ParseStringResult result = parseString(content: content);
  CompilationUnit unit = result.unit;
  StringBuffer sb = StringBuffer();
  unit.visitChildren(ParamVisitor(sb));
  print(sb);
}
