import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

class Notebook {
  NoteHeader header;
  List<NoteBlock> mainBlocks;
  NoteTail tail;
  Notebook({
    required this.header,
    required this.mainBlocks,
    required this.tail,
  });
}

class NotePart {
  NotePartInfo info;
  NotePart(
    this.info,
  );
}

class NotePartInfo {
  int offset;
  int end;
  NotePartInfo(
    this.offset,
    this.end,
  );
}

class NoteHeader extends NotePart {
  NoteHeader(
    super.info,
  );
}

class NoteBlock extends NotePart {
  NoteBlock(
    super.info,
  );
}

class WriteContent {}

class LogContent extends WriteContent {}

class WidgetContent extends WriteContent {}

class MateContent extends WriteContent {}

class ContentBlock {
  final List<Widget> _contents = List.empty(growable: true);
  final int index;
  final void Function(BuildContext context, NoteCell cell)? builder;
  ContentBlock({
    required this.index,
    this.builder,
  });

  bool isEmpty() => _contents.isEmpty;

  List<Widget> get contents => List.unmodifiable(_contents);

  void add(Widget content) {
    _contents.add(content);
  }

  List<Object?> datas = List.empty(growable: true);
  void print(Object? o) {
    datas.add(o);
  }
}

class NoteTail extends NotePart {
  NoteTail(
    super.info,
  );
}
