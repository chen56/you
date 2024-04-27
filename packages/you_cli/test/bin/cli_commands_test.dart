import 'package:checks/checks.dart';
import 'package:code_builder/code_builder.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';
import 'package:you_cli/src/cli_core.dart';

import '../../bin/cli.dart';

void main() {
  late MemoryFileSystem fs;
  late YouCli cli;

  setUp(() {
    fs = MemoryFileSystem();
    cli = YouCli(projectDir: fs.directory("/app"));

    // YouCli需要
    fs.file("/app/pubspec.yaml")
      ..createSync(recursive: true)
      ..writeAsString("""name: app""");
  });
  group("Cmd_gen_routes_g_dart", () {
    void checkBuilder(String? expected, {required bool async}) {
      Cmd_gen_routes_g_dart cmd = Cmd_gen_routes_g_dart.libMode(fs: fs, async: async, dir: fs.directory("/app/lib/routes"));
      var result = cmd.builderExpression(cli.rootRoute);
      if (expected == null) {
        check(result).isNull();
      } else {
        check(cmd.builderExpression(cli.rootRoute)!.accept(DartEmitter()).toString().split("\n").join()).equals(expected);
      }
    }

    test('builderExpression:  no page + no layout', () {
      checkBuilder(async: false, null);
      checkBuilder(async: true, null);
    });

    test('builderExpression:  page + no layout', () {
      fs.file("/app/lib/routes/page.dart").createSync(recursive: true);

      checkBuilder(async: false, "root_.build");
      checkBuilder(async: true, "() async  {  await root_.loadLibrary();return  root_.build; } ");
    });

    test('builderExpression: page + layout', () {
      fs.file("/app/lib/routes/page.dart").createSync(recursive: true);
      fs.file("/app/lib/routes/layout.dart").createSync(recursive: true);

      checkBuilder(async: false, "root__.layout(root_.build)");
      checkBuilder(async: true, "() async  {  await root_.loadLibrary(); await root__.loadLibrary();return  root__.layout(root_.build); } ");
    });
  });
}

Expression genRouteExpression(RouteNode rootPage) {
  final $To = refer('To', 'package:you_flutter/router.dart');
  return $To.newInstance([
    literalString(rootPage.dir.basename)
  ], {
    "builderAsync": refer(rootPage.flatName).property('build'),
    // "children": literalList(rootPage.children.map((e)=>createRoutes(e))),
    "children": literalList(rootPage.children.map((e) => genRouteExpression(e)).toList()),
  });
}

String genRouteString(RouteNode rootPage) {
  if (rootPage.children.isEmpty) {
    return '''To("${rootPage.dir.basename}", builderAsync: ${rootPage.flatName}.build)''';
  }
  return '''To("${rootPage.dir.basename}", builderAsync: ${rootPage.flatName}.build, children:[
${rootPage.children.map((e) => genRouteString(e)).join(",")}
])''';
}
