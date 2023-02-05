import 'package:learn_flutter/note/@common/note.dart';
import 'package:learn_flutter/note/dev/debug/note.dart';
import 'package:learn_flutter/note/dev/mirror/page.dart';
import 'package:learn_flutter/note/material/button/ElevatedButton/note.dart';
import 'package:learn_flutter/note/material/slider/note.dart';
import 'package:learn_flutter/note/material/text/RichText/note.dart';
import 'package:learn_flutter/note/material/text/Text/note.dart';
import 'package:learn_flutter/note/state/1.vanilla_state/note.dart';
import 'package:learn_flutter/note/state/StatefulBuilder/note.dart';
import 'package:learn_flutter/skeleton.dart';

Note rootPage = Note("/", frame: RootFrame(), kids: [
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

Note $(path) => rootPage.kid(path);

var root = (
/**/$:$("/"),
/**/note: (
/****/material : (
/******/text:(
/********/RichText: $("/note/text/RichText"),
/********/Text: $("/note/text/Text"),
/****/),
/****/),
/****/dev : (
/******/mirror: $("/note/dev/mirror"),
/****/),
/**/)
);

main() {
  root.$.skeleton = RootFrame();
  // var x = pages.self./**/;
}

