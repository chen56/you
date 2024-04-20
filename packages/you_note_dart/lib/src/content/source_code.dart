
import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

class SourceCode {
  final String content;
  final CodeBlock? _build;

  SourceCode._(this._build, this.content);

  static SourceCode parseFile(String path) {
    return SourceCode.parse(File(path).readAsStringSync());
  }

  static SourceCode parse(String content) {
    var parseResult = parseString(content: content, featureSet: FeatureSet.latestLanguageVersion());
    var unit = parseResult.unit;
    _CodeVisitor visitor = _CodeVisitor(content);
    unit.visitChildren(visitor);
    return SourceCode._(visitor.build, content);
  }

  List<CodeBlock> get codesInBuild => _build == null
      ? []
      : _build._children.isEmpty
      ? [_build]
      : _build.children;

  CodeBlock? findCellCode({required int line}) {
    int offset = 0;
    for (var MapEntry(key: i, value: lineContent) in content.split("\n").asMap().entries) {
      if (i + 1 == line) {
        break;
      }
      //  '+1' : '\n'
      offset += 1 + lineContent.length;
    }

    for (var code in codesInBuild) {
      if (code.contains(offset)) {
        return code;
      }
    }
    return null;
  }

  line(int line) {
    var lines = content.split("\n");
    return lines[line - 1];
  }
}

class CodeBlock {
  final String content;
  final int offset;
  final int end;
  final List<CodeBlock> _children = [];

  CodeBlock({required this.offset, required this.end, required this.content});

  int get length => end - offset;

  List<CodeBlock> get children => List.unmodifiable(_children);

  String get blockContent {
    return content.substring(offset, end);
  }

  bool contains(int anOffset) {
    return offset <= anOffset && anOffset <= end;
  }

  @override
  String toString() {
    return "$offset:$end";
  }
}

class _CodeVisitor extends GeneralizingAstVisitor {
  CodeBlock? build;
  final String source;

  _CodeVisitor(this.source);

  @override
  visitFunctionDeclaration(FunctionDeclaration node) {
    if (node.name.lexeme == "build") {
      var body = node.functionExpression.body as BlockFunctionBody;
      var block = body.block;
      build = CodeBlock(content: source, offset: block.leftBracket.end, end: block.rightBracket.offset);
    }
    return super.visitFunctionDeclaration(node);
  }

  @override
  visitExpressionStatement(ExpressionStatement node) {
    // FIXME go back
    var expr = node.expression;
    return super.visitExpressionStatement(node);
  }
}
