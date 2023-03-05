import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path/path.dart' as path;

import 'env.dart';

final _dartfmt = DartFormatter(pageWidth: 120);

main() async {
  Env env = Env();
  FileSystem fs = const LocalFileSystem();
  final mateSampleFile = path.normalize(path.absolute("tools/gen_mates_sample.dart"));
  final collection = AnalysisContextCollection(
    includedPaths: [mateSampleFile],
    sdkPath: env.sdkDir,
    resourceProvider: PhysicalResourceProvider.INSTANCE,
  );

  // genMate(buildStep, inputLibrary);
  // 1. collect all we care lib, and remove duplicate
  Set<LibraryElement> collect = Set();
  var sampleLib = (await collection.contexts.first.currentSession.getResolvedLibrary(mateSampleFile)
          as ResolvedLibraryResult)
      .element;
  sampleLib.importedLibraries.forEach((e) {
    _collectLib(collect, e, 0);
  });

  // 2. gen we care lib
  StringBuffer log = StringBuffer();
  collect.forEach((lib) {
    log.writeln("${lib.source}  location:${lib.location}");
    _genLeafLib(fs, lib);
  });
  print(log);
}

_log(Object? o) {
  print("${DateTime.now()} - $o");
}

void _collectLib(Set<LibraryElement> collect, LibraryElement lib, int level) {
  if (_isWeCareLib(lib)) return;
  if (collect.contains(lib)) return;
  _log(lib.source);
  collect.add(lib);
  // sb.writeln("${"--" * level}${lib.source}  location:${lib.location}");
  lib.exportedLibraries.forEach((element) {
    _collectLib(collect, element, level + 1);
  });
}

// filter core package : dart:core , dart:async
bool _isWeCareLib(LibraryElement lib) => !(lib.source.fullName.endsWith(".dart"));

// class SyntaxErrorInAssetException
//   constructor
//     parameterassetId  AssetId   AssetId assetId
//     parameterfilesWithErrors  List<AnalysisResultWithErrors>   List<AnalysisResultWithErrors> filesWithErrors
void _genLeafLib(FileSystem fs, LibraryElement lib) {
  print("libraryElement-identifier:${lib.identifier}  ");
  // dart.core dart.io等sdk内部库暂时不支持

  Library buildLib = Library((b) => b
    ..name = lib.name
    ..body.addAll(lib.exportNamespace.definedNames.values
        .where((element) => element is ClassElement)
        .map((element) => element as ClassElement)
        //ignore: can not inherited class
        .where((clazz) => !lib.typeProvider.isNonSubtypableClass(clazz))
        .map((clazz) => Class((b) => b
          ..name = "${clazz.name}Mate"
          ..abstract = clazz.isAbstract
          ..extend = refer("${clazz.thisType}", _findRefer(clazz.thisType))
          ..constructors.addAll(clazz.constructors
              .where((constructor) => !constructor.isFactory)
              .map((constructor) => Constructor((b) {
                    var optionals = constructor.parameters.where((e) => e.isOptional);
                    var requireds = constructor.parameters.where((e) => e.isRequired);
                    b
                      ..name = constructor.name.isEmpty ? null : constructor.name
                      ..docs.addAll(["/// $constructor"])
                      // A const constructor can't have a body. but we need body.
                      ..constant = false
                      ..factory = constructor.isFactory
                      ..optionalParameters.addAll(optionals.map((param) => Parameter((b) => b
                        ..name = param.name
                        ..type = refer("${param.type}", _findRefer(param.type)))))
                      ..requiredParameters.addAll(requireds.map((param) => Parameter((b) => b
                        ..name = param.name
                        ..type = refer("${param.type}"))))
                      ..body = Code('');
                  })))))));
  var toFile = "lib/generated/${lib.source.uri.path}";
  _log("output: $toFile");
  // buildStep.writeAsString(AssetId("build_ext", path),
  //     _dartfmt.format('${buildLib.accept(DartEmitter())}'));
  fs.directory(path.dirname(toFile)).createSync(recursive: true);
  fs.file(toFile).writeAsStringSync(_dartfmt.format('${buildLib.accept(DartEmitter())}'));
  // buildStep.writeAsString(AssetId("build_ext", toFile), buildLib.accept(DartEmitter()).toString());
}

String _findRefer(DartType type) {
  var source = type.element?.library?.source;
  if (source == null) return "TODO what?";
  String refer = source.uri.toString();
  return refer == "" ? "xx" : refer;
}

Code? _constructorBody(ConstructorElement constructor) {
  if (constructor.isConst || constructor.redirectedConstructor != null) {
    return null;
  }
  return Code("// TODO");
}
