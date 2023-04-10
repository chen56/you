import 'package:flutter/material.dart';
import 'package:note/log.dart';
import 'package:note_app/note_app.dart';
import 'package:note/navigator_v2.dart';

void main() {
  runApp(const NoteAppWidget());
}

Logger logger = Logger();

class NoteAppWidget extends StatelessWidget {
  const NoteAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Note',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      routerConfig: NavigatorV2.config(
        initial: paths.parse(paths.initial.path),
        navigable: paths,
      ),
    );
  }
}
