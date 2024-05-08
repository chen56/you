// ignore_for_file: unnecessary_type_check

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

void main() {
  test('analyzer', () async {
    String f = "test/dart_lang!sdk!pkg!analyzer/element_test.dart";
    f = path.absolute(f);
    var session = AnalysisContextCollection(
      includedPaths: [f],
      resourceProvider: PhysicalResourceProvider(),
    ).contexts[0].currentSession;
    var result =await session.getResolvedUnit(f) as ResolvedUnitResult;
    var findAnnotations=forAst<Annotation>(result.unit).toList();
    print(findAnnotations.map((e)=>"${e.runtimeType} $e \n").join("\n"));
  });
}

Iterable<FIND> forAst<FIND>(AstNode node)sync* {
  // print("ast ${node.runtimeType}: $FIND");

  if(node is FIND) yield node as FIND;
  for (var i in node.childEntities) {
    if (i is! AstNode) continue;
    yield* forAst(i);
  }
}
