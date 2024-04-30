import 'package:flutter/material.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/state.dart';
import 'package:you_note_dart/note.dart';

final class NoteLayoutDefault extends StatelessWidget {
  final NoteBuilder builder;
  final ToUri uri;

  const NoteLayoutDefault({super.key, required this.uri, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SelectionArea(
          /// Watch是you_flutter的state管理组件， 被其包裹的状态可以被观测刷新(ref: Cell._contents = [].signal())
          child: Watch((context) {
            // contents是收集到调用print(xx)的所有结果
            Cell rootCell = Cell.empty();
            builder(context, rootCell);
            var pageContents = rootCell.toList().expand((cell) sync* {
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
