import 'package:checks/checks.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/cli_core.dart';
import 'package:you_cli/src/analyzer.dart';

void main() {
  FileSystem fs = LocalFileSystem();
  YouCli cli = YouCli(projectDir: fs.directory("../../notes/flutter_web"));
  File notePage = fs.file("../../notes/flutter_web/lib/routes/notes/page.dart");
  group("AnalyzedUnit element", () {
    test('class_', () async {
      var result = await UnitAnalyzer.resolve(cli.analysisSession, fs.file("lib/src/cli_core.dart"));
      check(result.class_("YouCli")!.displayName).equals("YouCli");
    });
    test('annotation', () async {
      var result = await UnitAnalyzer.resolve(cli.analysisSession, notePage);
      var pageMeta = result.annotationOnTopFunction(funcName: "build", annoType: "PageAnnotation")!;
      check(pageMeta.ast.toSource()).equals('@NoteAnnotation(label: "笔记")');
    });
  });
}
