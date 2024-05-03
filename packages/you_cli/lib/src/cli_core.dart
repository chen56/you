// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:code_builder/code_builder.dart';
import 'package:file/file.dart';
import 'package:path/path.dart' as path;
import 'package:you_cli/src/yaml.dart';

// final Glob _PAGE_GLOB = Glob("{**/page.dart,page.dart}");
class YouCli {
  YouCli({required Directory projectDir})
      : dir_project = projectDir.fileSystem.directory(path.normalize(path.absolute(projectDir.path))),
        fs = projectDir.fileSystem;

  static const Reference toType = Reference("To", "package:you_flutter/router.dart");
  static const Reference forPageType = Reference("To", "package:you_flutter/router.dart");
  static const String toTypeName = "ToType";
  static const String pageDart = "page.dart";
  static const String layoutDart = "layout.dart";
  static const String layoutFunctionName = "layout";
  static const String pageBuildFunctionName = "build";
  final Directory dir_project;
  final FileSystem fs;
  Pubspec? _pubspec;
  RouteNode? _rootRoute;
  AnalysisSession? _session;

  Directory get dir_lib => dir_project.childDirectory("lib");

  Directory get dir_routes => dir_project.childDirectory("lib/routes");

  Directory get dir_notes => dir_project.childDirectory("lib/routes/notes");

  File get file_routes_g_dart => dir_project.childFile("lib/routes.g.dart");

  File get file_pubspec_yaml => dir_project.childFile("pubspec.yaml");

  Pubspec get pubspec => _pubspec ??= Pubspec.parseFileSync(file_pubspec_yaml);

  Future<RouteNode> get rootRoute async {
    Future<RouteNode> from(Directory dir) async {
      if (!dir.existsSync()) {
        return RouteNode(cli: this, dir: dir, children: []);
      }

      var children = await Future.wait(dir.listSync(recursive: false).whereType<Directory>().map((e) async => await from(e)));
      var (layout: layoutFunction, forBuildType: forBuildType) = await analysisLayout(dir.childFile(layoutDart));
      return RouteNode(
        cli: this,
        dir: dir,
        pageBuild: await analysisPage(dir.childFile(pageDart)),
        layoutFunction: layoutFunction,
        forBuildType: forBuildType,
        children: children,
      );
    }

    return _rootRoute ??= await from(dir_routes);
  }
  AnalysisSession get analysisSession {
    return _session ??= AnalysisContextCollection(
      includedPaths: [dir_lib.path],
      resourceProvider: PhysicalResourceProvider(),
    ).contexts[0].currentSession;
  }

  /// given a internal lib: package:you_flutter/src/router.dart
  ///     =>  find it's public export : package:you_flutter/router.dart
  LibraryElement? findPublicExportLib(TypeDefiningElement toFind, LibraryElement useAt) {
    for (var import in useAt.importedLibraries) {
      for (var MapEntry(key: _, value: value) in import.exportNamespace.definedNames.entries) {
        if (toFind == value) {
          return import;
        }
      }
    }
    return toFind.library!;
  }

  Future<({FunctionElement? layout, Reference? forBuildType})> analysisLayout(File file) async {
    if (!await file.exists()) {
      return (layout: null, forBuildType: null);
    }

    var layoutLib = (await analysisSession.getResolvedLibrary(path.normalize(path.absolute(file.path))) as ResolvedLibraryResult).element;
    FunctionElement? layoutFunction = layoutLib.definingCompilationUnit.functions.where((e) => e.name == layoutFunctionName).firstOrNull;
    if (layoutFunction == null) {
      return (layout: null, forBuildType: null);
    }
    var findToTypeAnno = layoutFunction.metadata.map((e) => e.computeConstantValue()).where((e) {
      var t = e?.type;
      if (t == null) {
        return false;
      }
      if (t.getDisplayString(withNullability: false) != toTypeName) {
        return false;
      }
      var element = t.element;
      if (element is! ClassElement) {
        return false;
      }
      // result?.type?.element?.library?.children
      var publicExportFrom = findPublicExportLib(element, layoutLib);
      return publicExportFrom?.identifier == forPageType.type.url;
    }).firstOrNull;
    if (findToTypeAnno == null) {
      return (layout: layoutFunction, forBuildType: null);
    }
    var type = findToTypeAnno.getField("type")?.toTypeValue();
    if (type == null) {
      return (layout: layoutFunction, forBuildType: forPageType);
    }

    var symbol = type.getDisplayString(withNullability: false);

    if (symbol == "") {
      return (layout: layoutFunction, forBuildType: forPageType);
    }

    var publicExportFrom = findPublicExportLib(type.element! as TypeDefiningElement, layoutLib);
    var url = publicExportFrom?.identifier;

    return (layout: layoutFunction, forBuildType: refer(symbol, url));
  }

  Future<FunctionElement?> analysisPage(File file) async {
    if (!await file.exists()) {
      return null;
    }
    var lib = (await analysisSession.getResolvedLibrary(path.normalize(path.absolute(file.path))) as ResolvedLibraryResult).element;
    return lib.definingCompilationUnit.functions.where((e) => e.name == pageBuildFunctionName).firstOrNull;
  }
}

class RouteNode {
  final YouCli cli;
  final List<RouteNode> children;
  final Directory dir;
  final Reference? forBuildType;
  final FunctionElement? layoutFunction;
  final FunctionElement? pageBuild;
  late RouteNode _parent = this;

  RouteNode({required this.dir, this.forBuildType, required this.children, this.layoutFunction, this.pageBuild, required this.cli}) {
    for (var child in children) {
      child._parent = this;
    }
  }

  int get level => isRoot ? 0 : _parent.level + 1;

  RouteNode get root => isRoot ? this : _parent.root;

  bool get isRoot => _parent == this;

  File get file_page_dart => dir.childFile("page.dart");

  File get file_layout_dart => dir.childFile("layout.dart");

  String get routePath {
    if (isRoot) {
      return "/";
    }
    return "/${path.relative(dir.path, from: root.dir.path)}";
  }

  String get pagePackageUrl {
    return "package:${cli.pubspec.name}/${path.relative(file_page_dart.path, from: cli.dir_lib.path)}";
  }

  String get layoutPackageUrl {
    return "package:${cli.pubspec.name}/${path.relative(file_layout_dart.path, from: cli.dir_lib.path)}";
  }

  /// note name平整化,可作为变量名：
  /// lib/routes/1.a/b/page.dart  ---> a_b
  String get flatName {
    String p = routePath;
    if (p == "/") {
      return "root";
    }
    var names = p.split(path.separator).where((e) => e.isNotEmpty);
    return names
        .map((e) => e
            // ignore: unnecessary_string_escapes
            .replaceAll(RegExp("^\\d+\."), "") // 1.z.about -> note_note-self
            .replaceAll(".", "_")
            .replaceAll("-", "_")
            .replaceAll("&", "_")
            .replaceAll("*", "_")
            .replaceAll("*", "_")
            .replaceAll("@", "_"))
        .join("_");
  }

  List<RouteNode> toList({
    bool includeThis = true,
    bool Function(RouteNode path)? where,
    Comparator<RouteNode>? sortBy,
  }) {
    where = where ?? (e) => true;
    if (!where(this)) {
      return [];
    }
    List<RouteNode> sorted = List.from(children);
    if (sortBy != null) {
      sorted.sort(sortBy);
    }
    var flatChildren = sorted.expand((child) {
      return child.toList(includeThis: true, where: where, sortBy: sortBy);
    }).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  @override
  String toString() {
    return dir.toString();
  }

  RouteNode? findLayoutSync() {
    if (file_layout_dart.existsSync()) {
      return this;
    }
    if (isRoot) {
      return null;
    }
    return _parent.findLayoutSync();
  }

  Reference findForBuildType() {
    if (forBuildType != null) {
      return forBuildType!;
    }
    if (isRoot) {
      return YouCli.forPageType;
    }
    return _parent.findForBuildType();
  }
}
