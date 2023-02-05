import 'package:learn_flutter/navigator.dart';
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

import 'not_found/page.dart';

Note rootPage = Note(
  "/",
  frame: (note) => RootFrame(note),
  kids: [
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
  ],
);

Note page(path) => rootPage.kid(path);

class Paths {
  static final List<Peg> _list = List.empty(growable: true);

  final home = page("/note/meterial/button/ElevatedButton");
  final notFound = _rule<void>("/404", (uri) => NotFoundScreen(unknown: uri));

  List<Peg> get list => List.unmodifiable(_list);

  Paths._();

  static Peg<R> _rule<R>(String path, Screen<R>? Function(Uri a) parse) {
    var result = PegImpl<R>(path: path, parse: parse);
    _list.add(result);
    return result;
  }
}

var paths = Paths._();

main() {
  // var x = pages.self./**/;
}
