import 'package:note/page_core.dart';

class Notebook {
  NoteHeader header;
  List<NoteCell> cells;
  NoteTail tail;
  Notebook({
    required this.header,
    required this.cells,
    required this.tail,
  });
}

class BaseNotePart {
  NotePartInfo info;
  BaseNotePart(
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

class NoteHeader extends BaseNotePart {
  NoteHeader(
    super.info,
  );
}

class NoteBlock extends BaseNotePart {
  NoteBlock(
    super.info,
  );
}

class NoteCell {
  final List<BaseNoteContent> _contents = List.empty(growable: true);
  // index use to find code
  final int index;
  NoteCell({
    required this.index,
  });

  bool isEmpty() => _contents.isEmpty;

  List<BaseNoteContent> get contents => List.unmodifiable(_contents);

  void add(BaseNoteContent content) {
    _contents.add(content);
  }
}

class NoteTail extends BaseNotePart {
  NoteTail(
    super.info,
  );
}
