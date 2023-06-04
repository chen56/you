import 'package:note/note_conf.dart';
import 'package:note/note_shell.dart';
import 'package:note/src/note_core.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

class NoteSystem {
  final NoteContentExts contentExtensions;
  late final Layout layout;
  final Note root;
  final SpaceConf spaceConf;
  final SharedPreferences sharedPreferences;
  NoteSystem({
    required this.contentExtensions,
    required this.root,
    required this.spaceConf,
    required this.sharedPreferences,
  }) {
    layout = (note) => LayoutScreen(
          noteSystem: this,
          current: note,
          tree: root,
        );
  }

  static Future<NoteSystem> load({
    required Note<void> root,
    required NoteContentExts contentExtensions,
  }) async {
    return NoteSystem(
      root: root,
      spaceConf:
          SpaceConf.decodeJson(await rootBundle.loadString('note_space.json')),
      contentExtensions: contentExtensions,
      sharedPreferences: await SharedPreferences.getInstance(),
    );
  }
}
