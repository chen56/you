import 'package:flutter_note/navigator_v2.dart';
import 'package:flutter_note/page.dart';
import 'package:flutter_note/pages/@page.dart';

import 'not_found/@page.dart';
import 'note/1.welcome/1.note-self/@page.dart';
import 'note/1.welcome/@page.dart';
import 'note/@page.dart';

// 试用了dart 3 record，没有自省功能，无法替换掉下面的强类型字段树，已提交需求：
// <https://github.com/dart-lang/language/issues/2826>
// DART 3 Records Feature Requirement: Can it provide introspection capabilities similar to enum.values #2826
// 需求被拒绝，貌似这种自省需求会影响到dart的性能策略,只能另想办法, 比如自动生成

// Path<void> root = Path<void>("/", meta: rootPage, kids: [
//   Path<void>("not_found", meta: notFoundPage),
//   Path<void>("note", meta: notePage, kids: [
//     Path<void>("welcome", meta: welcome, kids: [
//       Path<void>("note-self", meta: page),
//     ]),
//     Path<void>("layout", meta: layoutNote),
//     Path<void>("material", kids: [
//       Path<void>("button", kids: [
//         Path<void>("ElevatedButton", meta: widgetElevatedButtonNote),
//       ]),
//       Path<void>("text", kids: [
//         Path<void>("RichText", meta: widgetTextNote),
//       ]),
//       Path<void>("slider", meta: widgetSliderNote),
//     ]),
//     Path<void>("state", kids: [
//       Path<void>("1.vanilla_state", meta: vanillaStateNote),
//       Path<void>("StatefulBuilder", meta: widgetStatefulBuilderNote),
//     ]),
//     Path<void>("dev", kids: [
//       Path<void>("debug", meta: devDebugNote),
//       Path<void>("mirror", meta: devMirrorNote),
//     ]),
//   ]),
// ]);

class Paths extends Navigable {
  late final Path<void> initial;
  final Path<void> noteSelf = _get("/note/welcome/note-self");

  final Path<void> home = _get("/");

  final Path<void> notFound = _get("/not_found");
  final Path<void> note = _get("/note");
  // final Path<void> welcome = _get("/note/welcome");
  // final Path<void> mirror = _get("/note/dev/mirror");
  // final Path<void> layout = _get("/note/layout");

  Paths._() {
    initial = noteSelf;
  }

  @override
  Screen parse(String location) {
    Path find = root.kid(location) ?? notFound;
    return find.createScreen(location);
  }

  static Path _get(path) => root.kid(path)!;
}

Path<void> root = Path<void>("/", meta: rootPage);
Paths _init() {
  root.add("not_found", notFoundPage);
  root.add("note", notePage);
  root.add("note/welcome", welcomePage);
  root.add("note/welcome/note-self", page);
  root.toList(includeThis: true).forEach((element) {
    print("---- init page ${element}");
  });
  return Paths._();
}

var paths = _init();
