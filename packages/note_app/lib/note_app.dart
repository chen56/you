// part of "pages.g.dart";
import 'package:flutter/material.dart';
import 'package:note/log.dart';
import 'package:mate/mate_core.dart';
import 'package:mate/mate_note.dart';
import 'package:note/navigator_v2.dart';
import 'package:note/note.dart';
import 'package:note/note_layout.dart';
import 'package:mate_flutter/mate_enums.g.dart' as flutter_enums;
import 'package:note_app/note_app.deferred.g.dart';
import 'package:note/note_dev.dart';
import 'package:shared_preferences/shared_preferences.dart';
// [   +4 ms] Font asset "MaterialIcons-Regular.otf" was tree-shaken,
// reducing it from 1645184 to 10272 bytes (99.4% reduction).
// Tree-shaking can be disabled by providing the --no-tree-shake-icons flag
// import 'package:mate_flutter/mate_icons.g.dart' as flutter_icons;

// 试用了dart 3 record，没有自省功能，无法替换掉下面的强类型字段树，已提交需求：
// <https://github.com/dart-lang/language/issues/2826>
// DART 3 Records Feature Requirement: Can it provide introspection capabilities similar to enum.values #2826
// 需求被拒绝，自省会影响到dart的性能策略,只能另想办法, 目前使用代码生成 [tools/note_dev_gen.dart]

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
Logger logger = Logger();

@immutable
class Notes extends BaseNotes with Navigable {
  final SharedPreferences sharedPreferences;

  Notes({required this.sharedPreferences});

  @override
  Screen get initial =>
      switchTo(sharedPreferences.getString("note_app.notes.location") ??
          notes_welcome.path);

  @override
  Screen switchTo(String location) {
    assert(BaseNotes.rootroot.contains(location),
        "location not found: $location ${BaseNotes.rootroot.toList()}");
    Note find = BaseNotes.rootroot.child(location)!; // ?? notFound;
    sharedPreferences.setString("note_app.notes.location", location);
    // sync mode
    // return find.createScreen(location);
    // async mode
    return DeferredScreen(note: find);
  }
}

class DeferredScreen extends StatelessWidget with Screen {
  final Note note;
  DeferredScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    var needLoad =
        note.meAndAncestors.where((e) => e.deferredConf != null).toList();
    return FutureBuilder(
      future: Future.wait(needLoad.map((e) => e.deferredConf!())),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(
                'note load error(${note.path}): ${snapshot.error} \n${snapshot.stackTrace}');
          }

          for (int i = 0; i < needLoad.length; i++) {
            needLoad[i].confPart = snapshot.data![i];
          }
          return note.layout(note);
        }
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  String get location => note.path;
}

@immutable
class Layouts {
  static Editors editors = Editors(
    enumRegister: EnumRegister.list([flutter_enums.registerEnum()]),
    // iconRegisters: IconRegisters([flutter_icons.registerIcon()]),
  );
  static NoteSystem get noteSystem => NoteSystem(
        contentExtensions:
            NoteContentExtensions.ext([MateContentExt(editors: editors)]),
      );

  static Layout defaultLayout<T>({
    bool defaultCodeExpand = true,
  }) {
    return (note) => LayoutScreen<T>(
          noteSystem: noteSystem,
          current: note as Note<T>,
          tree: BaseNotes.rootroot,
          defaultCodeExpand: defaultCodeExpand,
        );
  }
}

class NoteApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final NoteDevTool? noteDevTool;

  // ignore: prefer_const_constructors_in_immutables
  NoteApp(
      {super.key, required this.noteDevTool, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    // BaseNotes.rootroot这个设计临时的，可以改善
    BaseNotes.rootroot.extendTree(true);
    Notes notes = Notes(sharedPreferences: sharedPreferences);

    notes.notes_zdraft.extendTree(false);

    var routerApp = MaterialApp.router(
      title: 'Flutter Note',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      routerConfig: NavigatorV2.config(
        navigable: notes,
      ),
    );
    return routerApp;
  }
}
