// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:code_builder/code_builder.dart';
import 'package:file/file.dart';
import 'package:path/path.dart' as path;
import 'package:you_cli/src/analyzer.dart';
import 'package:you_cli/src/pubspec.dart';

// final Glob _PAGE_GLOB = Glob("{**/page.dart,page.dart}");
class YouCli {
  YouCli({required Directory projectDir})
      : dir_project = projectDir.fileSystem.directory(path.normalize(path.absolute(projectDir.path))),
        fs = projectDir.fileSystem;

  static const Reference toType = Reference("To", "package:you_flutter/router.dart");
  static const Reference toNoteType = Reference("ToNote", "package:you_flutter/note.dart");
  static const Reference forPageType = Reference("To", "package:you_flutter/router.dart");
  static const String layoutFunctionName = "build";
  static const String pageFunctionName = "build";
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

  AnalysisSession get analysisSession {
    return _session ??= AnalysisContextCollection(
      includedPaths: [dir_lib.path],
      resourceProvider: PhysicalResourceProvider(),
    ).contexts[0].currentSession;
  }

  Future<RouteNode> get rootRoute async => _rootRoute ??= await RouteNode.from(this, dir_routes);

  Future<FunctionElement?> analyzeLayout(File file) async {
    if (!await file.exists()) {
      return null;
    }

    UnitAnalyzer unit = await UnitAnalyzer.resolve(analysisSession, file);
    return unit.topFunction(layoutFunctionName);
  }

  Future<FunctionElement?> analyzePage(File file) async {
    if (!await file.exists()) {
      return null;
    }
    UnitAnalyzer unit = await UnitAnalyzer.resolve(analysisSession, file);
    return unit.topFunction(pageFunctionName);
  }

  Future<PageAnnotationAnalyzer?> analyzePageAnno(File file) async {
    if (!await file.exists()) {
      return null;
    }
    UnitAnalyzer unit = await UnitAnalyzer.resolve(analysisSession, file);
    return PageAnnotationAnalyzer.find(unit);
  }
}

class PageAnnotationAnalyzer extends AnnotationAnalyzer {
  static const String annoName = "PageAnnotation";

  PageAnnotationAnalyzer(super.annotation, super.dartObject, super.unit);

  static PageAnnotationAnalyzer? find(UnitAnalyzer unit) {
    var anno = unit.annotationOnTopFunction(funcName: YouCli.pageFunctionName, annoType: annoName);
    if (anno == null) return null;
    return PageAnnotationAnalyzer(anno.ast, anno.value, unit);
  }

  String get label => getField("label")!.toStringValue()!;

  Reference? get toType {
    return getFieldTypeAsRef("toType");
  }

  String get toSource => annotation.toSource();
}

class RouteNode {
  RouteNode({
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
  final List<RouteNode> children;
  final Directory dir;
  final FunctionElement? layout;
  final FunctionElement? page;
  late RouteNode _parent = this;
  final PageAnnotationAnalyzer? pageAnno;

  static Future<RouteNode> from(YouCli cli, Directory dir) async {
    if (!dir.existsSync()) {
      return RouteNode(cli: cli, dir: dir, children: []);
    }

    var children = await Future.wait(dir.listSync(recursive: false).whereType<Directory>().map((e) async => await from(cli, e)));
    var layoutFunction = await cli.analyzeLayout(dir.childFile(layoutDart));
    return RouteNode(
      cli: cli,
      dir: dir,
      page: await cli.analyzePage(dir.childFile(pageDart)),
      pageAnno: await cli.analyzePageAnno(dir.childFile(pageDart)),
      layout: layoutFunction,
      children: children,
    );
  }

  get hasPage => page != null;

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
