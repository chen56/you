// ignore_for_file: unnecessary_type_check, avoid_print

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:test/test.dart';

void main() {
  test('directory recursive', () {
    FileSystem fs = LocalFileSystem();
    var d = fs.directory("./");
    d.listSync().forEach((f) {
      print(f);
    });

    PageNode page(Directory dir) {
      var children = dir.listSync(recursive: false).whereType<Directory>().map((e) => page(e));
      return PageNode(dir: dir, children: children.toList());
    }

    PageNode root = page(d);
    root.toList().forEach((e) {
      print("ssssss ${e.dir}");
    });
  });
}

class PageNode {
  List<PageNode> children;
  Directory dir;

  PageNode({required this.dir, required this.children});

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
}
