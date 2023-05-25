import 'package:flutter/widgets.dart';
import 'package:note/note.dart';

import 'package:note_app/note_app.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "devtool",
  builder: build,
  layout: Layouts.defaultLayout(defaultCodeExpand: true),
);

build(BuildContext context, Pen print) async {
  print.markdown(r'''
# devtool 

flutter 开发模式的调试工具, 用于查看组件树, 查看日志, 查看性能, 查看内存, 查看网络请求等等
  ''');
}
