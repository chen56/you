import 'package:dart_style/dart_style.dart';
import 'package:note/note_dev_gen.dart';

import 'package:note/env.dart';

main() async {
  Env env = Env();
  NoteGenerator gen =
      NoteGenerator(fmt: DartFormatter(pageWidth: 120), env: env);
  {
    log('gen_note_g_dart start noteHome:${gen.noteHome}  projectDir:${gen.projectHome}');
    var result = await gen.gen_note_g_dart();
    log('gen_note_g_dart: end  notes: ${result.length}');
  }
  {
    log('gen_note_app_g_dart start');
    var result = await gen.gen_note_app_g_dart();
    log('ok file:${result.file} notes: ${result.notes.length}');
  }
}

log(Object? o) {
  // ignore: avoid_print
  print("${DateTime.now()} - $o");
}
