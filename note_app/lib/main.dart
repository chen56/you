import 'package:flutter/material.dart';
import 'package:note/env.dart';
import 'package:note_tools/note_dev.dart';
import 'package:note_app/note_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // ignore: prefer_const_constructors
  Env env = Env();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  NoteDevTool? noteDevTool;
  if (env.isSupportNoteDevtool()) {
    noteDevTool = NoteDevTool(env: env);
    await noteDevTool.gen.gen_note_g_dart();
    await noteDevTool.gen.gen_note_app_g_dart();
    noteDevTool.gen.watch().listen((event) {
      debugPrint("watch: $event");
    });
  }

  runApp(NoteApp(
    sharedPreferences: sharedPreferences,
    noteDevTool: noteDevTool,
  ));
}
