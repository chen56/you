import 'package:flutter/material.dart';
import 'package:flutter_note/notes.g.dart';
import 'package:mate/mate_core.dart';
import 'package:mate/mate_note.dart';
import 'package:note/note_page.dart';
import 'package:note/note_shell.dart';
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
        // projectDir: env.getFlutterProjectDir(),
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
        enumRegister: EnumRegister.list([flutter_enums.registerEnum()]),
        // iconRegisters: IconRegisters([flutter_icons.registerIcon()]),
      ))
    ]),
  );

  runApp(NoteApp(noteSystem: noteSystem));
}
