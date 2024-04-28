import 'package:flutter/widgets.dart';
import 'package:you_flutter/router.dart';
import 'package:you_note_dart/note.dart';
import 'package:you_note_dart/note_layouts.dart';
/// [PageLayoutBuilder]
@ToType(type: ToNote)
Widget layout(BuildContext context, ToUri uri, Cell cell) {
  return NoteLayoutStyle1(uri: uri, cell: cell);
}
