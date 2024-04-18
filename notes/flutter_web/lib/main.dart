import 'package:flutter/material.dart';
import 'package:flutter_web/notes.g.dart';
import 'package:you_note_dart/note.dart';
import 'package:flutter_web/note_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NoteSystem noteSystem = await NoteSystem.load(
    root: BaseNotes.rootroot,
  );
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(NoteApp(noteSystem: noteSystem,sharedPreferences:sharedPreferences));
}
