import 'package:learn_flutter/@page.dart';
import 'package:learn_flutter/note/@page.dart';
import 'package:learn_flutter/note/note.dart';
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

var rootFrame = <T>(Dir<T> note) => NoteFrame<T>(note);

Dir<void> root = Dir<void>("/", frame: rootFrame, meta: rootPage, kids: [
  Dir<void>("not_found", meta: notFoundPage),
  Dir<void>("note", frame: rootFrame, meta: notePage, kids: [
    Dir<void>("material", kids: [
      Dir<void>("button", kids: [
        Dir<void>("ElevatedButton", meta: widgetElevatedButtonNote),
      ]),
      Dir<void>("text", kids: [
        Dir<void>("RichText", meta: widgetTextNote),
        Dir<void>("Text", meta: widgetRichTextNote),
      ]),
      Dir<void>("slider", meta: widgetSliderNote),
    ]),
    Dir<void>("state", kids: [
      Dir<void>("1.vanilla_state", meta: vanillaStateNote),
      Dir<void>("StatefulBuilder", meta: widgetStatefulBuilderNote),
    ]),
    Dir<void>("dev", kids: [
      Dir<void>("debug", meta: devDebugNote),
      Dir<void>("mirror", meta: devMirrorNote),
    ]),
  ]),
]);

Dir page(path) => root.kid(path);

class Paths {
  final Dir<void> notFound = page("/not_found");
  final Dir<void> home = page("/");

  Paths._();
}

var paths = Paths._();
