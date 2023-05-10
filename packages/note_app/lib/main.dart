import 'package:flutter/material.dart';
import 'package:note/note_dev_tool.dart';
import 'package:note_app/note_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // ignore: prefer_const_constructors
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(NoteApp(
    notes: Notes(sharedPreferences: sharedPreferences),
    sharedPreferences: sharedPreferences,
    noteDevTool: NoteDevTool(),
  ));
}
