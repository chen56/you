import 'package:you_flutter/router.dart';
import 'package:you_note_dart/note.dart';
import 'package:you_note_dart/note_layouts.dart';

PageBuilder layout(NoteBuilder builder) {
  return (context, uri) => NoteLayoutStyle1(uri: uri, builder: builder);
}
