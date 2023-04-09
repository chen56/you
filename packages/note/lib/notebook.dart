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

class NoteTail extends NotePart {
  NoteTail(
    super.info,
  );
}
