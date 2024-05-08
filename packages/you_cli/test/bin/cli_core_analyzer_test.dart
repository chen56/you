import 'package:checks/checks.dart';
import 'package:code_builder/code_builder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/cli_core.dart';

void main() {
  FileSystem fs = LocalFileSystem();
  YouCli cli = YouCli(projectDir: fs.directory("../../notes/flutter_web"));
  File notePage = fs.file("../../notes/flutter_web/lib/routes/notes/page.dart");

  group("analyzer_test", () {
    test('ToType', () async {
      var result = await cli.analyzeLayout(fs.file("../../notes/flutter_web/lib/routes/notes/layout.dart"));
      check(result.toType).equals(refer("ToNote", "package:you_flutter/note.dart"));
    });
    test('page anno', () async {
      var pageMeta=await cli.analyzePageAnno(cli.dir_lib.childFile("routes/notes/page.dart"));
      check(pageMeta!.label).equals("笔记");
      check(pageMeta.publish).equals(false);
      check(pageMeta.toType).equals(YouCli.toNoteType);
      check(pageMeta.toSource).equals('@PageMeta(label: "笔记", toType: ToNote)');
    });
  });
  group("AnalyzedUnit element", () {
    test('class_', () async {
      var result = await cli.getResolvedUnit(fs.file("lib/src/cli_core.dart"));
      check(result.class_("YouCli")!.displayName).equals("YouCli");
    });
    test('annotation', () async {
      var result = await cli.getResolvedUnit(notePage);
      var pageMeta=result.annotationOnTopFunction(funcName: "build", annoType: "PageMeta")!;
      check(pageMeta.ast.toSource()).equals('@PageMeta(label: "笔记", toType: ToNote)');
    });
  });
}
