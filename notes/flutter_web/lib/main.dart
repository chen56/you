import 'package:flutter/material.dart';
import 'package:flutter_web/pages.g.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_note_dart/note.dart';
import 'package:flutter_web/note_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NoteSystem noteSystem = await NoteSystem.load(
    root: BaseNotes.rootroot,
  );
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(_AppRootWidget(title: "ssss",));
}

class _AppRootWidget extends StatefulWidget {

  const _AppRootWidget({required this.title});

  final String title;

  @override
  State<_AppRootWidget> createState() => _AppRootWidgetState();

}

class _AppRootWidgetState extends State<_AppRootWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: widget.title,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent.shade700, brightness: Brightness.light),
          useMaterial3: true),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorSeed.m3baseline.color, brightness: Brightness.dark),
          useMaterial3: true),
      routerConfig: router.toRouterConfig(),
    );
  }
}
