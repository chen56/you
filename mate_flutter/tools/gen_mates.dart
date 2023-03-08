import 'dart:collection';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart' as t;
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:code_builder/code_builder.dart' as code;
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import "package:path/path.dart" as path;

import 'env.dart';

// ref: ElementDisplayStringBuilder
main() async {
  _log("## main");

  List<String> include = [
    // "package:flutter/",
    "package:flutter/src/rendering/box.dart"
  ];

  gen(
    env: Env(),
    entryFile: path.normalize(path.absolute("tools/gen_mates_sample.dart")),
    libFilter: (lib) =>
        lib.identifier.endsWith(".dart") && include.any((uri) => lib.identifier.startsWith(uri)),
    // writeFS: MemoryFileSystem(),
    writeFS: LocalFileSystem(),
    writeTo: (lib) {
      String toFile = path.join("lib", lib.identifier.replaceFirst("package:flutter/", ""));
      _log("output: $toFile");
      return toFile;
    },
    dartFormatter: DartFormatter(pageWidth: 120),
  );
}

Future<void> gen({
  required Env env,
  required String entryFile, //入口lib的文件绝对路径
  required FileSystem writeFS,
  required bool Function(LibraryElement lib) libFilter, //void Function(LibraryBuilder) updates
  required String Function(LibraryElement lib) writeTo,
  required DartFormatter dartFormatter, //void Function(LibraryBuilder) updates
}) async {
  _log("## resolve entry lib");
  final collection = AnalysisContextCollection(
    includedPaths: [entryFile],
    sdkPath: env.sdkDir,
    resourceProvider: PhysicalResourceProvider.INSTANCE,
  );
  var entryLib = (await collection.contexts.first.currentSession.getResolvedLibrary(entryFile)
          as ResolvedLibraryResult)
      .element;

  _log("## collect lib, create LibNode tree and remove duplicate");
  Set<LibraryElement> allMateLibs = {};
  LibNode root = LibNode(entryLib, children: entryLib.importedLibraries, allLibs: allMateLibs);

  _log("## output collectAllTypes");
  TypeRefers allTypes = root.collectAllTypes();
  for (var key in allTypes.keys) {
    _log("${key}:${allTypes[key]!.identifier}");
  }

  _log("## gen lib mate");
  root.debugLog();
  for (var lib in allMateLibs.where(libFilter).toList()) {
    _genLibMate(
        writeFS: writeFS,
        writeTo: writeTo,
        lib: lib,
        dartFormatter: dartFormatter,
        typeRefers: allTypes);
  }
  _log("## over!");
}

class TypeRefers extends MapBase<Element, LibraryElement> {
  Map<Element, LibraryElement> typeRefers = {};

  @override
  LibraryElement? operator [](Object? key) {
    return typeRefers[key];
  }

  @override
  void operator []=(Element key, LibraryElement value) {
    typeRefers[key] = value;
  }

  @override
  void clear() {
    typeRefers.clear();
  }

  @override
  Iterable<Element> get keys => typeRefers.keys;

  @override
  LibraryElement? remove(Object? key) {
    return typeRefers.remove(key);
  }

  Reference elementRef(Element element, {required ClassElement inClass}) {
    if (inClass.name.startsWith("UniqueWidget")) {
      _log("createRefer $element");
    }
    if (element is ParameterElement) {
      DartType type = element.type;
      return typeRef(type, inClass: inClass);
    }
    if (element is TypeParameterElement) {
      // LibraryElement? lib = this[element.bound];
      //
      TypeReference ref = TypeReference((b) {
        b.symbol = element.name;
        if (element.bound == null) {
          return;
        }
        b.types.add(typeRef(element.bound!, inClass: inClass));
      });
      return ref;
    }

    throw UnimplementedError(
        "element type:${element.runtimeType} not implemented : ${element.source?.uri.path}");
  }

  Reference typeRef(DartType type, {required ClassElement inClass}) {
    LibraryElement? lib = this[type.element];
    if (type is t.ParameterizedType) {
      TypeReference ref = TypeReference((b) => b
        ..symbol = type.element?.name
        ..isNullable = type.nullabilitySuffix == NullabilitySuffix.question
        ..url = lib?.identifier
        ..types.addAll(type.typeArguments.map((e) => typeRef(e, inClass: inClass))));
      return ref;
    }
    if (type is t.FunctionType) {
      code.FunctionType ref = code.FunctionType((b) => b
        ..returnType = typeRef(type.returnType, inClass: inClass)
        ..types.addAll(type.typeFormals
            .where((e) => e.bound != null)
            .map((e) => typeRef(e.bound!, inClass: inClass)))
        ..requiredParameters.addAll(type.parameters
            .where((e) => e.isPositional)
            .map((e) => typeRef(e.type, inClass: inClass)))
        ..namedParameters.addEntries(type.parameters
            .where((e) => e.isOptionalNamed)
            .map((e) => MapEntry(e.name, typeRef(e.type, inClass: inClass))))
        ..namedRequiredParameters.addEntries(type.parameters
            .where((e) => e.isRequiredNamed)
            .map((e) => MapEntry(e.name, typeRef(e.type, inClass: inClass))))
        ..optionalParameters.addAll(type.parameters
            .where((e) => e.isPositional)
            .map((e) => typeRef(e.type, inClass: inClass)))
        ..symbol = null
        ..isNullable = type.nullabilitySuffix == NullabilitySuffix.question
        ..url = lib?.identifier);
      return ref;
    }

    _log("TypeRefers.createRefer: default - ${type.runtimeType} : $type");
    if (lib == null) {
      _log("TypeRefers.createRefer: not found ref: $type");
    }
    // final result = refer("$type", lib?.identifier);
    return Reference(type.getDisplayString(withNullability: true), lib?.identifier);
  }
}

/*
how to import a type
--------------------
material.dart
  export src/material/about.dart
    AboutDialog -> import material.dart
  export widgets.dart
    export 'src/widgets/app.dart';
      WidgetsApp -> import widgets.dart

* */
class LibNode {
  final List<LibNode> _children = List.empty(growable: true);
  LibNode? parent;
  LibraryElement lib;

  LibNode(
    this.lib, {
    this.parent,
    required List<LibraryElement> children,
    required Set<LibraryElement> allLibs,
  }) {
    allLibs.add(lib);
    for (final child in children) {
      if (allLibs.contains(child)) {
        continue;
      }
      _children.add(LibNode(
        child,
        parent: this,
        children: child.exportedLibraries,
        allLibs: allLibs,
      ));
    }
  }

  TypeRefers collectAllTypes() {
    TypeRefers result = TypeRefers();
    for (final mate in toList()) {
      for (final e in mate.lib.exportNamespace.definedNames.values) {
        result.putIfAbsent(e, () => mate.firstPublicLib);
      }
      for (final importLib in mate.lib.importedLibraries) {
        for (final e in importLib.exportNamespace.definedNames.values) {
          result.putIfAbsent(e, () => importLib);
        }
      }
    }
    return result;
  }

  int get level => parent == null ? 0 : parent!.level + 1;

  String get path => parent == null ? lib.identifier : "${lib.identifier}:${parent!.path}";

  bool get isPublic => !lib.source.uri.path.startsWith("src/");

  LibraryElement get firstPublicLib => isPublic ? lib : parent!.firstPublicLib;

  List<LibNode> toList({bool includeThis = true}) {
    var flatChildren = _children.expand((child) {
      return child.toList(includeThis: true);
    }).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  debugLog() {
    for (var lib in toList()) {
      _log("${"  " * lib.level}${lib.path}");
    }
  }
}

// class SyntaxErrorInAssetException
//   constructor
//     parameterassetId  AssetId   AssetId assetId
//     parameterfilesWithErrors  List<AnalysisResultWithErrors>   List<AnalysisResultWithErrors> filesWithErrors
void _genLibMate({
  required FileSystem writeFS,
  required LibraryElement lib,
  required String Function(LibraryElement lib) writeTo,
  required DartFormatter dartFormatter,
  required TypeRefers typeRefers,
}) {
  _log("_genLibMate: identifier:${lib.identifier} importedLibraries:${lib.importedLibraries}  ");
  // dart.core dart.io等sdk内部库暂时不支持
  bool importFilter(LibraryImportElement libImport) {
    bool notPrivate = !path
        .basename((libImport.uri as DirectiveUriWithLibrary).relativeUriString)
        .startsWith("_");
    return notPrivate;
  }

  bool exportFilter(LibraryExportElement libExport) {
    bool notPrivate = !path
        .basename((libExport.uri as DirectiveUriWithLibrary).relativeUriString)
        .startsWith("_");
    return notPrivate;
  }

  bool classFilter(ClassElement clazz) {
    //ignore: private
    //ignore: can not inherited class
    return !clazz.name.startsWith("_") && !lib.typeProvider.isNonSubtypableClass(clazz);
  }

  bool constructorFilter(ConstructorElement constructor) {
    return !constructor.isFactory && !constructor.name.startsWith("_");
  }

  Library buildLib = Library((b) => b
    ..name = lib.name
    ..comments.addAll(
        ["/// Generated by mat_flutter, please don't edit! Created time: ${DateTime.now()}"])
    ..directives.add(Directive((b) => b
      ..type = DirectiveType.import
      // import lib self
      ..url = lib.identifier))
    ..directives.addAll(lib.libraryImports.where(importFilter).map((libImport) => Directive((b) => b
      ..type = DirectiveType.import
      ..url = (libImport.uri as DirectiveUriWithLibrary).relativeUriString
      ..as = libImport.prefix?.element.name
      ..show.addAll(libImport.combinators
          .whereType<ShowElementCombinator>()
          .expand((show) => show.shownNames))
      ..hide.addAll(libImport.combinators
          .whereType<HideElementCombinator>()
          .expand((hide) => hide.hiddenNames)))))
    ..directives.addAll(lib.libraryExports.where(exportFilter).map((libExport) => Directive((b) => b
      ..type = DirectiveType.export
      ..url = (libExport.uri as DirectiveUriWithLibrary).relativeUriString
      ..show.addAll(libExport.combinators
          .whereType<ShowElementCombinator>()
          .expand((show) => show.shownNames))
      ..hide.addAll(libExport.combinators
          .whereType<HideElementCombinator>()
          .expand((hide) => hide.hiddenNames)))))
    ..body.addAll(lib.definingCompilationUnit.classes.where(classFilter).map((clazz) => Class((b) =>
        b
          ..docs.add("/// ${clazz.getDisplayString(withNullability: true)}")
          ..name = "${clazz.name}Mate"
          ..abstract = clazz.isAbstract
          // ..extend = refer("${clazz.thisType}", _findRefer(clazz.thisType))
          ..types.addAll(clazz.typeParameters
              .map((typeParam) => typeRefers.elementRef(typeParam, inClass: clazz)))
          ..constructors.addAll(
              clazz.constructors.where(constructorFilter).map((constructor) => Constructor((b) => b
                ..name = constructor.name.isEmpty ? null : constructor.name
                ..docs.addAll(["/// $constructor"])
                // A const constructor can't have a body. but we need body.
                ..constant = false
                ..factory = constructor.isFactory
                ..requiredParameters.addAll(constructor.parameters
                    .where((e) => !e.isNamed)
                    .map((param) => Parameter((b) => b
                      ..docs.add("// param: ${param.getDisplayString(withNullability: true)} ")
                      ..docs.add("// param: ${param.getDisplayString(withNullability: true)} ")
                      ..type = typeRefers.elementRef(param, inClass: clazz)
                      ..name = param.name
                      ..named = false)))
                ..optionalParameters.addAll(constructor.parameters.where((e) => e.isNamed).map(
                    (param) => Parameter((b) => b
                      ..docs.add("// param: ${param.getDisplayString(withNullability: true)} ")
                      ..docs.add("// param: ${param.getDisplayString(withNullability: true)} ")
                      ..type = typeRefers.elementRef(param, inClass: clazz)
                      ..name = param.name
                      ..named = true
                      ..required = param.isRequired ||
                          param.type.nullabilitySuffix == NullabilitySuffix.none)))
                ..body = _constructorBody(constructor))))))));
  var toFile = writeTo(lib);

  String code = buildLib.accept(DartEmitter.scoped(useNullSafetySyntax: true)).toString();
  // code = dartFormatter.format(code);
  writeFS.directory(path.dirname(toFile)).createSync(recursive: true);
  writeFS.file(toFile).writeAsStringSync(code);
  // buildStep.writeAsString(AssetId("build_ext", toFile), buildLib.accept(DartEmitter()).toString());
}

Code? _constructorBody(ConstructorElement constructor) {
  return Code("");
}

_log(Object? o) {
  print("${DateTime.now()} - $o");
}
