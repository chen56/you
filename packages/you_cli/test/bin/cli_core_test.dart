import 'package:checks/checks.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/cli_core.dart';

void main() {
  group("RouteNode", () {
    test('create from directory', () async {
      late MemoryFileSystem fs = MemoryFileSystem();
      fs.directory("/note/lib/routes/notes/page_1").createSync(recursive: true);
      fs.directory("/note/lib/routes/notes/page_1/page_1_1").createSync(recursive: true);
      fs.directory("/note/lib/routes/notes/page_1/page_1_2").createSync(recursive: true);

      YouCli cli = YouCli(projectDir: fs.directory("/note"));
      var rootRoute = await cli.rootRoute;
      check(rootRoute.toList().map((e) => e.routePath)).deepEquals([
        "/",
        "/notes",
        "/notes/page_1",
        "/notes/page_1/page_1_1",
        "/notes/page_1/page_1_2",
      ]);
    });
  });

}
