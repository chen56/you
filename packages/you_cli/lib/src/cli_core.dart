// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:code_builder/code_builder.dart';
import 'package:file/file.dart';
import 'package:path/path.dart' as path;
import 'package:_you_dart_internal/analyzer.dart';

// final Glob _PAGE_GLOB = Glob("{**/page.dart,page.dart}");
class YouCli {
  YouCli({required Directory projectDir})
      : path_project = projectDir.fileSystem.directory(path.normalize(path.absolute(projectDir.path))),
        fs = projectDir.fileSystem;

  static const Reference toType = Reference("To", "package:you_flutter/router.dart");
  static const Reference toNoteType = Reference("ToNote", "package:you_flutter/note.dart");
  static const Reference forPageType = Reference("To", "package:you_flutter/router.dart");
  static const String layoutFunctionName = "build";
  static const String pageFunctionName = "build";
  final Directory path_project;
  final FileSystem fs;
  Pubspec? _pubspec;
  RouteDir? _rootRoute;
  AnalysisSession? _session;

  Directory get path_lib => path_project.childDirectory("lib");

  Directory get path_routes => path_project.childDirectory("lib/routes");

  Directory get path_notes => path_project.childDirectory("lib/routes/notes");

  File get path_routes_g_dart => path_project.childFile("lib/routes.g.dart");

  File get path_assets_g_dart => path_project.childFile("lib/assets.g.dart");

  File get path_pubspec_yaml => path_project.childFile("pubspec.yaml");

  Pubspec get pubspec => _pubspec ??= Pubspec.parse(path_pubspec_yaml.readAsStringSync());

  static String pathToFlat(String path$) {
    if (path$ == "/") {
      return "root";
    }
    var names = path$.split(path.separator).where((e) => e.isNotEmpty);
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

  AnalysisSession get analysisSession {
    return _session ??= AnalysisContextCollection(
      includedPaths: [path_lib.path],
      resourceProvider: PhysicalResourceProvider(),
    ).contexts[0].currentSession;
  }

  Future<RouteDir> get rootRoute async => _rootRoute ??= await RouteDir.from(this, path_routes);

  Future<FunctionElement?> analyzeLayout(File file) async {
    if (!await file.exists()) {
      return null;
    }

    CompilationUnitReader unit = await CompilationUnitReader.resolve(analysisSession, file.path);
    return unit.topFunction(layoutFunctionName);
  }

  Future<FunctionElement?> analyzePage(File file) async {
    if (!await file.exists()) {
      return null;
    }
    CompilationUnitReader unit = await CompilationUnitReader.resolve(analysisSession, file.path);
    return unit.topFunction(pageFunctionName);
  }

  Future<PageAnnotation?> analyzePageAnno(File file) async {
    if (!await file.exists()) {
      return null;
    }
    CompilationUnitReader unit = await CompilationUnitReader.resolve(analysisSession, file.path);
    return PageAnnotation.find(unit);
  }
}

class PageAnnotation {
  static const String annoName = "PageAnnotation";

  PageAnnotation(this.anno);

  AnnotationReader anno;

  static PageAnnotation? find(CompilationUnitReader unit) {
    var anno = unit.annotationOnTopFunction(funcName: YouCli.pageFunctionName, annoType: annoName);
    if (anno == null) return null;
    return PageAnnotation(AnnotationReader(anno.ast, anno.value, unit));
  }

  String get label => anno.getField("label")!.toStringValue()!;

  Reference? get toType {
    return anno.getFieldTypeAsRef("toType");
  }

  String get toSource => anno.annotation.toSource();
}

class RouteDir {
  RouteDir({
    required this.dir,
    required this.children,
    this.layout,
    this.page,
    required this.cli,
    this.pageAnno,
  }) {
    for (var child in children) {
      child._parent = this;
    }
  }

  static const String pageDart = "page.dart";
  static const String layoutDart = "layout.dart";

  final YouCli cli;
  final List<RouteDir> children;
  final Directory dir;
  final FunctionElement? layout;
  final FunctionElement? page;
  late RouteDir _parent = this;
  final PageAnnotation? pageAnno;

  static Future<RouteDir> from(YouCli cli, Directory dir) async {
    if (!dir.existsSync()) {
      return RouteDir(cli: cli, dir: dir, children: []);
    }

    var children = await Future.wait(dir
        .listSync(recursive: false)
        //
        .whereType<Directory>()
        .map((e) async => await from(cli, e)));
    var layoutFunction = await cli.analyzeLayout(dir.childFile(layoutDart));
    return RouteDir(
      cli: cli,
      dir: dir,
      page: await cli.analyzePage(dir.childFile(pageDart)),
      pageAnno: await cli.analyzePageAnno(dir.childFile(pageDart)),
      layout: layoutFunction,
      children: children,
    );
  }

  bool get isRoute => !dir.basename.startsWith("_");

  get hasPage => page != null;

  int get level => isRoot ? 0 : _parent.level + 1;

  RouteDir get root => isRoot ? this : _parent.root;

  bool get isRoot => _parent == this;

  File get path_page_dart => dir.childFile("page.dart");

  File get path_layout_dart => dir.childFile("layout.dart");

  String get routePath {
    if (isRoot) {
      return "/";
    }
    return "/${path.relative(dir.path, from: root.dir.path)}";
  }

  String get assetPath {
    if (isRoot) {
      return "lib/routes/";
    }
    return "lib/routes$routePath/";
  }

  String get pagePackageUrl {
    return "package:${cli.pubspec.name}/${path.relative(path_page_dart.path, from: cli.path_lib.path)}";
  }

  String get layoutPackageUrl {
    return "package:${cli.pubspec.name}/${path.relative(path_layout_dart.path, from: cli.path_lib.path)}";
  }

  /// note name平整化,可作为变量名：
  /// lib/routes/1.a/b/page.dart  ---> a_b
  String get flatName => YouCli.pathToFlat(routePath);

  List<RouteDir> toList({
    bool includeThis = true,
    bool Function(RouteDir path)? where,
    Comparator<RouteDir>? sortBy,
  }) {
    where = where ?? (e) => true;
    if (!where(this)) {
      return [];
    }
    List<RouteDir> sorted = List.from(children);
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

  RouteDir? findLayoutSync() {
    if (path_layout_dart.existsSync()) {
      return this;
    }
    if (isRoot) {
      return null;
    }
    return _parent.findLayoutSync();
  }

  Reference findToType() {
    if (pageAnno?.toType != null) {
      return pageAnno!.toType!;
    }
    if (isRoot) {
      return YouCli.forPageType;
    }
    return _parent.findToType();
  }
}
