import 'package:file/file.dart';
import 'package:path/path.dart' as path;
import 'package:you_cli/src/yaml.dart';

// ignore: non_constant_identifier_names
// final Glob _PAGE_GLOB = Glob("{**/page.dart,page.dart}");

class YouCli {
  YouCli({required this.projectDir}) : fs = projectDir.fileSystem;

  final Directory projectDir;
  final FileSystem fs;
  Pubspec? _pubspec;
  RouteNode? _rootRoute;

  Directory get routeDir => projectDir.childDirectory("lib/routes");

  Directory get notesRouteDir => projectDir.childDirectory("lib/routes/notes");

  Directory get libDir => projectDir.childDirectory("lib");

  File get pubspecYamlFile => projectDir.childFile("pubspec.yaml");

  Pubspec get pubspec => _pubspec ??= Pubspec.parseFileSync(pubspecYamlFile);

  RouteNode get rootRoute => _rootRoute ??= RouteNode.fromSync(routeDir);
}

class RouteNode {
  List<RouteNode> children;
  Directory dir;
  late RouteNode _parent = this;

  RouteNode({required this.dir, required this.children}) {
    for (var child in children) {
      child._parent = this;
    }
  }

  int get level => isRoot ? 0 : _parent.level + 1;

  static RouteNode fromSync(Directory dir) {
    if (!dir.existsSync()) {
      return RouteNode(dir: dir, children: []);
    }
    var children = dir.listSync(recursive: false).whereType<Directory>().map((e) => fromSync(e));
    return RouteNode(dir: dir, children: children.toList());
  }

  RouteNode get root => isRoot ? this : _parent.root;

  bool get isRoot => _parent == this;

  // ignore: non_constant_identifier_names
  File get page_dart => dir.childFile("page.dart");

  // ignore: non_constant_identifier_names
  File get layout_dart => dir.childFile("layout.dart");

  String pageImportUri(String pkgName, Directory libDir) {
    var pageDartRelativePath = path.relative(page_dart.path, from: libDir.path);
    return "package:$pkgName/$pageDartRelativePath";
  }

  String layoutImportUri(String pkgName, Directory libDir) {
    var pageDartRelativePath = path.relative(layout_dart.path, from: libDir.path);
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
    if (layout_dart.existsSync()) {
      return this;
    }
    if (isRoot) {
      return null;
    }
    return _parent.findLayoutSync();
  }
}
