// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:code_builder/code_builder.dart';
import 'package:file/file.dart';
import 'package:path/path.dart' as path;
import 'package:you_cli/src/urils.dart';
import 'package:you_cli/src/yaml.dart';

// final Glob _PAGE_GLOB = Glob("{**/page.dart,page.dart}");
class YouCli {
  YouCli({required Directory projectDir})
      : dir_project = projectDir.fileSystem.directory(path.normalize(path.absolute(projectDir.path))),
        fs = projectDir.fileSystem;

  static const ToType toTypeDefault = ToType(type: Reference("To", "package:you_flutter/router.dart"));
  static const String toTypeName = "ToType";
  static const String layoutFunctionName = "layout2";
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

  RouteNode get rootRoute {
    RouteNode from(Directory dir) {
      if (!dir.existsSync()) {
        return RouteNode(dir: dir, children: []);
      }

      var children = dir.listSync(recursive: false).whereType<Directory>().map((e) => from(e));
      return RouteNode(dir: dir, children: children.toList());
    }

    return _rootRoute ??= from(dir_routes);
  }

  AnalysisSession get analysisSession {
    return _session ??= AnalysisContextCollection(
      includedPaths: [dir_lib.path],
      resourceProvider: PhysicalResourceProvider(),
    ).contexts[0].currentSession;
  }

  LibraryElement? findRealExportLib<T extends Element>(T toFind,LibraryElement useAt){
    for(var import in useAt.importedLibraries){
      for(var c in analyzerUtils.findChildrenByType<T>(import)){
        if(toFind==c){
          return import;
        }
      }
    }
    return toFind.library!;
  }

  Future<({FunctionElement? layout, ToType? toType})> analysisLayout(File file) async {
    var layoutLib = (await analysisSession.getResolvedLibrary(path.normalize(path.absolute(file.path))) as ResolvedLibraryResult).element;
    FunctionElement? layoutFunction = layoutLib.definingCompilationUnit.functions.where((e) => e.name == layoutFunctionName).firstOrNull;
    if (layoutFunction == null) {
      return (layout: null, toType: null);
    }
    var findToTypeAnno = layoutFunction.metadata.map((e) => e.computeConstantValue()).where((e) {
      var t = e?.type;
      if(t == null){
        return false;
      }
      if (t.getDisplayString(withNullability: false) != toTypeName) {
        return false;
      }
      var element=t.element;
      if(element is! ClassElement){
        return false;
      }
      // result?.type?.element?.library?.children
      var publicExportFrom = findRealExportLib(element, layoutLib);
      return publicExportFrom?.identifier == toTypeDefault.type.url;
    }).firstOrNull;
    if (findToTypeAnno == null) {
      return (layout: layoutFunction, toType: null);
    }
    var type = findToTypeAnno.getField("type")?.toTypeValue();
    if (type == null) {
      return (layout: layoutFunction, toType: toTypeDefault);
    }

    var symbol = type.getDisplayString(withNullability: false);

    if (symbol == "") {
      return (layout: layoutFunction, toType: toTypeDefault);
    }

    var publicExportFrom = findRealExportLib(findToTypeAnno.type!.element!, layoutLib);
    var url = publicExportFrom?.identifier;

    return (layout: layoutFunction, toType: ToType(type: refer(symbol, url)));
  }
}

/// ref: you_flutter: ExtendTo
class ToType {
  final Reference type;

  const ToType({required this.type});

  @override
  String toString() {
    return "<ToType> type:$type";
  }
}

class RouteNode {
  final List<RouteNode> children;
  final Directory dir;
  late RouteNode _parent = this;
  ToType? toType;

  RouteNode({required this.dir, this.toType, required this.children}) {
    for (var child in children) {
      child._parent = this;
    }
  }

  int get level => isRoot ? 0 : _parent.level + 1;

  RouteNode get root => isRoot ? this : _parent.root;

  bool get isRoot => _parent == this;

  File get file_page_dart => dir.childFile("page.dart");

  File get file_layout_dart => dir.childFile("layout.dart");

  String pageImportUri(String pkgName, Directory libDir) {
    var pageDartRelativePath = path.relative(file_page_dart.path, from: libDir.path);
    return "package:$pkgName/$pageDartRelativePath";
  }

  String layoutImportUri(String pkgName, Directory libDir) {
    var pageDartRelativePath = path.relative(file_layout_dart.path, from: libDir.path);
    return "package:$pkgName/$pageDartRelativePath";
  }

  String get routePath {
    if (isRoot) {
      return "/";
    }
    return "/${path.relative(dir.path, from: root.dir.path)}";
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

  ToType findToType() {
    if (toType != null) {
      return toType!;
    }
    if (isRoot) {
      return YouCli.toTypeDefault;
    }
    return _parent.findToType();
  }
}
