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

  String packageImportUri(String pkgName) => "package:$pkgName/${path.relative(dir.path, from: root.dir.path)}";

  String get routePath {
    if(isRoot){
      return "/";
    }
    return "/${path.relative(dir.path, from: root.dir.path)}";
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
