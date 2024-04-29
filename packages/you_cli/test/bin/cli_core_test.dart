import 'package:checks/checks.dart';
import 'package:code_builder/code_builder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/cli_core.dart';
import 'package:you_cli/src/code_builder_ext.dart';

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
  group("CleanPrefixedAllocator", () {
    test('CleanPrefixedAllocator 1', () async {
      CleanPrefixedAllocator allocator=CleanPrefixedAllocator();
      checkAllocator(Reference ref, String expectedSymbol, List<String> expectedImports){
        check(allocator.allocate(ref)).equals(expectedSymbol);
        allocator.imports.map((e)=>"${e.as},${e.url}");
      }
      checkAllocator(refer("A","package:a/a.dart"),"A",[",package:a/a.dart"]);

      //冲突
      checkAllocator(refer("A","package:b/b.dart"),"_b_b.A",["_b_b,package:b/b.dart"]);

      //再冲突
      checkAllocator(refer("A","package:b/c.dart"),"_b_c.A",["_b_c,package:c/c.dart"]);

      //再冲突
      checkAllocator(refer("A","package:a/b/c.dart"),"_b_c2.A",["_b_c2,package:c/c.dart"]);
    });
  });

  group("analyzer_test", () {
    test('ToType', () async {
      FileSystem fs=LocalFileSystem();
      YouCli cli = YouCli(projectDir: fs.directory("../../notes/flutter_web/lib"));
      var result  =await cli.analysisLayout(fs.file("../../notes/flutter_web/lib/routes/notes/layout.dart"));
      check(result.toType!.type).equals(refer("ToNote","package:you_note_dart/note.dart"));
    });
  });


}
