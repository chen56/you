import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/state.dart';
import 'package:you_note_dart/src/content/markdown_content.dart';
import 'package:you_note_dart/src/note.dart';

@immutable
final class NoteLayoutStyle1 extends StatelessWidget {
  final NoteBuilder builder;
  final ToUri uri;

  const NoteLayoutStyle1({super.key, required this.uri, required this.builder});

  @override
  Widget build(BuildContext context) {
    Cell rootCell = Cell.empty();
    builder(context, rootCell);
    return Column(
      children: [
        ...rootCell.children.map((e) => _NoteCellView(e)),
      ],
    );
  }
}

///
/// code | codeView
/// bar  | -------------------
/// view | contentView
class _NoteCellView extends StatelessWidget {
  final Cell cell;

  _NoteCellView(this.cell);

  @override
  Widget build(BuildContext context) {
    var cellContents = cell.contents.map((content) {
      return switch (content) {
        MD _ => Markdown(data: content.text),
        Widget _ => content,
        _ => Text("$content"),
      };
    });

    return Watch(
      (context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ...cellContents,
      ]),
    );
  }
}
