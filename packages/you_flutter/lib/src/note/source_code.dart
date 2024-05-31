import 'package:_you_dart_internal/analyzer.dart';
import 'package:_you_dart_internal/utils.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/memory_file_system.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:source_map_stack_trace/source_map_stack_trace.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:path/path.dart' as path_;
import 'package:source_maps/source_maps.dart' as source_map;

// ignore: implementation_imports, there is no other way i don t want to copy it .
import 'package:analyzer/src/test_utilities/mock_sdk.dart';

typedef _AddCell = ({Block belongTo, MethodInvocation invocation});

class SourceCode {
  final String content;
  final FunctionDeclaration? buildFunction;
  final List<({int lineNo, String content, int offset, int end})> lines;
  final List<(_AddCell element, _AddCell? next)> cellBlocks;

  SourceCode._(this.content, this.buildFunction, this.cellBlocks) : lines = _lines(content).toList();

  factory SourceCode.parse(String content) {
    final result = parseString(content: content, throwIfDiagnostics: true, featureSet: FeatureSet.latestLanguageVersion());
    assert(result.errors.isEmpty, "parse code error: ${result.errors}");
    _CodeVisitor visitor = _CodeVisitor();

    var unit = result.unit;
    unit.visitChildren(visitor);

    Block? findFirstBlockParent(AstNode node) {
      var parent = node.parent;
      if (parent == null) {
        return null;
      }
      if (parent is Block) {
        return parent;
      }
      return findFirstBlockParent(parent);
    }

    List<({MethodInvocation invocation, Block belongTo})> addCells = [];
    for (var i in visitor.cellBlocks) {
      Block? found = findFirstBlockParent(i);
      if (found != null) {
        addCells.add((invocation: i, belongTo: found));
      }
    }
    var addCellWithNextList = collections.combineNext(addCells);

    return SourceCode._(content, visitor.buildFunction, addCellWithNextList.toList());
  }

  //暂时无用，use case要改
  String findCellCodeByLineNo(int lineNo) {
    assert(lineNo <= lines.length);

    return "";
  }

  static String _trimBlankLine(String str) {
    return str.split("\n").where((line) => !strings.isBlank(line)).join("\n");
  }

  int _offsetToLineNo(int offset) {
    for (var line in lines) {
      if (line.offset <= offset && offset <= line.end) {
        return line.lineNo;
      }
    }
    throw AssertionError("The offset:($offset) parameter is out of bounds(${content.length})");
  }

  String line(int lineNo) {
    assert(lineNo <= lines.length);
    return lines[lineNo - 1].content;
  }

  /// return all lines info,
  // line start 1,offset start 0
  static Iterable<({int lineNo, String content, int offset, int end})> _lines(String content) sync* {
    int offset = 0;
    for (var MapEntry(key: index, value: content) in content.split("\n").asMap().entries) {
      yield (lineNo: index + 1, content: content, offset: offset, end: offset + content.length);
      //  '+1' is '\n'
      offset += 1 + content.length;
    }
  }
}

class _CodeVisitor extends GeneralizingAstVisitor {
  FunctionDeclaration? buildFunction;
  List<MethodInvocation> cellBlocks = [];

  _CodeVisitor();

  @override
  visitFunctionDeclaration(FunctionDeclaration node) {
    if (node.name.lexeme == "build") {
      buildFunction = node;
    }
    return super.visitFunctionDeclaration(node);
  }

  @override
  visitMethodInvocation(MethodInvocation node) {
    if (<String>{"CellView"}.contains(node.methodName.name)) {
      cellBlocks.add(node);
    }
    return super.visitMethodInvocation(node);
  }

  @override
  visitExpression(Expression node) {
    debugPrint("visitExpression : ${node.runtimeType}  ${node.staticType} $node");
    return super.visitExpression(node);
  }
}

class CellCallerResult {
  final StackTrace originTrace;
  final StackTrace dartTrace;
  final Frame callerFrame;

  CellCallerResult({required this.originTrace, required this.dartTrace, required this.callerFrame});
}

class CellCaller {
  late final StackTrace originTrace;
  CellCallerResult? _result;

  CellCaller.track() {
    try {
      throw Exception("track caller line");
    } catch (e, trace) {
      originTrace = trace;
    }
  }

  @internal
  Future<CellCallerResult> tryParse(Uri location) async {
    if (_result != null) return _result!;
    return parseCallerInternal(
      originTrace: originTrace,
      location: location,
      jsSourceMapLoader: kIsWeb && !kDebugMode ? (uri) async => (await http.get(uri)).body : null,
    );
  }

  @visibleForTesting
  static Future<CellCallerResult> parseCallerInternal({
    required StackTrace originTrace,
    required Uri location,
    Future<String> Function(Uri uri)? jsSourceMapLoader,
  }) async {
    Frame? findCallerLineInDartTrace(StackTrace stackTrace, Uri location) {
      var trace = Trace.from(stackTrace);
      // 找到堆栈中连续出现的本页面中最后一个Frame，就是哪一行实际触发了异常
      String expected = path_.normalize("${location.path}/page.dart");
      Frame? found;
      for (var frame in trace.frames) {
        if (frame.uri.path.endsWith(expected)) {
          // 找到后别急
          found = frame;
        } else {
          //上一次如果是找到的，就是他，堆栈中连续出现的本页面中最后一个Frame
          if (found != null) {
            return found;
          }
        }
      }
      return found;
    }

    Future<Trace> jsTraceToDartTrace(StackTrace jsTrace) async {
      Uri getJsMapUriFromJsTrace(StackTrace trace) {
        var parsed = Trace.from(trace);
        for (var frame in parsed.frames) {
          // 如果遇到解析不了的行(可能发生在测试中或其他情况)
          if (frame.line == null || frame.uri.path == "unparsed") {
            continue;
          }
          if (path_.basename(frame.uri.path) != "main.dart.js") {
            return frame.uri.replace(path: "${frame.uri.path}.map");
          }
        }
        throw AssertionError("current only support deferred import page, that uri looks like: http://localhost:8080/you/flutter_web/main.dart.js_24.part.js, but your stack: $trace  ");
      }

      Uri jsMapUri = getJsMapUriFromJsTrace(originTrace);
      String sourceMap = await jsSourceMapLoader!(jsMapUri);
      var dartTrace = mapStackTrace(source_map.parse(sourceMap), jsTrace);
      return Trace.from(dartTrace);
    }

    // `jsSourceMapLoader != null` means: `kIsWeb && !kDebugMode`
    var dartTrace = jsSourceMapLoader != null ? await jsTraceToDartTrace(originTrace) : Trace.from(originTrace);
    return CellCallerResult(originTrace: originTrace, dartTrace: dartTrace, callerFrame: findCallerLineInDartTrace(dartTrace, location)!);
  }
}

/// 内存dart sdk, 用于解析要求不高的场景
@internal
class NoteAnalyzer {
  NoteAnalyzer()
      : resourceProvider = MemoryResourceProvider(
            context: path_.Context(
          style: path_.Style.posix,
          current: "/stub",
        )) {
    _ensureFile("/stub/pubspec.yaml", '''
name: stub
version: 0.1.0

environment:
  sdk: '>=3.4.0 <4.0.0'
''');

    File initLibFile = _ensureFile("/stub/lib/__init__.dart", """
var v="first file use by create AnalysisSession";
""");

    String sdkPath = '/sdk';
    createMockSdk(
      resourceProvider: this.resourceProvider,
      root: _ensureFolder(sdkPath),
    );

    var collection = AnalysisContextCollection(
      includedPaths: [initLibFile.path],
      resourceProvider: this.resourceProvider,
      sdkPath: sdkPath,
    );
    session = collection.contexts[0].currentSession;
  }

  final MemoryResourceProvider resourceProvider;

  late final AnalysisSession session;

  /// 测试页即简单的测试：500次 7s
  Future<CompilationUnitReader> getResolvedLibrary(String file) async {
    var result = (await session.getResolvedUnit(path_.normalize(path_.absolute(file))) as ResolvedUnitResult);
    return CompilationUnitReader(result.unit);
  }

  // static Iterable<file_system.Resource> toList(file_system.Resource resource) sync* {
  //   if (resource is file_system.File) {
  //     yield resource;
  //   }
  //   if (resource is file_system.Folder) {
  //     for (var x in resource.getChildren()) {
  //       yield* toList(x);
  //     }
  //   }
  // }

  Folder _ensureFolder(String path) {
    String convertedPath = resourceProvider.convertPath(path);
    return resourceProvider.getFolder(convertedPath)..create();
  }

  File _ensureFile(String path, String content) {
    String convertedPath = resourceProvider.convertPath(path);
    return resourceProvider.getFile(convertedPath)..writeAsStringSync(content);
  }
}
