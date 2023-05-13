import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:file/file.dart';
import 'package:file/local.dart';

/// 依赖操作系统，仅在本地dev环境中运行
class Env {
  final FileSystem fs;
  factory Env({FileSystem fs = const LocalFileSystem()}) {
    // assert(kDebugMode, "[Env] only support flutter debug mode");
    return Env._(fs: fs);
  }
  Env._({this.fs = const LocalFileSystem()});

  bool isSdkDir(String maybeSdkDir) {
    return fs.file(path.join(maybeSdkDir, "lib/core/int.dart")).existsSync();
  }

  String get dartSdkDir {
    checkSupport();

    String maybeSdkDir =
        path.dirname(path.dirname(Platform.resolvedExecutable));

    if (isSdkDir(maybeSdkDir)) {
      return maybeSdkDir;
    }
    String flutter = runCommand("which", ["flutter"]);
    maybeSdkDir = path.join(path.dirname(flutter), "cache/dart-sdk");
    if (isSdkDir(maybeSdkDir)) {
      return maybeSdkDir;
    }
    throw Exception("not find dart sdk dir");
  }

  void checkSupport() {
    if (!Platform.isLinux && !Platform.isMacOS) {
      throw Exception(
          "${Platform.operatingSystem} not support , only support Linux or MacOS");
    }
  }

  String get flutterSdkDir {
    checkSupport();

    String flutter = runCommand("which", ["flutter"]);
    return path.dirname(path.dirname(flutter));
  }

  String runCommand(String cmd, List<String> args) {
    checkSupport();

    var result = Process.runSync(cmd, args, runInShell: true);
    if (result.exitCode != 0) {
      throw Exception(
          "cmd[$cmd $args] stdout:${result.stdout} , stderr:${result.stderr}");
    }
    stderr.write(
        "log:cmd[$cmd $args] stdout:${result.stdout}\n stderr:${result.stderr}\n");
    return "${result.stdout}";
  }

  String getFlutterProjectDir() {
    var pwd = Platform.environment["PWD"];
    if (pwd == null) {
      throw Exception("not find PWD in env");
    }
    if (!fs.file(path.join(pwd, "pubspec.yaml")).existsSync()) {
      throw Exception("not find pubspec.yaml in $pwd");
    }
    return pwd;
  }

  bool get isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);

  bool isSupportNoteDevtool() => !kIsWeb && Platform.isMacOS && kDebugMode;
}

const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');
const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
const bool kProfileMode = bool.fromEnvironment('dart.vm.profile');
const bool kDebugMode = !kReleaseMode && !kProfileMode;

main() {
  // ignore: avoid_print
  print(kDebugMode);
}
