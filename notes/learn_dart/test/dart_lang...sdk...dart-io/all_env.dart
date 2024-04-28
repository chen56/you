// ignore_for_file: avoid_print

import 'dart:io';


main() {
  log("Platform.executable", Platform.executable);
  log("Platform.resolvedExecutable", Platform.resolvedExecutable);
  log("Platform.script", Platform.script);
  // log("sdkDir", env.dartSdkDir);
  // log("flutterSdkDir", env.flutterSdkDir);
  // log("packagePath(package:flutter/src/material/icons.dart)",
  //     packageToAbstractPath("package:flutter/src/material/icons.dart"));
}

void log(String name, Object? value) {
  print("$name ${"-" * (80 - name.length)}: $value");
}

/// package to abstract path
/// package:flutter/src/material/icons.dart
///     ->  /flutter_sdk_parent_dir/flutter/packages/flutter/lib/src/material/icons.dart
// String packageToAbstractPath(String package) {
//   var relativePath = package.replaceFirst("package:flutter/", "");
//   return path.join(env.flutterSdkDir, "packages/flutter/lib", relativePath);
// }
