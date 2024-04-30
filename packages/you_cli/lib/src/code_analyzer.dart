import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:path/path.dart' as path_;

class CodeAnalyzer {
  final _resourceProvider = PhysicalResourceProvider();
  late final AnalysisSession session;

  CodeAnalyzer() {
      var collection = AnalysisContextCollection(
      includedPaths: [""],
      resourceProvider: _resourceProvider,
    );
    session = collection.contexts[0].currentSession;
  }

  Future<ResolvedLibraryResult> getResolvedLibrary({required String path, required String content}) async {
    return session.getResolvedLibrary(path) as ResolvedLibraryResult;
  }

  SomeParsedUnitResult getParsedUnit({required String path, required String content}) {
    return session.getParsedUnit(path_.absolute(path));
  }

  Future<SomeResolvedUnitResult> getResolvedUnit({required String path, required String content}) {
    return session.getResolvedUnit(path_.absolute(path));
  }

}
