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

// todo 过滤掉@Deprecated
// ref: ElementDisplayStringBuilder
main() async {
  _log("## main");
  List<String> include = [
    "package:flutter/",
    // "package:flutter/src/rendering/editable.dart",
    // "package:flutter/src/foundation/bitfield.dart",
    "package:flutter/src/painting/box_shadow.dart"
    // "package:flutter/src/animation/curves.dart"
  ];

  gen(
    env: Env(),
    entryFile: path.normalize(path.absolute("tools/gen_mates_sample.dart")),
    mateFilter: (lib) =>
        lib.identifier.endsWith(".dart") && include.any((uri) => lib.identifier.startsWith(uri)),
    // writeFS: MemoryFileSystem(),
    writeFS: const LocalFileSystem(),
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
  required bool Function(LibraryElement lib) mateFilter,
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

  _log("## collect lib start, create LibNode tree and remove duplicate,");
  Set<LibraryElement> allMateLibs = {};
  LibNode root = LibNode(entryLib,
      children: entryLib.importedLibraries, allLibs: allMateLibs, mateFilter: mateFilter);
  _log("## collect lib ok!");

  _log("## collect AllTypes start");
  TypeRefers allTypes = root.collectAllTypes(mateFilter);
  _log("## collect AllTypes ok!");
  _log("## AllTypes print:");
  for (var key in allTypes.keys) {
    _log("allTypes--- $key - runtimeType:${key.runtimeType}  lib:${allTypes[key]!.identifier}");
  }

  _log("## gen lib mate, list all:");
  root.debugLog();
  _log("## gen lib mate start:");
  for (var lib in allMateLibs.where(mateFilter).toList()) {
    _log("## gen lib mate: ${lib.identifier}");

    _genLibMate(
        writeFS: writeFS,
        writeTo: writeTo,
        lib: lib,
        dartFormatter: dartFormatter,
        typeRefers: allTypes);
  }
  _log("## gen lib mate ok!");
}

class TypeRefers extends MapBase<Element, LibraryElement> {
  Map<Element, LibraryElement> typeRefers = {};
  Map<String, Element> nameTypes = {};

  @override
  LibraryElement? operator [](Object? key) {
    return typeRefers[key];
  }

  @override
  void operator []=(Element key, LibraryElement value) {
    typeRefers[key] = value;
    nameTypes[key.displayName] = key;
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
    if (element is ParameterElement) {
      DartType type = element.type;
      return typeRef(type, inClass: inClass);
    }
    if (element is TypeParameterElement) {
      return TypeReference((b) => b
        ..symbol = element.name
        ..bound = element.bound == null ? null : typeRef(element.bound!, inClass: inClass));
    }
    throw UnimplementedError(
        "element type:${element.runtimeType} not implemented : ${element.source?.uri.path}");
  }

  Reference typeRef(DartType type, {required ClassElement inClass}) {
    // LibraryElement? lib = this[type.element];
    LibraryElement? lib = type.element?.library;
    bool coreType = type is VoidType || type is t.FunctionType || type is DynamicType;
    if (lib == null && !coreType) {
      _log("typeRef $type  lib is null");
    }
    //类型名，可以过滤设置断点
    if (inClass.name.startsWith("--WidgetsApp")) {
      _log("createRefer $type");
    }

    // alias
    // T Function<T>(T) -> Callback<T>
    if (type.alias != null) {
      final alias = type.alias!;
      return TypeReference((b) => b
        ..symbol = alias.element.name
        ..url = alias.element.library.identifier
        ..isNullable = type.nullabilitySuffix == NullabilitySuffix.question
        ..types.addAll(alias.typeArguments.map((e) => typeRef(e, inClass: inClass))));
    }

    // ParameterizedType主要是可范型的类及接口等
    // class Button
    // class XButton<T>
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
        ..types.addAll(type.typeFormals.map((e) => elementRef(e, inClass: inClass)))
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
            .where((e) => e.isOptional)
            .map((e) => typeRef(e.type, inClass: inClass)))
        ..symbol = null
        ..isNullable = type.nullabilitySuffix == NullabilitySuffix.question
        ..url = lib?.identifier);
      return ref;
    }

    if (!coreType) {
      _log("TypeRefers.createRefer: no coreType default - ${type.runtimeType} : $type");
    }
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
    required bool Function(LibraryElement lib) mateFilter,
  }) {
    allLibs.add(lib);
    for (final child in children) {
      if (allLibs.contains(child)) {
        continue;
      }
      _children.add(LibNode(
        child,
        parent: this,
        children: child.exportedLibraries.where(mateFilter).toList(),
        allLibs: allLibs,
        mateFilter: mateFilter,
      ));
    }
  }

  /// 收集所有生成过程中可能用到的依赖类型信息，比如某类有参数Y: class X{X(Y y);}
  /// 就要知道Y所在的lib，以方便生成时import
  TypeRefers collectAllTypes(bool Function(LibraryElement lib) libFilter) {
    TypeRefers result = TypeRefers();
    for (final mate in toList().where((element) => libFilter(element.lib))) {
      // 注册mate 库的导出元素
      for (final e in mate.lib.exportNamespace.definedNames.values) {
        result.putIfAbsent(e, () => mate.firstPublicLib);
      }
      // 注册mate库自己import的相关库的元素，只导入第一层即可，不用向下递归追溯
      for (final importLib in mate.lib.importedLibraries) {
        for (final e in importLib.exportNamespace.definedNames.values) {
          result.putIfAbsent(e, () => importLib);
        }
      }
    }
    return result;
  }

  int get level => parent == null ? 0 : parent!.level + 1;

  String get path => parent == null ? lib.identifier : "${lib.identifier} | ${parent!.path}";

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

bool parameterFilter(ParameterElement parameter) {
  return !parameter.hasDeprecated;
}

bool constructorFilter(ConstructorElement constructor) {
  return !constructor.isFactory &&
      !constructor.name.startsWith("_") &&
      constructor.parameters.where(parameterFilter).isNotEmpty;
}

bool classFilter(ClassElement clazz) {
  //ignore: private
  //ignore: can not inherited class
  //ignore: no constructors
  return !clazz.isAbstract &&
      !clazz.name.startsWith("_") &&
      !clazz.library.typeProvider.isNonSubtypableClass(clazz) &&
      clazz.constructors.where(constructorFilter).isNotEmpty;
}

bool libFilter(LibraryElement lib) {
  bool notPrivate = !path.basename(lib.identifier).startsWith("_");
  return notPrivate && lib.definingCompilationUnit.classes.where(classFilter).isNotEmpty;
}

extension _InterfaceElement on InterfaceElement {
  bool isSubClassOf({required String className, required String package}) {
    if (name == className && source.uri.toString() == package) {
      return true;
    }
    // 到Object.还找不到，彻底退出
    if (supertype == null) {
      return false;
    }
    return supertype!.element.isSubClassOf(className: className, package: package);
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

  Library buildLib = Library((libb) => libb
    ..name = lib.name.isEmpty ? null : lib.name
    ..comments.addAll(["/// Generated by gen_maters.dart, please don't edit! "])
    // ..directives.add(Directive((b) => b
    //   ..type = DirectiveType.import
    //   // import lib self
    //   ..url = lib.identifier))
    ..directives.addAll(lib.libraryImports.where((e) => e.prefix != null).where((e) {
      String uri = (e.uri as DirectiveUriWithLibrary).relativeUri.toString();
      return uri.isNotEmpty && uri[0] != '_';
    }).map((libImport) => code.Directive((b) => b
      ..type = DirectiveType.import
      ..url = (libImport.uri as DirectiveUriWithLibrary).relativeUriString
      ..as = libImport.prefix?.element.name
      ..show.addAll(libImport.combinators
          .whereType<ShowElementCombinator>()
          .expand((show) => show.shownNames))
      ..hide.addAll(libImport.combinators
          .whereType<HideElementCombinator>()
          .expand((hide) => hide.hiddenNames)))))
    // 如果有combinators就别导出了
    // export 'arena.dart' show GestureArenaEntry, GestureArenaMember;
    // 瞎导出会导出不存在的元素
    ..directives.addAll(lib.libraryExports.where((e) => e.combinators.isEmpty).map((libExport) =>
        Directive((b) => b
          ..type = DirectiveType.export
          ..url = (libExport.uri as DirectiveUriWithLibrary).relativeUriString
          ..show.addAll(libExport.combinators
              .whereType<ShowElementCombinator>()
              .expand((show) => show.shownNames))
          ..hide.addAll(libExport.combinators
              .whereType<HideElementCombinator>()
              .expand((hide) => hide.hiddenNames)))))
    ..body.addAll(lib.definingCompilationUnit.classes.where(classFilter).map((clazz) {
      String mateClassName = "${clazz.name}\$Mate";

      return Class((b) => b
        ..docs.add("/// ${clazz.getDisplayString(withNullability: true)}")
        ..name = mateClassName
        ..abstract = clazz.isAbstract
        ..extend = typeRefers.typeRef(clazz.thisType, inClass: clazz)
        ..mixins.add(TypeReference((b) => b
          ..symbol = clazz.isSubClassOf(
                  className: "Widget", package: "package:flutter/src/widgets/framework.dart")
              ? "WidgetMate"
              : "Mate"
          ..types.add(refer(mateClassName))))
        ..types.addAll(clazz.typeParameters
            .map((typeParam) => typeRefers.elementRef(typeParam, inClass: clazz)))
        ..constructors.addAll(clazz.constructors.where(constructorFilter).map((constructor) {
          String mateConstructorCallName =
              constructor.name.isEmpty ? mateClassName : "$mateClassName.${constructor.name}";

          return Constructor((b) {
            var parameters = constructor.parameters.where(parameterFilter);
            b
              ..name = constructor.name.isEmpty ? null : constructor.name
              ..docs.addAll(["/// $constructor"])
              // A const constructor can't have a body. but we need body.
              ..constant = false
              ..factory = constructor.isFactory
              ..requiredParameters
                  .addAll(parameters.where((e) => !e.isNamed).map((param) => Parameter((b) => b
                    ..docs.add(
                        "/// requiredParameters: ${param.getDisplayString(withNullability: true)} ")
                    ..type = typeRefers.elementRef(param, inClass: clazz)
                    ..name = param.name
                    ..named = false)))
              ..optionalParameters
                  .addAll(parameters.where((e) => e.isNamed).map((param) => Parameter((b) {
                        b
                          ..docs.add(
                              "/// optionalParameters: ${param.getDisplayString(withNullability: true)} , defaultValueCode:${param.defaultValueCode}")
                          ..name = param.name
                          ..named = true
                          ..type = typeRefers.elementRef(param, inClass: clazz);

                        if (param.hasDefaultValue) {
                          // 缺省值表达式处理有些复杂，只能处理一个是一个了，不可能全覆盖
                          // 只能正则识别可处理的表达式：字面量等
                          b
                            ..defaultTo = Code(param.defaultValueCode!)
                            ..required = false;
                        } else {
                          b
                            ..defaultTo = null
                            ..required = param.isRequired ||
                                param.type.nullabilitySuffix == NullabilitySuffix.none;
                        }
                      })))
              ..initializers.add(
                  refer(constructor.name.isEmpty ? "super" : "super.${constructor.name}")
                      .call(
                          constructor.parameters
                              .where((e) => e.isPositional)
                              .map((e) => refer(e.name)),
                          Map.fromEntries(parameters
                              .where((e) => e.isNamed)
                              .map((e) => MapEntry(e.name, refer(e.name)))))
                      .code)
              // ref: package:note/lib/experiment_mates.dart
              ..body = Block.of([
                refer("mateParams")
                    .assign(refer("Params", "package:note/mate.dart").call([], {
                      "init": refer("this"),
                      "builder": Method((b) => b
                        ..name = ''
                        ..requiredParameters.add(Parameter((b) => b.name = "p"))
                        ..body = refer(mateConstructorCallName)
                            .call(
                                parameters
                                    .where((e) => e.isPositional)
                                    .map((e) => refer("p.getValue").call([code.literal(e.name)])),
                                Map.fromEntries(parameters.where((e) => e.isNamed).map((e) =>
                                    MapEntry(e.name, refer("p.getValue").call([literal(e.name)])))))
                            .code).closure,
                    }))
                    .statement,
                ...parameters.map((e) => Code("mateParams.set(name:'${e.name}',init:${e.name});")),
              ]);
          });
        })));
    })));
  var toFile = writeTo(lib);

  String writeContent = buildLib
      .accept(
        DartEmitter(
          allocator: Allocator(), // reference的 import 不增加前缀 ”_i1“ 这种形式
          useNullSafetySyntax: true,
        ),
      )
      .toString();
  writeContent = dartFormatter.format(writeContent);
  writeFS.directory(path.dirname(toFile)).createSync(recursive: true);
  writeFS.file(toFile).writeAsStringSync(writeContent);
}

_log(Object? o) {
  // ignore: avoid_print
  print("${DateTime.now()} - $o");
}
