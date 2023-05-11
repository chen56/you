import 'dart:io';
import 'dart:isolate';

import 'package:note/env.dart';
import 'package:file/file.dart';

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
    fs.directory(watchDir).watch(recursive: true).listen((event) {
      print("ssss2 $event");
    });
    // Stream.value(1).
  }
}
