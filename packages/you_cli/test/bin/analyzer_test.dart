import 'package:checks/checks.dart';
import 'package:code_builder/code_builder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/cli_core.dart';

void main() {
  group("RouteNode", () {
    test('ToType', () async {
      FileSystem fs=LocalFileSystem();
      YouCli cli = YouCli(projectDir: fs.directory("../../notes/flutter_web/lib"));
      var result  =await cli.analysisLayout(fs.file("../../notes/flutter_web/lib/routes/notes/layout.dart"));
      check(result.toType!.type).equals(refer("ToNote","package:you_note_dart/note.dart"));
    });
  });
}
