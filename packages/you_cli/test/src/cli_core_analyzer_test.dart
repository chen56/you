import 'package:checks/checks.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/cli_core.dart';

void main() {
  FileSystem fs = LocalFileSystem();
  YouCli cli = YouCli(projectDir: fs.directory("../../notes/flutter_web"));

  group("analyzer_test", () {
    test('ToType', () async {
      var result = await cli.analyzeLayout(fs.file("../../notes/flutter_web/lib/routes/notes/layout.dart"));
      check(result!.displayName).equals("build");
    });
    test('page anno', () async {
      var pageMeta = await cli.analyzePageAnno(cli.dir_lib.childFile("routes/notes/page.dart"));
      check(pageMeta!.label).equals("笔记");
      check(pageMeta.publish).equals(false);
      check(pageMeta.toType).equals(YouCli.toNoteType);
      check(pageMeta.toSource).equals('@PageAnnotation(label: "笔记", toType: ToNote)');
    });
  });
}
