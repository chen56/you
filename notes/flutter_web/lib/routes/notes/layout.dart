import 'package:flutter/widgets.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/note.dart';

/// [NoteLayoutBuilder]
@ToType(type: ToNote)
Widget layout(BuildContext context, NoteBuilder builder) {
  // ignore: unnecessary_type_check
  assert(layout is NoteLayoutBuilder);
  return NoteLayoutStyle1(builder: builder);
}
