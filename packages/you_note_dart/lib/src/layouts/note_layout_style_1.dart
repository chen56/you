import 'package:flutter/material.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/state.dart';
import 'package:you_note_dart/src/contents/contents.dart';
import 'package:you_note_dart/src/note.dart';

/// 一个极简的笔记布局范例
/// 左边routes树，右边页面内容
final class NoteLayoutStyle1 extends StatelessWidget {
  final NoteBuilder builder;
  final ToUri uri;

  NoteLayoutStyle1({super.key, required this.uri, required this.builder});

  @override
  Widget build(BuildContext context) {
    // 收集笔记页面内容
    Cell rootCell = Cell.empty();
    builder(context, rootCell);

    return Scaffold(
      body: SafeArea(
        /// Watch是you_flutter的state管理组件， 包裹着内容列表计算的过程，可以在Cell内容变化时刷新
        child: Watch((context) {
          // contents是收集到调用print(xx)的所有结果
          var pageContents = rootCell.toList().expand((cell) sync* {
            for (var content in cell.contents) {
              yield Align(
                alignment: Alignment.centerLeft,
                child: contents.contentToWidget(content),
              );
            }
          }).toList();
          return Row(
            children: [
              LimitedBox(maxWidth: 500, child: _NoteTreeView(uri)),
              Flexible(child: ListView(children: pageContents)),
            ],
          );
        }),
      ),
    );
  }
}

class _NoteTreeView extends StatelessWidget {
  final ToUri uri;

  const _NoteTreeView(this.uri);

  @override
  Widget build(BuildContext context) {
    YouRouter router = YouRouter.of(context);

    var routes = uri.to.root.toList().map((node) {
      String title = "▼ ${node.part} ${node.isValid ? "" : "x"}";
      title = title.padLeft((node.level * 3) + title.length);

      var click = () {
        router.to(node.toUri());
      };
      return Padding(
        // 缩进模仿树形
        padding: EdgeInsets.only(left: 10),
        // 一页一个链接
        child: Align(alignment: Alignment.centerLeft, child: TextButton(onPressed: click, child: Text(title))),
      );
    });
    return ListView(
      children: [...routes],
    );
  }
}
