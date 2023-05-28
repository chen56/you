import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:flutter_note/notes/zdraft/dart/analyzer/to_source_visitor.dart';

main() {
  read(File(
      "/usr/local/Cellar/flutter/packages/flutter/lib/src/widgets/async.dart"));
}

class TypeIs<T> {}

isType<T>(Object o, TypeIs<T> type) {
  return o is T;
}

read(File file) {
  ParseStringResult result = parseFile(
      path: file.path, featureSet: FeatureSet.latestLanguageVersion());
  CompilationUnit unit = result.unit;
  unit.visitChildren(X());
  StringBuffer sb = StringBuffer();
  unit.visitChildren(Find(sb));
}

class X extends GeneralizingAstVisitor {
  @override
  visitNode(AstNode node) {
    if (node is FieldDeclaration) {
      return null;
    }
    if (node is Comment ||
        node is CommentReference ||
        node is Assertion ||
        node is BlockFunctionBody ||
        node is Annotation ||
        node is EmptyFunctionBody ||
        node is ConstructorFieldInitializer) {
      return null;
    }

    // print(
    //     "${"  |" * level(node)}+${node.runtimeType}  (${node.beginToken} .. ${node.endToken}) child:> ${cut(node.childEntities, 30)} -  - ${cut(node.toString(), 30)}   ");
    if (node is SimpleFormalParameter) {
      // print("----SimpleFormalParameter ${node.childEntities}");
    }

    for (var c in node.childEntities) {
      if (c is AstNode) {
        c.accept(this);
      } else {
        // print(
        //     "${"  |" * (level(node) + 1)}-${t.runtimeType}  (${t.type} .. ${t.lexeme}) - ${cut(t.toString(), 30)}   ");
      }
    }
    return null;
  }

  int level(AstNode node) {
    return node.parent == null ? 0 : level(node.parent!) + 1;
  }
}

class Find extends ToSourceVisitor {
  Find(super.sink);

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    ParamVisitor v = ParamVisitor(sink);
    node.accept(v);
  }
}

/// 参考[ToSourceVisitor]
class ParamVisitor extends ToSourceVisitor {
  ParamVisitor(super.sink);
}
