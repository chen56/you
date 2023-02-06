import 'package:learn_flutter/note/@common/note.dart';
import 'package:learn_flutter/note/dev/debug/@page.dart';
import 'package:learn_flutter/note/dev/mirror/@page.dart';
import 'package:learn_flutter/note/material/button/ElevatedButton/@page.dart';
import 'package:learn_flutter/note/material/slider/@page.dart';
import 'package:learn_flutter/note/material/text/RichText/@page.dart';
import 'package:learn_flutter/note/material/text/Text/@page.dart';
import 'package:learn_flutter/note/state/1.vanilla_state/@page.dart';
import 'package:learn_flutter/note/state/StatefulBuilder/@page.dart';
import 'package:learn_flutter/page_frame.dart';

import 'not_found/@page.dart';

Note root = Note("/", frame: (note) => RootFrame(note), kids: [
  Note("not_found", meta: notFoundPage),
  Note("note", kids: [
    Note("material", kids: [
      Note("button", kids: [
        Note("ElevatedButton", meta: widgetElevatedButtonNote),
      ]),
      Note("text", kids: [
        Note("RichText", meta: widgetTextNote),
        Note("Text", meta: widgetRichTextNote),
      ]),
      Note("slider", meta: widgetSliderNote),
    ]),
    Note("state", kids: [
      Note("1.vanilla_state", meta: vanillaStateNote),
      Note("StatefulBuilder", meta: widgetStatefulBuilderNote),
    ]),
    Note("dev", kids: [
      Note("debug", meta: devDebugNote),
      Note("mirror", meta: devMirrorNote),
    ]),
  ]),
]);

Note page(path) => root.kid(path);

class Paths {
  final home = page("/note/material/button/ElevatedButton");
  final notFound = page("/not_found");

  Paths._();
}

var paths = Paths._();
