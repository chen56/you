import 'package:dart_style/dart_style.dart';
import 'package:note_tools/note_tools.dart';

main() async {
  Env env = Env();
  NotesGenerator gen = NotesGenerator(
      packageBaseName: "flutter_note",
      fmt: DartFormatter(pageWidth: 500),
      fs: env.fs,
      projectDir: env.getFlutterProjectDir());

  await gen.gen();
}

log(Object? o) {
  // ignore: avoid_print
  print("${DateTime.now()} - $o");
}
