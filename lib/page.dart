import 'package:learn_flutter/@page.dart';
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

P root = P("/", frame: <T>(P<T> note) => RootFrame<T>(note), meta: rootPage, kids: [
  P<void>("not_found", meta: notFoundPage),
  P<void>("note", frame: <T>(P<T> note) => RootFrame<T>(note), kids: [
    P<void>("material", kids: [
      P<void>("button", kids: [
        P<void>("ElevatedButton", meta: widgetElevatedButtonNote),
      ]),
      P<void>("text", kids: [
        P<void>("RichText", meta: widgetTextNote),
        P<void>("Text", meta: widgetRichTextNote),
      ]),
      P<void>("slider", meta: widgetSliderNote),
    ]),
    P<void>("state", kids: [
      P<void>("1.vanilla_state", meta: vanillaStateNote),
      P<void>("StatefulBuilder", meta: widgetStatefulBuilderNote),
    ]),
    P<void>("dev", kids: [
      P<void>("debug", meta: devDebugNote),
      P<void>("mirror", meta: devMirrorNote),
    ]),
  ]),
]);

P page(path) => root.kid(path);

class Paths {
  final notFound = page("/not_found");
  final home = page("/");

  Paths._();
}

var paths = Paths._();
