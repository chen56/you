import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/src/test_utilities/mock_sdk.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/memory_file_system.dart';
import 'package:test/scaffolding.dart';

main() {
  group("description", () {
    test("test", () async {
      late final resourceProvider = MemoryResourceProvider();
      String convertPath(String filePath) => resourceProvider.convertPath(filePath);
      Folder newFolder(String path) {
        String convertedPath = convertPath(path);
        return resourceProvider.getFolder(convertedPath)..create();
      }

      File newFile(String path, String content) {
        String convertedPath = convertPath(path);
        return resourceProvider.getFile(convertedPath)..writeAsStringSync(content);
      }
      // ignore: unused_local_variable
      List<MockSdkLibrary> additionalMockSdkLibraries = [
        MockSdkLibrary('note', [
          MockSdkLibraryUnit('note/note.dart', r'''
library note;
class Logger{
  void log(String x){
    print("log: $x");
  }
}
''')
        ]),
      ];

      createMockSdk(
        resourceProvider: resourceProvider,
        root: newFolder('/sdk'),
        // additionalLibraries: additionalMockSdkLibraries,
      );
      newFile("/packages/note/lib/x.dart", r"""
var i="i";
""");
      newFile("/packages/note/lib/note.dart", r"""
class Logger{
  void log(String x){

  }
}
""");
      newFile("/packages/note/lib/app.dart", r"""
import "package:note/note.dart"
void build(Logger logger){
  logger.log("hello");
}
""");
      newFile("/packages/note/pubspec.yaml", r"""
name: note
description: A Flutter note project.
version: 1.0.0
homepage: https://github.com/chen56/note

environment:
  sdk: '>=3.3.0 <4.0.0'
      """);
      final collection = AnalysisContextCollection(
        includedPaths: ["/packages/note/lib/x.dart"],
        resourceProvider: resourceProvider,
        sdkPath: "/sdk",
      );
      //,"/packages/note/lib/app.dart","/packages/note/lib/note.dart"
      var x = await getResolvedUnit(collection, "/packages/note/lib/note.dart");
      var app = await getResolvedUnit(collection, "/packages/note/lib/app.dart");
      (x as ResolvedUnitResult).unit.visitChildren(XX());
      (app as ResolvedUnitResult).unit.visitChildren(XX());

      // // 10000次8秒，可以了。
      // for (var i = 0; i < 100; i++) {
      //   await getResolvedUnit(collection, "/app/lib/app.dart");
      // }
      // // 全新重建 100次5秒，可以了。
      // for (var i = 0; i < 100; i++) {
      //   final collection = AnalysisContextCollection(
      //     includedPaths: ["/app/lib/log.dart"],
      //     resourceProvider: resourceProvider,
      //     sdkPath: "/sdk",
      //   );
      //   await getResolvedUnit(collection, "/app/lib/app.dart");
      // }
    });
  });
}

Future<ResolvedLibraryResult> getResolvedLibrary(AnalysisContextCollection collection, String file) async {
  return collection.contexts[0].currentSession.getResolvedLibrary(file) as ResolvedLibraryResult;
}

SomeParsedUnitResult getParsedUnit(AnalysisContextCollection collection, String file) {
  return collection.contexts[0].currentSession.getParsedUnit(file);
}

Future<SomeResolvedUnitResult> getResolvedUnit(AnalysisContextCollection collection, String file) {
  return collection.contexts[0].currentSession.getResolvedUnit(file);
}

Future<void> printAllImportedLibraries(AnalysisContextCollection collection) async {
  for (final context in collection.contexts) {
    print('---------------------context:  ${context.contextRoot.root.path} ----------------------- ');
    for (final filePath in context.contextRoot.analyzedFiles()) {
      if (!filePath.endsWith('.dart')) {
        continue;
      }
      print("========== file: $filePath ============");
      var result = await context.currentSession.getResolvedLibrary(filePath) as ResolvedLibraryResult;
      var lib = result.element;
      for (var importLib in lib.importedLibraries) {
        for (var c in importLib.exportNamespace.definedNames.values) {
          if (c is! ClassElement) {
            continue;
          }
          if (c.name.startsWith("_")) {
            continue;
          }
          print("  class: $c");
          for (var co in c.constructors) {
            print("    constructor: ${co.displayName} isGenerative:${co.isGenerative} isDefaultConstructor:${co.isDefaultConstructor} isConst:${co.isConst} ");
            for (ParameterElement p in co.parameters) {
              print("      parameter: $p , type:${p.type}  ,defaultValueCode:${p.defaultValueCode} , typeParameters:${p.typeParameters} ,  runtimeType:${p.runtimeType}, isSuperFormal:${p.isSuperFormal}, hasImplicitType:${p.hasImplicitType}  children:${p.children}   getDisplayString:${p.getDisplayString(withNullability: true, multiline: false)} , ");
            }
          }
        }
      }
    }
  }
}

class XX extends GeneralizingAstVisitor {
  @override
  visitMethodInvocation(MethodInvocation node) {
    print("visitMethodInvocation---: $node  : ${node.staticType}");
    return super.visitMethodInvocation(node);
  }
  @override
  visitNode(AstNode node) {
    print("node---${node.runtimeType}: $node  :}");
    return super.visitNode(node);
  }
}
