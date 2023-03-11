import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/physical_file_system.dart';

main() async {
  ResourceProvider resourceProvider = PhysicalResourceProvider.INSTANCE;
  final collection = AnalysisContextCollection(
    includedPaths: [
      "/Users/cccc/app/flutter/packages/flutter_test/lib",
      "/Users/cccc/app/flutter/packages/flutter/lib",
      "/Users/cccc/app/flutter/packages/flutter/lib/src/foundation",
      "/Users/cccc/app/flutter/bin/cache/pkg/sky_engine/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/vector_math-2.1.4/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/test_api-0.4.16/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/term_glyph-1.2.1/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/string_scanner-1.2.0/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/stream_channel-2.1.1/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/stack_trace-1.11.0/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/source_span-1.9.1/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/path-1.8.2/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/meta-1.8.0/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/material_color_utilities-0.2.0/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/matcher-0.12.13/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/lints-2.0.1/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/js-0.6.5/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/flutter_lints-2.0.1/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/fake_async-1.3.1/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/cupertino_icons-1.0.5/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/collection-1.17.0/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/clock-1.1.1/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/characters-1.2.1/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/boolean_selector-2.1.1/lib",
      "/Users/cccc/.pub-cache/hosted/pub.flutter-io.cn/async-2.10.0/lib",
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
      CompilationUnitElement fileElement =
          (await context.currentSession.getUnitElement(filePath) as UnitElementResult).element;
      for (var c in fileElement.classes) {
        if (c.name.startsWith("_")) {
          continue;
        }
        print("  class: $c");
        for (var co in c.constructors) {
          print(
              "    constructor: ${co.name} isGenerative:${co.isGenerative} isDefaultConstructor:${co.isDefaultConstructor} isConst:${co.isConst} ");
          for (ParameterElement p in co.parameters) {
            print(
                "      parameter: ${p} , type:${p.type}  ,defaultValueCode:${p.defaultValueCode} , typeParameters:${p.typeParameters} ,  runtimeType:${p.runtimeType}, isSuperFormal:${p.isSuperFormal}, hasImplicitType:${p.hasImplicitType}  children:${p.children}   getDisplayString:${p.getDisplayString(withNullability: true, multiline: false)} , ");
          }
        }
      }
    }
  }
}
