import 'package:checks/checks.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/page.dart';


void main() {
  group("PageNode", () {
    test('create from directory', () {
      late MemoryFileSystem fs = MemoryFileSystem();
      fs.directory("/note/lib/pages/notes/page_1").create(recursive: true);
      fs.directory("/note/lib/pages/notes/page_1/page_1_1").create(recursive: true);
      fs.directory("/note/lib/pages/notes/page_1/page_1_2").create(recursive: true);
      var rootPage = PageNode.fromSync(fs.directory("/note/lib/pages"));
      check(rootPage.toList().map((e) => e.routePath)).deepEquals([
        "/",
        "/notes",
        "/notes/page_1",
        "/notes/page_1/page_1_1",
        "/notes/page_1/page_1_2",
      ]);
    });
  });
}
