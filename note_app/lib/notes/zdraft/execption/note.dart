import 'package:flutter/material.dart';
import 'package:note/note_page.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "exception",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown("""
# exception

""");

  print("hello");
}
