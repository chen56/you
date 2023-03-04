import 'dart:io';

import 'package:path/path.dart' as path;

String sdkDir() {
  String sdkDir = path.dirname(path.dirname(Platform.resolvedExecutable));
  if (File(path.join(sdkDir, "lib/core/int.dart")).existsSync()) {
    return sdkDir;
  }
  if (!Platform.isLinux && !Platform.isMacOS) {
    throw Exception("${Platform.operatingSystem} not support , only support Linux or MacOS");
  }
  String flutter = runCommand("type", ["-p", "flutter"]);
  sdkDir = path.join(path.dirname(flutter), "cache/dart-sdk");
  if (File(path.join(sdkDir, "lib/core/int.dart")).existsSync()) {
    return sdkDir;
  }
  throw Exception("not find dart sdk dir");
}

String runCommand(String cmd, List<String> args) {
  var result = Process.runSync(cmd, args, runInShell: true);
  if (result.exitCode != 0) {
    throw Exception("cmd[$cmd] error:${result.stderr}");
  }
  stdout.write(result.stdout);
  stderr.write(result.stderr);
  return "${result.stdout}";
}
