import 'package:flutter/material.dart';
import 'package:flutter_note/notes.g.dart';
import 'package:mate/mate_core.dart';
import 'package:mate/mate_note.dart';
import 'package:note/note.dart';
import 'package:note_tools/note_tools.dart';
import 'package:flutter_note/note_app.dart';
import 'package:path/path.dart' as path;
import 'package:mate_flutter/mate_enums.g.dart' as flutter_enums;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Env env = Env();
  if (env.isSupportNoteDevtool()) {
    NoteSpace noteTool = NoteSpace(
        packageBaseName: "flutter_note",
        projectDir: "./",
        env: env,
        spaceDir: path.absolute("./"));
    await noteTool.gen.gen();
    noteTool.gen.watch().listen((event) {
      debugPrint("flutter_note.main watch: $event");
    });
  }

  NoteSystem noteSystem = await NoteSystem.load(
    root: BaseNotes.rootroot,
    contentExtensions: NoteContentExts.ext([
      MateContentExt(
          editors: Editors(
        //todo 这样会和iconRegister一样加载很多用不上的lib,如何处理？
        enumRegister: EnumRegister.list([flutter_enums.registerEnum()]),
      ))
    ]),
  );

  runApp(NoteApp(noteSystem: noteSystem));
}
