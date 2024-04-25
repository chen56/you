import 'package:file/file.dart';
import 'package:path/path.dart' as path;

class PageDir {
  List<PageDir> children;
  Directory dir;
  late PageDir _parent = this;

  PageDir({required this.dir, required this.children}) {
    for (var child in children) {
      child._parent = this;
    }
  }

  static PageDir fromSync(Directory dir) {
    var children = dir.listSync(recursive: false).whereType<Directory>().map((e) => fromSync(e));
    return PageDir(dir: dir, children: children.toList());
  }

  PageDir get root => isRoot ? this : _parent.root;

  bool get isRoot => _parent == this;

  // ignore: non_constant_identifier_names
  File get page_dart => dir.childFile("page.dart");
  // ignore: non_constant_identifier_names
  File get layout_dart => dir.childFile("layout.dart");

  String pageImportUri(String pkgName,Directory libDir) {
    var pageDartRelativePath = path.relative(page_dart.path, from: libDir.path);
    return "package:$pkgName/$pageDartRelativePath";
  }
  String layoutImportUri(String pkgName,Directory libDir) {
    var pageDartRelativePath = path.relative(layout_dart.path, from: libDir.path);
    return "package:$pkgName/$pageDartRelativePath";
  }

  String get routePath {
    if(isRoot){
      return "/";
    }
    return "/${path.relative(dir.path, from: root.dir.path)}";
  }

  /// note name平整化,可作为变量名：
  /// lib/pages/1.a/b/page.dart  ---> a_b
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
  List<PageDir> toList({
    bool includeThis = true,
    bool Function(PageDir path)? where,
    Comparator<PageDir>? sortBy,
  }) {
    where = where ?? (e) => true;
    if (!where(this)) {
      return [];
    }
    List<PageDir> sorted = List.from(children);
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

  PageDir? findLayoutSync() {
    if(layout_dart.existsSync()) {
      return this;
    }
    if(isRoot) {
      return null;
    }
    return _parent.findLayoutSync();
  }
}
