// ignore_for_file: avoid_print

import 'dart:io';

import '../tools/env.dart';

main() {
  Env env = Env();
  log("Platform.executable", Platform.executable);
  log("Platform.resolvedExecutable", Platform.resolvedExecutable);
  log("Platform.script", Platform.script);
  log("sdkDir", env.sdkDir);
}

void log(String name, Object? value) {
  print("$name ${"-" * (50 - name.length)}: $value");
}
