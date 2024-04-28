// ignore_for_file: unnecessary_type_check

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
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
    var resolved = await session.getResolvedLibrary(f) as ResolvedLibraryResult;
    // resolved.element.visitChildren(XXX());
    findAll(resolved.element).toList().forEach((e)=>print("ssss $e"));
  });
}

Iterable<Element> findAll(Element element, {bool Function(Element element)? where}) sync* {
  if (where != null && where(element) == false) {
    return ;
  }
  yield element;
  for(var child in element.children){
    yield* findAll(child,where:where);
  }
}

class XXX extends RecursiveElementVisitor {
  String x = "";

  @override
  // visitElement(Element element) {
  //   print(element);
  //   return super.visitElement(element);
  // }
  visitClassElement(ClassElement element) {
    print(element);
    return super.visitClassElement(element);
  }

  @override
  visitLibraryImportElement(LibraryImportElement element) {
    // element.importedLibrary
    return super.visitLibraryImportElement(element);
  }
}