import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  print(const MD(r'''
# devtool

flutter 开发模式的调试工具, 用于查看组件树, 查看日志, 查看性能, 查看内存, 查看网络请求等等
  '''));

  print=print.addCell(title: const Text("first"));

}
