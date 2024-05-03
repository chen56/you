import 'package:flutter/material.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/note.dart';
import 'package:you_flutter/state.dart';

/// [NoteLayoutBuilder]
@ToType(type: ToNote)
BuildNote layout(BuildContext context, BuildNote child) {
  // ignore: unnecessary_type_check
  assert(layout is NoteLayoutBuilder);
  return child.warp(NoteLayout(child: child));
}

/// 一个极简的笔记布局范例
/// 左边routes树，右边页面内容
final class NoteLayout extends StatelessWidget {
  final BuildNote child;

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
            return Row(
              children: [
                // IntrinsicWidth(child: _NoteTreeView(uri)),
                const _RouteTree(),
                Flexible(child: ListView(children: pageContents)),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _RouteTree extends StatelessWidget {
  const _RouteTree();

  @override
  Widget build(BuildContext context) {
    final route = YouRouter.of(context);

    var validRoutes = route.root.toList().where((e) => e.hasPage || e.isNonLeaf);
    var routeWidgets = validRoutes.map((node) {
      String title = "▼ ${node.part}";
      title = title.padLeft((node.level * 3) + title.length);

      click() {
        route.to(node.toUri());
      }

      return Align(
        alignment: Alignment.centerLeft,
        child: TextButton(onPressed: node.hasPage ? click : null, child: Text(title)),
      );
    });
    return ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 350),
        child: ListView(
          children: [
            ...routeWidgets,
          ],
        ));
  }
}
