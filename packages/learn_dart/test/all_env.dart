// ignore_for_file: avoid_print

import 'dart:io';
import 'package:note/env.dart';

main() {
  Env env = Env();
  log("Platform.executable", Platform.executable);
  log("Platform.resolvedExecutable", Platform.resolvedExecutable);
  log("Platform.script", Platform.script);
  log("sdkDir", env.sdkDir);
  log("flutterSdkDir", env.flutterSdkDir);
  log("packagePath(package:flutter/src/material/icons.dart)",
      env.flutterPackageAbstractPath("package:flutter/src/material/icons.dart"));
}

void log(String name, Object? value) {
  print("$name ${"-" * (80 - name.length)}: $value");
}
