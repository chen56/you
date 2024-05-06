import 'package:flutter/material.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/note.dart';
import 'package:you_flutter/state.dart';

/// [NoteLayoutBuilder]
@ToType(type: ToNote)
NoteResult layout(BuildContext context, NoteResult child) {
  // ignore: unnecessary_type_check
  assert(layout is NoteLayoutBuilder);
  return child.warp(NoteLayout(child: child));
}

/// 一个极简的笔记布局范例
/// 左边routes树，右边页面内容
final class NoteLayout extends StatelessWidget {
  final NoteResult child;

  const NoteLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SelectionArea(
          /// Watch是you_flutter的state管理组件， 被其包裹的状态可以被观测刷新(ref: Cell._contents = [].signal())
          child: Watch((context) {
            // contents是收集到调用print(xx)的所有结果
            var pageContents = child.cell.toList().expand((cell) sync* {
              for (var content in cell.contents) {
                yield Align(
                  alignment: Alignment.centerLeft,
                  child: contents.contentToWidget(content),
                );
              }
            }).toList();
            return ListView(children: pageContents);
          }),
        ),
      ),
    );
  }
}
