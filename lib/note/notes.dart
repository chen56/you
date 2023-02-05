import 'package:learn_flutter/note/@common/note.dart';
import 'package:learn_flutter/note/material/text/Text/note.dart' as material_text_text;
import 'package:learn_flutter/note/material/text/RichText//note.dart' as material_text_rich_text;
import 'package:learn_flutter/note/state/1.vanilla_state/note.dart' as vanilla_state;
import 'package:learn_flutter/skeleton.dart';


Pag root = Pag("state", skeleton:RootSkeleton(),children: [
  Pag("/note", children: [
    Pag("material", children: [
      Pag("button", children: []),
      Pag("text", children: [
        material_text_text.note,
        material_text_rich_text.note,
      ]),
    ]),
    Pag("state", children: [
      vanilla_state.note,
    ]),
  ]),
]);

class PageRule {
  PageRule({
    required this.id,
    required this.path,
    required this.title,
    required this.children,
  });

  ///id是自动生成的，防止目录[path]变更后导致收藏的链接失效
  /// https://x.com/note/dev/mirror -> https://x.com/1?tip=note/dev/mirror
  /// 起作用其实只有：https://x.com/1
  final int id;

  /// [path]只作为提示，不作为url的核心部分，参考[id]字段
  final String path;
  final String title;
  final List<PageRule> children;
}
//
// var pages = (
// /**/note: (
// /****/dev : (
// /******/mirror: root.child("/note/dev/mirror"),
// /****/),
// /**/)
// );
// var pages2 = (
// noteDevMirror: root.child("/note/dev/mirror"),
// );
//
// main() {
//   var x = pages.note;
// }
//
// var pages = (
// /**/note: (
// /****/dev : (
// /******/mirror: root.child("/note/dev/mirror"),
// /****/),
// /**/)
// );
// var pages2 = (
// noteDevMirror: root.child("/note/dev/mirror"),
// );
//
// main() {
//   var x = pages.note;
// }
