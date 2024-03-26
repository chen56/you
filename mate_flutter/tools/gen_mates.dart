import 'dart:collection';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart' as ast;
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
// import 'package:flutter_test/flutter_test.dart';
import "package:path/path.dart" as path;
import 'package:analyzer/src/dart/element/element.dart';
import 'package:note_tools/note_tools.dart';

// ref: ElementDisplayStringBuilder 代码生成
main() async {
  _log("## main");
  List<String> include = [
    "package:flutter/",
    // "package:flutter/src/material/app_bar.dart",
    "package:flutter/src/widgets/basic.dart",
    // "package:flutter/src/painting/box_shadow.dart"
    // "package:flutter/src/animation/curves.dart"
  ];

  genAll(
    env: Env(),
    entryFile: path.normalize(path.absolute("tools/gen_mates_sample.dart")),
    mateFilter: (lib) =>
        lib.identifier.endsWith(".dart") &&
        include.any((uri) => lib.identifier.startsWith(uri)),
    // writeFS: MemoryFileSystem(),
    writeFS: const LocalFileSystem(),
    // libPath: 比如包package:flutter/material.dart 应提供的libPath: material.dart
    writeTo: (libPath) {
      return path.join("lib", libPath);
    },
    dartFormatter: DartFormatter(pageWidth: 120),
  );

  // make `flutter run xxx.dart` no error
  // test("stub", () {});
}

Future<void> genAll({
  required Env env,
  required String entryFile, //入口lib的文件绝对路径
  required FileSystem writeFS,
  required bool Function(LibraryElement lib) mateFilter,
  required String Function(String libPath) writeTo,
  required DartFormatter dartFormatter, //void Function(LibraryBuilder) updates
}) async {
  _log("## resolve entry lib");
  final collection = AnalysisContextCollection(
    includedPaths: [entryFile],
    sdkPath: env.dartSdkDir,
    resourceProvider: PhysicalResourceProvider.INSTANCE,
  );
  var entryLib = (await collection.contexts.first.currentSession
          .getResolvedLibrary(entryFile) as ResolvedLibraryResult)
      .element;

  _log("## collect lib start, create LibNode tree and remove duplicate,");
  Set<LibraryElement> allMateLibs = {};
  LibNode root = LibNode(entryLib,
      children: entryLib.importedLibraries,
      allLibs: allMateLibs,
      mateFilter: mateFilter);
  _log("## collect lib ok!");

  _log("## collect AllTypes start");
  TypeRefers allTypes = root.collectAllTypes(mateFilter);
  _log("## collect AllTypes ok!");
  _log("## AllTypes print:");
  for (var key in allTypes.keys) {
    _log(
        "allTypes--- $key - runtimeType:${key.runtimeType}  lib:${allTypes[key]!.identifier}");
  }

  _log("## gen enum register:");
  _genEnums(
    writeFS: writeFS,
    dartFormatter: dartFormatter,
    typeRefers: allTypes,
    writeTo: writeTo,
  );

  _log("## gen lib mate, list all:");
  root.debugLog();
  _log("## gen lib mate start:");
  for (var lib in allMateLibs.where(mateFilter).toList()) {
    _log("## gen lib mate: ${lib.identifier}");

    _genMateLib(
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

  Reference elementRef(Element element, {required Element debugRef}) {
    if (element is ParameterElement) {
      DartType type = element.type;
      return typeRef(type, debugRef: debugRef);
    }
    if (element is TypeParameterElement) {
      return TypeReference((b) => b
        ..symbol = element.name
        ..bound = element.bound == null
            ? null
            : typeRef(element.bound!, debugRef: debugRef));
    }
    //TypeParameterizedElement
    //EnumOrAugmentationElement
    if (element is TypeParameterizedElement) {
      return TypeReference((b) => b
        ..symbol = element.name
        ..url = typeRefers[element]?.identifier
        ..types.addAll(element.typeParameters
            .map((e) => elementRef(e, debugRef: debugRef))));
    }
    throw UnimplementedError(
        "element type:${element.runtimeType} not implemented : ${element.source?.uri.path}");
  }

  Reference typeRef(DartType type, {required Element debugRef}) {
    LibraryElement? lib = type.element?.library;
    bool coreType =
        type is VoidType || type is t.FunctionType || type is DynamicType;
    if (lib == null && !coreType) {
      _log("typeRef $type  lib is null");
    }
    //类型名，可以过滤设置断点
    if (debugRef.name != null && debugRef.name!.startsWith("--WidgetsApp")) {
      _log("createRefer $type");
    }

    // alias 指typedef
    // typedef Callback<T> = T Function<T>(T)
    if (type.alias != null) {
      final alias = type.alias!;
      return TypeReference((b) => b
        ..symbol = alias.element.name
        ..url = alias.element.library.identifier
        ..isNullable = type.nullabilitySuffix == NullabilitySuffix.question
        ..types.addAll(
            alias.typeArguments.map((e) => typeRef(e, debugRef: debugRef))));
    }

    // ParameterizedType主要是有范型的类及接口等
    // class Button
    // class XButton<T>
    // ..types.addAll(clazz.typeParameters
    //     .map((typeParam) => typeRefers.elementRef(typeParam, debugRef: clazz)))

    if (type is t.ParameterizedType) {
      TypeReference ref = TypeReference((b) => b
        ..symbol = type.element?.name
        ..isNullable = type.nullabilitySuffix == NullabilitySuffix.question
        ..url = lib?.identifier
        ..types.addAll(
            type.typeArguments.map((e) => typeRef(e, debugRef: debugRef))));
      return ref;
    }

    // 指类型参数T：class CupertinoRadio<T>
    if (type is t.TypeParameterType) {
      // type.bound.isDynamic
      //   true: CupertinoRadio<T>
      //   false: CupertinoRadio<T extend XXX>
      return code.refer(type.getDisplayString(withNullability: true));
      // return type.bound.isDynamic
      //     ? code.refer(type.getDisplayString(withNullability: true))
      //     : code.refer(type.getDisplayString(withNullability: true), lib?.identifier);
    }

    if (type is t.FunctionType) {
      code.FunctionType ref = code.FunctionType((b) => b
        ..returnType = typeRef(type.returnType, debugRef: debugRef)
        ..types.addAll(
            type.typeFormals.map((e) => elementRef(e, debugRef: debugRef)))
        ..requiredParameters.addAll(type.parameters
            .where((e) => e.isPositional)
            .map((e) => typeRef(e.type, debugRef: debugRef)))
        ..namedParameters.addEntries(type.parameters
            .where((e) => e.isOptionalNamed)
            .map((e) => MapEntry(e.name, typeRef(e.type, debugRef: debugRef))))
        ..namedRequiredParameters.addEntries(type.parameters
            .where((e) => e.isRequiredNamed)
            .map((e) => MapEntry(e.name, typeRef(e.type, debugRef: debugRef))))
        ..optionalParameters.addAll(type.parameters
            .where((e) => e.isOptional)
            .map((e) => typeRef(e.type, debugRef: debugRef)))
        ..symbol = null
        ..isNullable = type.nullabilitySuffix == NullabilitySuffix.question
        ..url = lib?.identifier);
      return ref;
    }

    if (!coreType) {
      _log(
          "TypeRefers.createRefer: no coreType default - ${type.runtimeType} : $type");
    }
    return Reference(
        type.getDisplayString(withNullability: true), lib?.identifier);
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
    for (final libNode in toList().where((element) => libFilter(element.lib))) {
      // 注册mate 库的导出元素
      for (final e in libNode.lib.exportNamespace.definedNames.values) {
        result.putIfAbsent(e, () => libNode.firstPublicLib);
      }
      // 注册mate库自己import的相关库的元素，只导入第一层即可，不用向下递归追溯
      for (final importLib in libNode.lib.importedLibraries) {
        for (final e in importLib.exportNamespace.definedNames.values) {
          result.putIfAbsent(e, () => importLib);
        }
      }
    }
    return result;
  }

  int get level => parent == null ? 0 : parent!.level + 1;

  String get path =>
      parent == null ? lib.identifier : "${lib.identifier} | ${parent!.path}";

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
  // 虽然想删掉Deprecated的字段，但你要是required的，我也不能删
  return !parameter.hasDeprecated ? true : parameter.isRequired;
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
      clazz.constructors.where(constructorFilter).isNotEmpty &&
      !clazz.isFinal &&
      // This application cannot tree shake icons fonts. It has non-constant instances of IconData at the following locations:
      // file:///Users/cccc/git/chen56/note/mate_flutter/lib/src/widgets/icon_data.dart:30:23
      // Target web_release_bundle failed: Exception: Avoid non-constant invocations of IconData or try to build again with --no-tree-shake-icons.
      !clazz.name.endsWith("IconData") &&
      //这个类有个结构参数，暂时不支持了，mate模式准备放弃(Offset, TextPosition)? startLocation
       !clazz.name.contains("RawFloatingCursorPoint");
}

bool libFilter(LibraryElement lib) {
  bool notPrivate = !path.basename(lib.identifier).startsWith("_");
  return notPrivate &&
      lib.definingCompilationUnit.classes.where(classFilter).isNotEmpty;
}

extension _InterfaceElement on InterfaceElement {
  // ignore: unused_element
  bool isSubClassOf({required String className, required String package}) {
    if (name == className && source.uri.toString() == package) {
      return true;
    }
    // 到Object.还找不到，彻底退出
    if (supertype == null) {
      return false;
    }
    return supertype!.element
        .isSubClassOf(className: className, package: package);
  }
}

/// default value handle: The default parameter processing is too complicated,
/// so use whitelist mode, We only deal with what we understand
({String info, code.Expression? value}) resolveDefaultValue(
    ParameterElement param, TypeRefers typeRefers) {
  // guard clause
  if (!param.hasDefaultValue) return (info: "default:none", value: null);
  assert(param is ConstVariableElement,
      "hasDefaultValue , type is ConstVariableElement ");

  // Known situation
  ConstVariableElement constParam = param as ConstVariableElement;

  // super.xxx 的向上递归
  if (constParam.constantInitializer == null &&
      constParam is SuperFormalParameterElement) {
    var x = constParam as SuperFormalParameterElement;
    return resolveDefaultValue(
        x.superConstructorParameter!.declaration, typeRefers);
  }
  var init = constParam.constantInitializer!;

  code.Expression? resolveExpression(ast.Expression expression) {
    // x({int a = -1})
    if (expression is ast.PrefixExpression) {
      return resolveExpression(expression.operand);
    }

    // Simple Literal Expression:   a:1  | a:-1 ...
    if (expression is ast.Literal && expression is! ast.TypedLiteral) {
      return code.refer(param.defaultValueCode!);
    }

    // example : Color color = Colors.red
    if (init is ast.PrefixedIdentifier) {
      // private can not use :
      //   double toolbarHeight = _MediumScrollUnderFlexibleConfig.collapsedHeight_MediumScrollUnderFlexibleConfig.collapsedHeight
      if (init.prefix.staticElement!.isPrivate) {
        return null;
      }
      var ref =
          typeRefers.elementRef(init.prefix.staticElement!, debugRef: param);
      return code.refer("${init.prefix}.${init.identifier}", ref.url);
    }

    return null;
  }

  var result = resolveExpression(init);
  if (result != null) {
    return (info: "default:processed=${init.runtimeType}", value: result);
  }

  // Unknown situation
  return (info: "default:unprocessed=${init.runtimeType}", value: null);
}

// class SyntaxErrorInAssetException
//   constructor
//     parameterassetId  AssetId   AssetId assetId
//     parameterfilesWithErrors  List<AnalysisResultWithErrors>   List<AnalysisResultWithErrors> filesWithErrors
void _genMateLib({
  required FileSystem writeFS,
  required LibraryElement lib,
  required String Function(String libPath) writeTo,
  required DartFormatter dartFormatter,
  required TypeRefers typeRefers,
}) {
  _log(
      "_genLibMate: identifier:${lib.identifier} importedLibraries:${lib.importedLibraries}  ");

  Library buildLib = Library((libb) => libb
    ..name = lib.name.isEmpty ? null : lib.name
    ..comments.addAll(["/// Generated by gen_maters.dart, please don't edit! "])
    // 既然不处理参数缺省值，就不加乱七八糟的import了
    // ..directives.add(Directive((b) => b
    //   ..type = DirectiveType.import
    //   // import lib self
    //   ..url = lib.identifier))
    // ..directives.addAll(lib.libraryImports.where((e) => e.prefix != null).where((e) {
    //   String uri = (e.uri as DirectiveUriWithLibrary).relativeUri.toString();
    //   return uri.isNotEmpty && uri[0] != '_';
    // }).map((libImport) => code.Directive((b) => b
    //   ..type = DirectiveType.import
    //   ..url = (libImport.uri as DirectiveUriWithLibrary).relativeUriString
    //   ..as = libImport.prefix?.element.name
    //   ..show.addAll(libImport.combinators
    //       .whereType<ShowElementCombinator>()
    //       .expand((show) => show.shownNames))
    //   ..hide.addAll(libImport.combinators
    //       .whereType<HideElementCombinator>()
    //       .expand((hide) => hide.hiddenNames)))))
    // 如果有combinators就别导出了
    // export 'arena.dart' show GestureArenaEntry, GestureArenaMember;
    // 瞎导出会导出不存在的元素
    ..directives.addAll(lib.libraryExports
        .where((e) => e.combinators.isEmpty)
        .map((libExport) => Directive((b) => b
          ..type = DirectiveType.export
          ..url = (libExport.uri as DirectiveUriWithLibrary).relativeUriString
          ..show.addAll(libExport.combinators
              .whereType<ShowElementCombinator>()
              .expand((show) => show.shownNames))
          ..hide.addAll(libExport.combinators
              .whereType<HideElementCombinator>()
              .expand((hide) => hide.hiddenNames)))))
    ..body.addAll(
        lib.definingCompilationUnit.classes.where(classFilter).map((clazz) {
      String mateClassName = "${clazz.name}\$Mate";

      return Class((b) => b
        ..docs.add("/// ${clazz.getDisplayString(withNullability: true)}")
        ..name = mateClassName
        ..abstract = clazz.isAbstract
        ..extend = typeRefers.typeRef(clazz.thisType, debugRef: clazz)
        ..mixins.add(TypeReference((b) => b
              // ..symbol = clazz.isSubClassOf(
              //     className: "Widget", package: "package:flutter/src/widgets/framework.dart")
              //     ? "WidgetMate"
              //     : "Mate"
              ..symbol = "Mate"
              ..url = "package:mate/mate_core.dart"
            // Mate 暂时不要类型参数了
            // ..types.add(refer(mateClassName)),
            ))
        ..types.addAll(clazz.typeParameters.map(
            (typeParam) => typeRefers.elementRef(typeParam, debugRef: clazz)))
        ..fields.add(code.Field((b) => b
          ..name = "mateParams"
          ..type = TypeReference((b) => b
            ..symbol = "Map"
            ..types.addAll([
              refer("String"),
              refer("BuilderArg", "package:mate/mate_core.dart")
            ]))
          ..annotations.add(refer('override'))
          ..modifier = FieldModifier.final$))
        ..constructors.addAll(
            clazz.constructors.where(constructorFilter).map((constructor) {
          return Constructor((b) {
            // Expression constructorEx = TypeReference((b) =>
            // b
            //   ..symbol = mateClassName
            //   ..types.addAll(
            //     // 1.类型参数不需要bound
            //     // class AnnotatedRegion$Mate<T extends Object>
            //     //     -> mateBuilder = AnnotatedRegion$Mate<T>()
            //     // 2.命名构造器的范型参数要加到类型名后，而不是方法名后
            //     // class ObjectFlagProperty<T>
            //     //    ->ObjectFlagProperty<String>.has()
            //       clazz.typeParameters.map((typeParam) => refer(typeParam.name))));
            // // 命名构造器的情况
            // if (constructor.name.isNotEmpty) {
            //   constructorEx = constructorEx.property(constructor.name);
            // }
            var parameters = constructor.parameters.where(parameterFilter);

            b
              ..name = constructor.name.isEmpty ? null : constructor.name
              ..docs.addAll(["/// $constructor"])
              // A const constructor can't have a body. but we need body.
              ..constant = false
              ..factory = constructor.isFactory
              // 改全super.xx了，这一套use()模式的就不要了
              // lib code_builder's requiredParameters == lib analyzer's isPositional
              // ..requiredParameters
              //     .addAll(parameters.where((e) => e.isPositional).map((param) => Parameter((b) => b
              //       ..docs.add(
              //           "/// requiredParameters: ${param.getDisplayString(withNullability: true)} ")
              //       ..type = typeRefers.elementRef(param, debugRef: clazz)
              //       ..name = param.name
              //       ..named = param.isNamed
              //       // analyzer's positional args no required keyword
              //       ..required = false)))
              // ..optionalParameters
              //     .addAll(parameters.where((e) => !e.isPositional).map((param) => Parameter((b) {
              //           b
              //             ..name = param.name
              //             ..named = param.isNamed
              //             ..type = typeRefers.elementRef(param, debugRef: clazz);
              //           // default value handle: The default parameter processing is too complicated,
              //           // so use whitelist mode, We only deal with what we understand
              //
              //           var resolveResult = resolveDefaultValue(param, typeRefers);
              //
              //           b.docs.add(
              //               "/// optionalParameters: ${param.getDisplayString(withNullability: true)} , ${resolveResult.app_info}");
              //           b.defaultTo = resolveResult.value?.code;
              //           //有缺省值的，但无法处理的，就加个required，自己投参吧
              //           b.required = param.hasDefaultValue
              //               ? (resolveResult.value == null ? true : false)
              //               : param.isRequired;
              //         })))
              // ..initializers.add(
              //     refer(constructor.name.isEmpty ? "super" : "super.${constructor.name}")
              //         .call(
              //             constructor.parameters
              //                 .where((e) => e.isPositional)
              //                 .map((e) => refer(e.name)),
              //             Map.fromEntries(parameters
              //                 .where((e) => e.isNamed)
              //                 .map((e) => MapEntry(e.name, refer(e.name)))))
              //         .code)
              ..requiredParameters.addAll(parameters
                  .where((e) => e.isPositional)
                  .map((param) => Parameter((b) => b
                    ..docs.add(
                        "/// requiredParameters: ${param.getDisplayString(withNullability: true)} ")
                    ..name = param.name
                    ..named = param.isNamed
                    ..toSuper = true
                    ..required = false)))
              ..optionalParameters.addAll(parameters
                  .where((e) => !e.isPositional)
                  .map((param) => Parameter((b) {
                        if (param
                            .getDisplayString(withNullability: true)
                            .contains("MainAxisSize.max")) {
                          _log(
                              "Breakpoint ${param.getDisplayString(withNullability: true)}}");
                        }
                        var resolveResult =
                            resolveDefaultValue(param, typeRefers);

                        b
                          ..name = param.name
                          ..named = param.isNamed
                          ..toSuper = true
                          ..docs.add(
                              "/// optionalParameters: ${param.getDisplayString(withNullability: true)} , ${resolveResult.info}")
                          ..required =
                              param.hasDefaultValue ? false : param.isRequired;
                      })))
              ..initializers.add(
                refer("mateParams")
                    .assign(literalMap(Map.fromEntries(parameters.map((param) {
                  if (param
                      .getDisplayString(withNullability: true)
                      .contains("MainAxisSize.max")) {
                    _log(
                        "Breakpoint ${param.getDisplayString(withNullability: true)}}");
                  }

                  var defaultValue = resolveDefaultValue(param, typeRefers);
                  if (param
                      .getDisplayString(withNullability: true)
                      .contains("MainAxisSize.max")) {
                    _log(
                        "Breakpoint ${param.getDisplayString(withNullability: true)}}");
                  }

                  var namedArguments = {
                    "name": code.literalString(param.name),
                    "init": code.refer(param.name),
                    "isNamed": code.literalBool(param.isNamed),
                    if (defaultValue.value != null)
                      "defaultValue": defaultValue.value!,
                  };
                  return MapEntry(
                    param.name,
                    TypeReference((b) => b
                          ..symbol = "BuilderArg"
                          ..url = "package:mate/mate_core.dart"
                          ..types.add(
                              typeRefers.elementRef(param, debugRef: clazz)))
                        .newInstance([], namedArguments),
                  );
                })))).code,
              )
              ..initializers.add(refer(constructor.name.isEmpty
                      ? "super"
                      : "super.${constructor.name}")
                  .call([]).code)
              ..body = Block.of([
                refer("mateBuilderName")
                    .assign(literalString(constructor.displayName))
                    .statement,
                refer("matePackageUrl")
                    .assign(literalString(
                        typeRefers.elementRef(clazz, debugRef: clazz).url!))
                    .statement,
                refer("mateBuilder")
                    .assign(Method((b) {
                      var c = TypeReference((b) => b
                        ..symbol = mateClassName
                        ..types.addAll(clazz.typeParameters
                            .map((typeParam) => refer(typeParam.name))));

                      var name =
                          constructor.name.isEmpty ? null : constructor.name;
                      var positionalArgs = parameters
                          .where((e) => e.isPositional)
                          .map((e) => refer("p.get")
                              .call([code.literal(e.name)]).property("value"));
                      var namedArgs = Map.fromEntries(parameters
                          .where((e) => e.isNamed)
                          .map((e) => MapEntry(
                              e.name,
                              refer("p.get")
                                  .call([literal(e.name)])
                                  .property("build")
                                  .call([]))));
                      var invoke = InvokeExpression.newOf(
                              c, positionalArgs.toList(), namedArgs, [], name)
                          .code;

                      b
                        ..name = ''
                        ..requiredParameters.add(Parameter((b) => b.name = "p"))
                        //缺省构造器的name为"",只有命名构造器有name
                        ..body = invoke;
                    }).closure)
                    .statement,
                // 改全super.xx了，这一套use()就不要了
                // ...parameters.map((e) {
                //   var defaultValue = resolveDefaultValue(e, typeRefers);
                //   var methodName = "mateUse";
                //   var positionalArguments = [code.literalString(e.name), code.refer(e.name)];
                //   var namedArguments = {
                //     "isNamed": code.literalBool(e.isNamed),
                //   };
                //   if (defaultValue.value != null) {
                //     namedArguments["defaultValue"] = defaultValue.value!;
                //   }
                //   return code.refer(methodName).call(positionalArguments, namedArguments).statement;
                //   // return e.type.isDartCoreList
                //   //     ? Code("mateUseList('${e.name}', ${e.name}, isNamed:${e.isNamed} );")
                //   //     : Code("mateUse('${e.name}', ${e.name}, isNamed:${e.isNamed} );");
                // }),
              ]);
          });
        })));
    })));
  var toFile = writeTo(lib.identifier.replaceFirst("package:flutter/", ""));

  var emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(), useNullSafetySyntax: true);
  String writeContent = buildLib.accept(emitter).toString();

  writeContent = dartFormatter.format(writeContent);
  writeFS.directory(path.dirname(toFile)).createSync(recursive: true);
  writeFS.file(toFile).writeAsStringSync(writeContent);
}

_genEnums({
  required FileSystem writeFS,
  required String Function(String libPath) writeTo,
  required DartFormatter dartFormatter,
  required TypeRefers typeRefers,
}) {
  /*
    import 'package:flutter/material.dart';
    import 'package:mate/mate_core.dart';

    EnumRegister registerEnum() {
      EnumRegister result = EnumRegister();
      result.register(MainAxisAlignment,MainAxisAlignment.values);
      result.register(CrossAxisAlignment,CrossAxisAlignment.values);
      return result;
    }
    */
  var emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(), useNullSafetySyntax: true);

  var statements = typeRefers.keys
      .whereType<EnumElement>()
      .map((e) => refer("result.register").call(
            [typeRefers.elementRef(e, debugRef: e).property("values")],
          ).statement);

  Library lib = Library(
    (b) => b
      ..comments
          .addAll(["/// Generated by gen_maters.dart, please don't edit! "])
      ..directives.add(Directive((b) => b
        ..type = DirectiveType.import
        ..url = "package:mate/mate_core.dart"))
      ..body.add(Code("""
              EnumRegister registerEnum() {
                EnumRegister result = EnumRegister();
                ${statements.map((e) => e.accept(emitter)).join()}
                return result;
              }
          """)),
  );

  var toFile = writeTo("mate_enums.g.dart");

  String writeContent = lib.accept(emitter).toString();
  writeContent = dartFormatter.format(writeContent);
  writeFS.directory(path.dirname(toFile)).createSync(recursive: true);
  writeFS.file(toFile).writeAsStringSync(writeContent);
}

_log(Object? o) {
  // ignore: avoid_print
  print("${DateTime.now()} - $o");
}
