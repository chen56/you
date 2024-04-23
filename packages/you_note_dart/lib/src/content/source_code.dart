
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/memory_file_system.dart';
import 'package:analyzer/src/test_utilities/mock_sdk.dart';
import 'package:path/path.dart' as path_;
/// SourceCode : dart file
///   - List<CodeBlock> manyBlocks; // block cut by Print.xxx
class SourceCode {
  final String content;
  final CodeBlock? _build;
  final CompilationUnit compilationUnit;
  final ResolvedUnitResult resolvedUnitResult;

  SourceCode._(this._build, this.resolvedUnitResult)
      : content = resolvedUnitResult.content,
        compilationUnit = resolvedUnitResult.unit;

  // static SourceCode parseFile(String path) {
  //   return SourceCode.parse(io.File(path).readAsStringSync());
  // }

  // static SourceCode parse(String content) {
  //   var parseResult = parseString(content: content, featureSet: FeatureSet.latestLanguageVersion());
  //   var unit = parseResult.unit;
  //   _CodeVisitor visitor = _CodeVisitor(content);
  //   unit.visitChildren(visitor);
  //
  //   return SourceCode._(visitor.build, content, unit);
  // }

  static SourceCode parseUnit(ResolvedUnitResult resolvedUnitResult) {
    _CodeVisitor visitor = _CodeVisitor(resolvedUnitResult.content);
    resolvedUnitResult.unit.visitChildren(visitor);
    return SourceCode._(visitor.build, resolvedUnitResult);
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
  visitFunctionExpressionInvocation(FunctionExpressionInvocation node) {
    print("node: ${node}");
    return super.visitFunctionExpressionInvocation(node);
  }
  @override
  visitMethodInvocation(MethodInvocation node) {
    print("visitMethodInvocation---: $node");
    return super.visitMethodInvocation(node);
  }
}

class CodeAnalyzer {
  final _resourceProvider = MemoryResourceProvider();
  late final AnalysisContextCollection collection;
  late final AnalysisSession session;
  final ({String path, String content}) _defaultInitLib = (
    path: "/lib/note.dart",
    content: """
class Print {
  void call(Object? content) {}
  Cell next() => Cell();
}
class Cell extends Print {
  void call(Object? content) {}
  Cell next() => Cell();
}
  """
  );

  CodeAnalyzer() {
    var libs =  [_defaultInitLib];
    for (var lib in libs) {
      _newFile(lib.path, lib.content);
    }

    String sdkPath = '/sdk';
    createMockSdk(
      resourceProvider: _resourceProvider,
      root: _newFolder(sdkPath),
    );

    collection = AnalysisContextCollection(
      includedPaths: libs.map((e) => e.path).toList(),
      resourceProvider: _resourceProvider,
      sdkPath: sdkPath,
    );
    session = collection.contexts[0].currentSession;
  }

  Future<ResolvedLibraryResult> getResolvedLibrary({required String path, required String content}) async {
    var file = _newFile(_resourceProvider.convertPath(path_.absolute(path)), content);
    return collection.contexts[0].currentSession.getResolvedLibrary(file.path) as ResolvedLibraryResult;
  }

  SomeParsedUnitResult getParsedUnit({required String path, required String content}) {
    var file = _newFile(_resourceProvider.convertPath(path_.absolute(path)), content);
    return collection.contexts[0].currentSession.getParsedUnit(file.path);
  }

  Future<SomeResolvedUnitResult> getResolvedUnit({required String path, required String content}) {
    var file = _newFile(_resourceProvider.convertPath(path_.absolute(path)), content);
    return collection.contexts[0].currentSession.getResolvedUnit(file.path);
  }

  Folder _newFolder(String path) {
    String convertedPath = _resourceProvider.convertPath(path);
    return _resourceProvider.getFolder(convertedPath)..create();
  }

  File _newFile(String path, String content) {
    String convertedPath = _resourceProvider.convertPath(path);
    return _resourceProvider.getFile(convertedPath)..writeAsStringSync(content);
  }
}
