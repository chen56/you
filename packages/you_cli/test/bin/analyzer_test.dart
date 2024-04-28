import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/cli_core.dart';

void main() {
  group("RouteNode", () {
    test('create from directory', () async {
      FileSystem fs=LocalFileSystem();
      YouCli cli = YouCli(projectDir: fs.directory("../../notes/flutter_web/lib"));
      var result  =await cli.analysisLayout(fs.file("../../notes/flutter_web/lib/routes/notes/layout.dart"));

      print("result:${result}");


    });

  });
}
