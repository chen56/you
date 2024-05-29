import 'package:checks/checks.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/cli_core.dart';
import 'package:_you_dart_internal/analyzer.dart';

void main() {
  FileSystem fs = LocalFileSystem();
  YouCli cli = YouCli(projectDir: fs.directory("../../notes/flutter_web"));
  File notePage = fs.file("../../notes/flutter_web/lib/routes/notes/page.dart");
  group("AnalyzedUnit element", () {
    test('class_', () async {
      var result = await CompilationUnitReader.resolve(cli.analysisSession, "lib/src/cli_core.dart");
      check(result.class_("YouCli")!.displayName).equals("YouCli");
    });
    test('annotation', () async {
      var result = await CompilationUnitReader.resolve(cli.analysisSession, notePage.path);
      var pageMeta = result.annotationOnTopFunction(funcName: "build", annoType: "PageAnnotation")!;
      check(pageMeta.ast.toSource()).equals('@NoteAnnotation(label: "笔记")');
    });
  });
}
