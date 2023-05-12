import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/context_root.dart';
import 'package:analyzer/file_system/physical_file_system.dart';

import 'package:dart_style/dart_style.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:note/note_dev_gen.dart';
import 'package:path/path.dart' as path;

import 'package:note/env.dart';

main() async {
  log('---------------------main----------------------- ${path.absolute("")}');
  log("Platform.script ${Platform.script}");
  Env env = Env();
  Glob glob = Glob("lib/notes/**note.dart");

  FileSystem writeFS = const LocalFileSystem();

  Glob("lib/notes/**note.dart")
      .listFileSystemSync(writeFS, root: "")
      .forEach((e) {
    var notePath = path.relative(e.path, from: 'lib');
    print("listFileSystemSync $notePath");
  });

  var fmt = DartFormatter(pageWidth: 120);

  final collection = AnalysisContextCollection(
    includedPaths: glob
        .listSync()
        .map((e) => path.normalize(path.absolute(e.path)))
        .toList(),
    sdkPath: env.dartSdkDir,
    resourceProvider: PhysicalResourceProvider.INSTANCE,
  );
  for (final context in collection.contexts) {
    ContextRoot root = context.contextRoot;
    log('---------------------context:  ${root.root.path} ----------------------- ');
    List<NoteLib> noteLibs = List.empty(growable: true);
    for (final filePath in root.analyzedFiles()) {
      noteLibs.add(NoteLib(
          absolutePath: filePath,
          baseAbsolutePath: path.absolute('lib'),
          writeFS: writeFS,
          fmt: fmt));
    }

    // 排序，顺序可以通过为目录名添加数字前缀来强行引导： 1.name, 2.name, 3.name
    noteLibs.sort((a, b) => a.absolutePath.compareTo(b.absolutePath));

    log('genPages Info start');
    for (var note in noteLibs) {
      note.genInfoSync(note.collectInfo());
    }
    log('genPages Info ok');

    log('gen pages.g.dart start');
    // genPages(resolvedLibs.map((e) => e.lib), writeFS: writeFS, fmt: fmt);
    genDeferredPages(noteLibs, writeFS: writeFS, fmt: fmt);
    log('gen pages.g.dart ok');
  }

  // make `flutter run xxx.dart` no error
  // test("stub", () {});
}

log(Object? o) {
  // ignore: avoid_print
  print("${DateTime.now()} - $o");
}
