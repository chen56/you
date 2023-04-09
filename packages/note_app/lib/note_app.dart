// part of "pages.g.dart";
import 'package:note/navigator_v2.dart';
import 'package:note/page_core.dart';
import 'package:note_app/pages.g.dart';
// 试用了dart 3 record，没有自省功能，无法替换掉下面的强类型字段树，已提交需求：
// <https://github.com/dart-lang/language/issues/2826>
// DART 3 Records Feature Requirement: Can it provide introspection capabilities similar to enum.values #2826
// 需求被拒绝，自省会影响到dart的性能策略,只能另想办法, 比如自动生成

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

class Paths with Navigable, PathsMixin {
  late final Path<void> initial;
  Paths._() {
    initial = note_note_self_notebook;
  }

  @override
  Screen parse(String location) {
    Path find = _root.kid(location)!; // ?? notFound;
    return find.createScreen(location);
  }
}

var paths = Paths._();

Path<void> _root = Path.root();
put<C>(String path, PageMeta<C>? meta) {
  return _root.put(path, meta);
}
