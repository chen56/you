// ignore_for_file: avoid_print

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:path/path.dart' as path;

main() async {
  ResourceProvider resourceProvider = PhysicalResourceProvider.INSTANCE;
  final collection = AnalysisContextCollection(
    includedPaths: [
      path.normalize(path.absolute(path.join(path.current, "lib/note.dart")))
    ],
    sdkPath: "/Users/cccc/app/flutter/bin/cache/dart-sdk",
    resourceProvider: resourceProvider,
  );
  for (final context in collection.contexts) {
    print(
        '---------------------context:  ${context.contextRoot.root.path} ----------------------- ');
    for (final filePath in context.contextRoot.analyzedFiles()) {
      if (!filePath.endsWith('.dart')) {
        continue;
      }
      print("========== file: $filePath ============");
      var result = await context.currentSession.getResolvedLibrary(filePath)
          as ResolvedLibraryResult;
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
            print(
                "    constructor: ${co.displayName} isGenerative:${co.isGenerative} isDefaultConstructor:${co.isDefaultConstructor} isConst:${co.isConst} ");
            for (ParameterElement p in co.parameters) {
              print(
                  "      parameter: $p , type:${p.type}  ,defaultValueCode:${p.defaultValueCode} , typeParameters:${p.typeParameters} ,  runtimeType:${p.runtimeType}, isSuperFormal:${p.isSuperFormal}, hasImplicitType:${p.hasImplicitType}  children:${p.children}   getDisplayString:${p.getDisplayString(withNullability: true, multiline: false)} , ");
            }
          }
        }
      }
    }
  }
}
