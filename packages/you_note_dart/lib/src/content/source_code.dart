import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

/// SourceCode : dart file
///   - List<CodeBlock> manyBlocks; // block cut by Print.xxx
class SourceCode {
  final String content;
  final CodeBlock? _build;
  final CompilationUnit compilationUnit;

  SourceCode._(this._build, this.content, this.compilationUnit);

  static SourceCode parseFile(String path) {
    return SourceCode.parse(File(path).readAsStringSync());
  }

  static SourceCode parse(String content) {
    var parseResult = parseString(content: content, featureSet: FeatureSet.latestLanguageVersion());
    var unit = parseResult.unit;
    _CodeVisitor visitor = _CodeVisitor(content);
    unit.visitChildren(visitor);

    return SourceCode._(visitor.build, content, unit);
  }

  /// note page: inside build() blocks
  List<CodeBlock> get builderBlocks => _build == null
      ? []
      : _build._children.isEmpty
          ? [_build]
          : _build.children;

  CodeBlock? findBlock({required int line}) {
    int offsetOfLine = _lineOffset(content, line);

    for (var code in builderBlocks) {
      if (code.contains(offsetOfLine)) {
        return code;
      }
    }
    return null;
  }

  /// return [line]'s offset
  static int _lineOffset(String content, int line) {
    int offset = 0;
    for (var MapEntry(key: i, value: lineContent) in content.split("\n").asMap().entries) {
      if (i + 1 == line) {
        break;
      }
      //  '+1' : '\n'
      offset += 1 + lineContent.length;
    }
    return offset;
  }

  line(int line) {
    var lines = content.split("\n");
    return lines[line - 1];
  }
}

class CodeBlock {
  final String _compilationUnitContent;
  final int offset;
  final int end;
  final List<CodeBlock> _children = [];

  CodeBlock({required this.offset, required this.end, required String compilationUnitContent}) : _compilationUnitContent = compilationUnitContent;

  int get length => end - offset;

  List<CodeBlock> get children => List.unmodifiable(_children);

  String get code {
    return _compilationUnitContent.substring(offset, end);
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
  final String content;

  _CodeVisitor(this.content);

  @override
  visitFunctionDeclaration(FunctionDeclaration node) {
    if (node.name.lexeme == "build") {
      var body = node.functionExpression.body as BlockFunctionBody;
      var block = body.block;
      build = CodeBlock(compilationUnitContent: content, offset: block.leftBracket.end, end: block.rightBracket.offset);
    }
    return super.visitFunctionDeclaration(node);
  }

  @override
  visitExpressionStatement(ExpressionStatement node) {
    // FIXME go back
    return super.visitExpressionStatement(node);
  }
  @override
  visitMethodInvocation(MethodInvocation node) {
    // TODO: implement visitMethodInvocation
    return super.visitMethodInvocation(node);
  }
}
