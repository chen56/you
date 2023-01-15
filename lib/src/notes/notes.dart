import 'package:learn_flutter/src/note/note.dart';
import 'package:learn_flutter/src/notes/material/text/Text/note.dart' as material_text_Text;
import 'package:learn_flutter/src/notes/material/text/RichText//note.dart'
    as material_text_RichText;

Note noteRoot = Note("Root", children: [
  Note("material", children: [
    Note("button", children: []),
    Note("text", children: [
      material_text_Text.doc,
      material_text_RichText.doc,
    ]),
  ]),
]);
