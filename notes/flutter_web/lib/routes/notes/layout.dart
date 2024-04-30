import 'package:flutter/widgets.dart';
import 'package:you_flutter/router.dart';
import 'package:you_note_dart/note.dart';
import 'package:you_note_dart/note_layouts.dart';

/// [NoteLayoutBuilder]
@ToType(type: Note)
Widget layout(BuildContext context, NoteBuilder builder) {
  // ignore: unnecessary_type_check
  assert(layout is NoteLayoutBuilder);
  return NoteLayoutStyle1(builder: builder);
}
