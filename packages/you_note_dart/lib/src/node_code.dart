
import 'package:meta/meta.dart';
import 'package:you_note_dart/src/note_page.dart';


typedef NoteSourceData = ({
List<
    ({
    String cellType,
    int end,
    int offset,
    List<
        ({
        String nodeType,
        int end,
        int offset,
        })> specialNodes,
    })> cells,
// NoteConfPart meta
});

// TODO 130 remove
/// ref: [LazyNoteBuilder]
class DeprecatedNotePage {

  // TODO 130 remove
  // final String content; // source code content
  DeprecatedNotePage();

  @internal
  String getCellCode(CodeEntity codeEntity) {
    // TODO 130 remove
    // if (codeEntity.end > content.length) {
    //   return "// ${codeEntity.offset}:(${codeEntity.end}) >= code.length(${content.length})  ";
    // }
    // return content.safeSubstring(codeEntity.offset, codeEntity.end);
    return "";
  }
}


@internal
class NoteSource {
  final NoteSourceData pageGenInfo;

  NoteSource({required this.pageGenInfo});
}

@internal
class CodeEntity {
  /// CodeEntity is same as analyzer [SyntacticEntity] class CodeEntity {
  final int offset;
  final int end;

  CodeEntity({required this.offset, required this.end});

  int get length => end - offset;

  @override
  String toString() {
    return "CodeEntity(offset:$offset, end:$end, length:$length )";
  }
}

class CellSource {
  CellSource({
    required this.cellType,
    required this.codeEntity,
    required this.specialSources,
    required this.page,
  });

  final CellType cellType;
  final CodeEntity codeEntity;
  final List<SpecialSource> specialSources;
  final DeprecatedNotePage page;

  String get code {
    return page.getCellCode(codeEntity);
  }

  bool get isCodeEmpty {
    return code.contains(RegExp(r'^\s*$'));
  }

  bool get isCodeNotEmpty {
    return !isCodeEmpty;
  }

  @override
  String toString() {
    return "CellSource:cellType:$cellType block:$codeEntity )";
  }
}

@internal
class SpecialSource {
  /// todo codeType to enum, common use by this and note_dev_gen.dart
  String codeType;
  final CodeEntity codeEntity;
  final DeprecatedNotePage page;
  final NoteRoute note;
  // final NoteSource pageSource;

  SpecialSource({
    required this.codeType,
    required this.codeEntity,
    required this.page,
    required this.note,
  }) //:TODO 130 remove pageSource = note.source
  ;

  String get code {
    return page.getCellCode(codeEntity);
  }

  @override
  String toString() {
    return "SpecialSource(codeType:$codeType,codeEntity:$codeEntity,)";
  }
}

@internal
enum CellType {
  header,
  body,
  tail;

  static CellType parse(String name) {
    for (CellType t in CellType.values) {
      if (t.name == name) return t;
    }
    throw Exception("CellType.name:$name not exist");
  }
}
