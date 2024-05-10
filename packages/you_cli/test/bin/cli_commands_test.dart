import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  late MemoryFileSystem fs;
  // late YouCli cli;

  setUp(() {
    fs = MemoryFileSystem();
    // cli = YouCli(projectDir: fs.directory("/app"));

    // YouCli需要
    fs.file("/app/pubspec.yaml")
      ..createSync(recursive: true)
      ..writeAsString("""name: app""");
  });
  group("Cmd_gen_routes_g_dart", () {});
}
