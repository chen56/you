import 'package:dart_style/dart_style.dart';
import 'package:note_tools/note_tools.dart';

main() async {
  Env env = Env();
  NoteGenerator gen = NoteGenerator(
      packageBaseName: "flutter_note",
      fmt: DartFormatter(pageWidth: 120),
      fs: env.fs,
      projectDir: env.getFlutterProjectDir());
  {
    log('gen_note_g_dart start noteHome:${gen.noteRootDir}  projectDir:${gen.projectDir}');
    var result = await gen.gen_note_g_dart();
    log('gen_note_g_dart: end  notes: ${result.length}');
  }
  {
    log('gen_flutter_note_g_dart start');
    var result = await gen.gen_notes_g_dart();
    log('ok file:${result.file} notes: ${result.notes.length}');
  }
}

log(Object? o) {
  // ignore: avoid_print
  print("${DateTime.now()} - $o");
}
