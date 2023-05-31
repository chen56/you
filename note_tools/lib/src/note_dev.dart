import 'dart:io';

import 'package:note_tools/note_tools.dart';
import 'package:note_tools/src/note_dev_gen.dart';

/// note的写作模式工具 ,只工作于桌面版本
class NoteSpace {
  final Env env;
  final NoteGenerator gen;
  final String spaceDir;
  final String projectDir;
  final String packageBaseName;
  NoteSpace({
    required this.projectDir,
    required this.packageBaseName,
    required this.env,
    required this.spaceDir,
  }) : gen = NoteGenerator(
          projectDir: projectDir,
          packageBaseName: packageBaseName,
          fs: env.fs,
        ) {}

  bool isSupport() => Platform.isMacOS;
}
