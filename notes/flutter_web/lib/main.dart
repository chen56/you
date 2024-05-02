import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_web/app.dart';
import 'package:you_flutter/note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    sharedPreferences: await SharedPreferences.getInstance(),
    noteSystem: NoteSystem(root: router.root),
  ));
}
