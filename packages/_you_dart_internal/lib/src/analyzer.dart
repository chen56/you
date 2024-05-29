/// 本包与应用逻辑无关的common analyzer逻辑
library;

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/file_system/file_system.dart' as file_system;
import 'package:analyzer/file_system/memory_file_system.dart';
import 'package:code_builder/code_builder.dart';

import 'package:path/path.dart' as path_;

// ignore: implementation_imports, there is no other way i don t want to copy it .
import 'package:analyzer/src/test_utilities/mock_sdk.dart';

/// 实验mock sdk 看能否用element模式而不是ast，未成功暂放
class MemoryFsAnalyzer {
  MemoryFsAnalyzer() {
    _ensureFile("/pkg/pubspec.yaml", '''
name: mock_lib
version: 0.1.0

environment:
  sdk: '>=3.4.0 <4.0.0'
''');

    file_system.File initLibFile = _ensureFile("/pkg/lib/__init__.dart", """
var v="first file use by create session";
""");
    ;

    String sdkPath = '/sdk';
    createMockSdk(
      resourceProvider: _resourceProvider,
      root: _ensureFolder(sdkPath),
    );

    var collection = AnalysisContextCollection(
      includedPaths: [initLibFile.path],
      resourceProvider: _resourceProvider,
      sdkPath: sdkPath,
    );
    session = collection.contexts[0].currentSession;
  }

  final MemoryResourceProvider _resourceProvider = MemoryResourceProvider();
  late final AnalysisSession session;
  /// 测试页即简单的测试：500次 7s
  Future<CompilationUnitReader> getResolvedLibrary({required String path, required String content}) async {
    var file = _ensureFile(path_.absolute(path), content);
    return CompilationUnitReader.resolve(session, file.path);
  }

  static Iterable<file_system.Resource> toList(file_system.Resource resource) sync* {
    if (resource is file_system.File) {
      yield resource;
    }
    if (resource is file_system.Folder) {
      for (var x in resource.getChildren()) {
        yield* toList(x);
      }
    }
  }

  file_system.Folder _ensureFolder(String path) {
    String convertedPath = _resourceProvider.convertPath(path);
    return _resourceProvider.getFolder(convertedPath)..create();
  }

  file_system.File _ensureFile(String path, String content) {
    String convertedPath = _resourceProvider.convertPath(path);
    return _resourceProvider.getFile(convertedPath)..writeAsStringSync(content);
  }
}

class CompilationUnitReader {
  CompilationUnitReader(this.unit);

  static Future<CompilationUnitReader> resolve(AnalysisSession analysisSession, String file) async {
    var result = (await analysisSession.getResolvedUnit(path_.normalize(path_.absolute(file))) as ResolvedUnitResult);
    assert(result.errors.isEmpty, "expect no error, but:${result.errors}");
    return CompilationUnitReader(result.unit);
  }

  final CompilationUnit unit;

  CompilationUnitElement get declared => unit.declaredElement!;

  LibraryElement get library => declared.library;

  FunctionElement? topFunction(String name) {
    for (var function in declared.functions) {
      if (function.name == name) {
        return function;
      }
    }
    return null;
  }

  ({FunctionElement func, ElementAnnotation element, Annotation ast, DartObject value})? annotationOnTopFunction({required String funcName, required String annoType, String? annoUrl}) {
    var func = topFunction(funcName);
    if (func == null) return null;

    for (var meta in func.metadata) {
      var value = meta.computeConstantValue();

      assert(value != null);

      var t = value!.type;
      if (t == null) continue;

      if (t is! InterfaceType) continue;
      var findAnnoType = [t, ...t.allSupertypes].where((e) => e.getDisplayString(withNullability: true) == annoType).firstOrNull;
      if (findAnnoType == null) continue;
      if (annoUrl != null) {
        var publicExportFrom = findPublicExportLib(findAnnoType, library);
        if (publicExportFrom?.identifier == annoUrl) continue;
      }

      Iterable<Annotation> annotations = _findAstNodeByType<Annotation>(unit);
      var annotationAst = annotations.where((e) => e.elementAnnotation == meta).first;
      return (func: func, element: meta, ast: annotationAst, value: value);
    }

    return null;
  }

  static Iterable<FIND> _findAstNodeByType<FIND>(AstNode node) sync* {
    if (node is FIND) yield node as FIND;
    for (var i in node.childEntities) {
      if (i is! AstNode) continue;
      yield* _findAstNodeByType(i);
    }
  }

  ClassElement? class_(String name) {
    final type = library.exportNamespace.get(name);
    return type is ClassElement ? type : null;
  }
}

class AnnotationReader {
  AnnotationReader(this.annotation, this.dartObject, this.unit);

  // ignore: constant_identifier_names
  static const String SUPERCLASS_FIELD = "(super)";

  final Annotation annotation;
  final DartObject dartObject;
  final CompilationUnitReader unit;

  DartObject? getField(String name) {
    return _getField(dartObject, name);
  }

  /// dartObject.getField只能拿到当前对象的字段，而父类型字段都放在[SUPERCLASS_FIELD]里
  static DartObject? _getField(DartObject dartObject, String name) {
    var field = dartObject.getField(name);
    if (field != null) return field;

    DartObject? superObject = dartObject.getField(SUPERCLASS_FIELD);
    if (superObject == null) return null;
    return _getField(superObject, name);
  }

  Reference? getFieldTypeAsRef(String name) {
    var type = getField(name)?.toTypeValue();
    if (type == null) return null;
    var symbol = type.getDisplayString(withNullability: true);
    if (symbol == "") return null;
    var publicExportFrom = findPublicExportLib(type, unit.library);
    var url = publicExportFrom?.identifier;
    return refer(symbol, url);
  }
}

/// given a internal lib: package:you_flutter/src/router.dart
///     =>  find it's public export : package:you_flutter/router.dart
LibraryElement? findPublicExportLib(DartType toFind, LibraryElement useAt) {
  for (var import in useAt.importedLibraries) {
    for (var MapEntry(key: _, value: value) in import.exportNamespace.definedNames.entries) {
      if (toFind.element == value) {
        return import;
      }
    }
  }
  return toFind.element!.library;
}
