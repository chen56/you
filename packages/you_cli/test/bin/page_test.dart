import 'package:checks/checks.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
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
      var rootPage = RouteDir.fromSync(fs.directory("/note/lib/pages"));
      check(rootPage.toList().map((e) => e.routePath)).deepEquals([
        "/",
        "/notes",
        "/notes/page_1",
        "/notes/page_1/page_1_1",
        "/notes/page_1/page_1_2",
      ]);

      print("111111 ${DartFormatter().format('${genRouteExpression(rootPage).accept(DartEmitter())}')}");
      print("222222 ${genRouteString(rootPage)}");
    });
  });
}
// To result = To("/", builder: layoutRoot(root_page.build), children: [
//   To("machines", builder: layoutRoot(machines_page.build), children: [
//     To("[machine]", builder: layoutRoot(machines_machine_page.build)),
//   ]),
//   To("providers", builder: layoutRoot(providers_page.build)),
//   To("notes", builder: layoutNotes(notes_page.build), children: [
//     To("[machine]", builder: layoutNotes(notes_ai_tools_page.build)),
//   ]),
// ]);

Expression genRouteExpression(RouteDir rootPage) {
  final $To = refer('To', 'package:you_flutter/router.dart');
  return $To.newInstance([
    literalString(rootPage.dir.basename)
  ], {
    "builderAsync": refer(rootPage.flatName).property('build'),
    // "children": literalList(rootPage.children.map((e)=>createRoutes(e))),
    "children": literalList(rootPage.children.map((e) => genRouteExpression(e)).toList()),
  });
}

String genRouteString(RouteDir rootPage) {
  if(rootPage.children.isEmpty){
    return '''To("${rootPage.dir.basename}", builderAsync: ${rootPage.flatName}.build)''';
  }
  return '''To("${rootPage.dir.basename}", builderAsync: ${rootPage.flatName}.build, children:[
${rootPage.children.map((e) => genRouteString(e)).join(",")}
])''';
}
