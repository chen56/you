import 'package:flutter/material.dart';

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

class ContentBlock {
  final List<Widget> _contents = List.empty(growable: true);
  final int index;
  final void Function()? block;
  ContentBlock({
    required this.index,
    this.block,
  });

  bool isEmpty() => _contents.isEmpty;

  List<Widget> get contents => List.unmodifiable(_contents);

  void add(Widget content) {
    _contents.add(content);
  }
}

class NoteTail extends NotePart {
  NoteTail(
    super.info,
  );
}
