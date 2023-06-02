import 'package:flutter/material.dart';
import 'package:note/note_conf.dart';
import 'package:note_tools/note_tools.dart';
import 'package:flutter_note/note_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show rootBundle;

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
  // SpaceConf.load
  SpaceConf spaceConf =
      SpaceConf.decode(await rootBundle.loadString('note_space.json'));

  runApp(NoteApp(
    spaceConf: spaceConf,
    sharedPreferences: await SharedPreferences.getInstance(),
  ));
}
