import 'dart:io';
import 'dart:isolate';

import 'package:dart_style/dart_style.dart';
import 'package:file/file.dart';
import 'package:flutter/foundation.dart';
import 'package:glob/glob.dart';
import 'package:note/env.dart';
import 'package:note/note_dev_gen.dart';
import 'package:path/path.dart' as path;
import 'package:watcher/watcher.dart';

var _fmt = DartFormatter(pageWidth: 120);

/// note的写作模式工具 ,只工作于桌面版本
class NoteWriteModeTool {
  final Env env;
  final NoteWriteModeService service;

  NoteWriteModeTool({required this.env})
      : service = NoteWriteModeService.start(env: env);

  bool isSupport() => Platform.isMacOS;
}

typedef ServiceArgs = ({
  SendPort sendPort,
  String flutterProjectDir,
});

class NoteWriteModeService {
  late final ReceivePort receivePort;
  final Env env;
  final FileSystem fs;

  NoteWriteModeService.start({required this.env}) : fs = env.fs {
    var watchDir = Env().getFlutterProjectDir();
    var noteBaseDir = path.join(watchDir, 'lib');

    Glob watchGlob = Glob("lib/notes/**note.dart");
    watchGlob
        .listFileSystem(fs, root: watchDir)
        .map((FileSystemEntity e) async {
          debugPrint("NoteWriteModeService.start - gen  ${e.path}");
          return await genNoteInfo(noteBaseDir, e.path, fs);
        })
        .asyncExpand((e) => e.asStream())
        .toList()
        // after all noteLibs gen ok , then watch change
        .then((value) {
          debugPrint(
              "NoteWriteModeService.start - gen ok notes:${value.length}");
          return DirectoryWatcher(watchDir);
        })
        .asStream()
        .asyncExpand((DirectoryWatcher watcher) => watcher.events)
        .where((WatchEvent e) => watchGlob.matches(e.path))
        .listen((WatchEvent e) async {
          debugPrint("NoteWriteModeService.start - event ${e.type} ${e.path}");
          await genNoteInfo(noteBaseDir, e.path, fs);
          List<NoteLib> noteLibs = await watchGlob
              .listFileSystem(fs, root: watchDir)
              .map((e) {
                debugPrint(
                    "NoteWriteModeService.start 2- genDeferredPages  ${e.path}");
                return e;
              })
              .map((e) => NoteLib(
                  baseAbsolutePath: noteBaseDir,
                  absolutePath: e.path,
                  writeFS: fs,
                  fmt: _fmt))
              .toList();
          debugPrint(
              "NoteWriteModeService.start - genDeferredPages start:${noteLibs.length}");
          genDeferredPages(noteLibs, fmt: _fmt, writeFS: fs);
          debugPrint("NoteWriteModeService.start - genDeferredPages end");

          // var pro = await Process.start("ls", []);
          // pro.stdin.writeln("r");
        });
    // stdin.write('r');

    // Stream.value(1).
  }

  static Future<NoteLib> genNoteInfo(
      String noteBaseDir, String noteFile, FileSystem fs) async {
    NoteLib noteLib = NoteLib(
        baseAbsolutePath: noteBaseDir,
        absolutePath: noteFile,
        writeFS: fs,
        fmt: _fmt);
    // async write file
    await noteLib.genInfo(noteLib.collectInfo());
    return noteLib;
  }
}
