import 'dart:io';

import 'package:note_tools/note_tools.dart';
import 'package:note_tools/src/note_dev_gen.dart';

/// note的写作模式工具 ,只工作于桌面版本
class NoteDevTool {
  final Env env;
  final NoteGenerator gen;

  NoteDevTool({required this.env}) : gen = NoteGenerator(env: env);

  bool isSupport() => Platform.isMacOS;
}
