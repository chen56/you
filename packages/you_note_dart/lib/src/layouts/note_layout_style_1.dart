import 'package:flutter/material.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/state.dart';
import 'package:you_note_dart/src/contents/contents.dart';
import 'package:you_note_dart/src/note.dart';

/// 一个极简的笔记布局范例
/// 左边routes树，右边页面内容
final class NoteLayoutStyle1 extends StatelessWidget {
  final NoteBuilder builder;

  NoteLayoutStyle1({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SelectionArea(
          /// Watch是you_flutter的state管理组件， 被其包裹的状态可以被观测刷新(ref: Cell._contents = [].signal())
          child: Watch((context) {
            // contents是收集到调用print(xx)的所有结果
            Cell cell = Cell.empty();
            builder(context, cell);
            var pageContents = cell.toList().expand((cell) sync* {
              for (var content in cell.contents) {
                yield Align(
                  alignment: Alignment.centerLeft,
                  child: contents.contentToWidget(content),
                );
              }
            }).toList();
            return Row(
              children: [
                // IntrinsicWidth(child: _NoteTreeView(uri)),
                _NoteTreeView(),
                Flexible(child: ListView(children: pageContents)),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _NoteTreeView extends StatelessWidget {
  const _NoteTreeView();

  @override
  Widget build(BuildContext context) {
    final router = YouRouter.of(context);

    var validRoutes = router.root.toList().where((e) => !e.isLeaf || (e.isValid));
    var routeWidgets = validRoutes.map((node) {
      String title = "▼ ${node.part}";
      title = title.padLeft((node.level * 3) + title.length);

      var click = () {
        router.to(node.toUri());
      };
      return Align(
        alignment: Alignment.centerLeft,
        child: TextButton(onPressed: node.isValid ? click : null, child: Text(title)),
      );
    });
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 350),
        child: ListView(
          children: [...routeWidgets],
        ));
  }
}
