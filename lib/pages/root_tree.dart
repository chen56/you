import 'package:learn_flutter/navigator_v2.dart';
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

Path<void> root = Path<void>("/", meta: rootPage, kids: [
  Path<void>("not_found", meta: notFoundPage),
  Path<void>("note", meta: notePage, kids: [
    Path<void>("welcome", meta: welcomePage),
    Path<void>("material", kids: [
      Path<void>("button", kids: [
        Path<void>("ElevatedButton", meta: widgetElevatedButtonNote),
      ]),
      Path<void>("text", kids: [
        Path<void>("RichText", meta: widgetTextNote),
      ]),
      Path<void>("slider", meta: widgetSliderNote),
    ]),
    Path<void>("state", kids: [
      Path<void>("1.vanilla_state", meta: vanillaStateNote),
      Path<void>("StatefulBuilder", meta: widgetStatefulBuilderNote),
    ]),
    Path<void>("dev", kids: [
      Path<void>("debug", meta: devDebugNote),
      Path<void>("mirror", meta: devMirrorNote),
    ]),
  ]),
]);

Path _get(path) => root.kid(path)!;

class Paths extends Navigable{
  final Path<void> home = _get("/");
  final Path<void> notFound = _get("/not_found");
  final Path<void> note = _get("/note");
  final Path<void> welcome = _get("/note/welcome");
  final Path<void> mirror = _get("/note/dev/mirror");

  Paths._();

  @override
  Screen parse(String location) {
    Path find = root.kid(location)??notFound;
    return find.createScreen(location);
  }
}

var paths = Paths._();
