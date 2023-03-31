import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note/env.dart';
import "package:path/path.dart" as path;

void main() {
  group('A group of tests', () {
    var entryFile = path.normalize(path.absolute("tools/gen_mates_sample.dart"));

    Env env = Env();
    AnalysisContextCollection collection;
    ResourceProvider fs = PhysicalResourceProvider.INSTANCE;
    late LibraryElement entryLib;

    setUpAll(() async {
      collection = AnalysisContextCollection(
        includedPaths: [entryFile],
        sdkPath: env.sdkDir,
        resourceProvider: fs,
      );
      entryLib = (await collection.contexts.first.currentSession.getResolvedLibrary(entryFile)
              as ResolvedLibraryResult)
          .element;
    });

    test('First Test', () {
      print(entryLib);
    });
  });
}
