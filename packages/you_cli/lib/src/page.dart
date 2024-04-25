import 'package:file/file.dart';
import 'package:path/path.dart' as path;

class PageNode {
  List<PageNode> children;
  Directory dir;
  late PageNode _parent = this;

  PageNode({required this.dir, required this.children}) {
    for (var child in children) {
      child._parent = this;
    }
  }

  static PageNode fromSync(Directory dir) {
    var children = dir.listSync(recursive: false).whereType<Directory>().map((e) => fromSync(e));
    return PageNode(dir: dir, children: children.toList());
  }

  PageNode get root => isRoot ? this : _parent.root;

  bool get isRoot => _parent == this;

  File get pageDart => dir.childFile("page.dart");

  String packageImportUri(String pkgName,Directory libDir) {
    var pageDartRelativePath = path.relative(pageDart.path, from: libDir.path);
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
  List<PageNode> toList({
    bool includeThis = true,
    bool Function(PageNode path)? where,
    Comparator<PageNode>? sortBy,
  }) {
    where = where ?? (e) => true;
    if (!where(this)) {
      return [];
    }
    List<PageNode> sorted = List.from(children);
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
}
