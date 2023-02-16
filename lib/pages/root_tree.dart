import 'package:learn_flutter/pages/@page.dart';
import 'package:learn_flutter/pages/not_found/@page.dart';
import 'package:learn_flutter/pages/note/1.welcome/@page.dart';
import 'package:learn_flutter/pages/note/@page.dart';
import 'package:learn_flutter/page.dart';
import 'package:learn_flutter/pages/note/dev/debug/@page.dart';
import 'package:learn_flutter/pages/note/dev/mirror/@page.dart';
import 'package:learn_flutter/pages/note/material/button/ElevatedButton/@page.dart';
import 'package:learn_flutter/pages/note/material/slider/@page.dart';
import 'package:learn_flutter/pages/note/material/text/Text/@page.dart';
import 'package:learn_flutter/pages/note/state/1.vanilla_state/@page.dart';
import 'package:learn_flutter/pages/note/state/StatefulBuilder/@page.dart';


// 试用了dart 3 record，没有自省功能，无法替换掉下面的强类型字段树，已提交需求：
// <https://github.com/dart-lang/language/issues/2826>
// DART 3 Records Feature Requirement: Can it provide introspection capabilities similar to enum.values #2826
// 需求被拒绝，貌似这种自省需求会影响到dart的性能策略,只能另想办法

N<void> root = N<void>("/", meta: rootPage, kids: [
  N<void>("not_found", meta: notFoundPage),
  N<void>("note", meta: notePage, kids: [
    N<void>("welcome", meta: welcomePage),
    N<void>("material", kids: [
      N<void>("button", kids: [
        N<void>("ElevatedButton", meta: widgetElevatedButtonNote),
      ]),
      N<void>("text", kids: [
        N<void>("RichText", meta: widgetTextNote),
      ]),
      N<void>("slider", meta: widgetSliderNote),
    ]),
    N<void>("state", kids: [
      N<void>("1.vanilla_state", meta: vanillaStateNote),
      N<void>("StatefulBuilder", meta: widgetStatefulBuilderNote),
    ]),
    N<void>("dev", kids: [
      N<void>("debug", meta: devDebugNote),
      N<void>("mirror", meta: devMirrorNote),
    ]),
  ]),
]);

N page(path) => root.kid(path);

class Paths {
  final N<void> home = page("/");
  final N<void> notFound = page("/not_found");
  final N<void> note = page("/note");
  final N<void> welcome = page("/note/welcome");

  Paths._();
}

var paths = Paths._();
