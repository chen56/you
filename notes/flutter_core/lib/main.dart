import 'package:flutter/material.dart';
import 'package:flutter_core/notes.g.dart';
import 'package:note_dart/note.dart';
import 'package:flutter_core/note_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NoteSystem noteSystem = await NoteSystem.load(
    root: BaseNotes.rootroot,
  );
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(NoteApp(noteSystem: noteSystem,sharedPreferences:sharedPreferences));
}
