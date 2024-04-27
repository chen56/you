import 'package:flutter/widgets.dart';
import 'package:you_flutter/router.dart';
import 'package:you_note_dart/note.dart';
import 'package:you_note_dart/note_layouts.dart';

PageBuilder layout(NoteBuilder builder) {
  return (context, uri) => NoteLayoutStyle1(uri: uri, builder: builder);
}

Widget layout2(BuildContext context, ToUri uri, NoteBuilder builder) {
  return NoteLayoutStyle1(uri: uri, builder: builder);
}
