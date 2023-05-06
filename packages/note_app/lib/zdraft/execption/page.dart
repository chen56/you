import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

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
