// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

main() async {
  var cmd = path.join(path.current, "test/dart_lang!sdk!io/process.sh");
  await runProcess(cmd, []);
}

Future<void> runProcess(
  String command,
  List<String> args, {
  String? cwd,
}) async {
  print('\n$command ${args.join(' ')}');

  var process = await Process.start(command, args, workingDirectory: cwd);

  process.stdout.transform(utf8.decoder).transform(LineSplitter()).listen((line) {
    print('  $line');
  });
  process.stderr.transform(utf8.decoder).transform(LineSplitter()).listen((line) {
    print('  $line');
  });

  var exitCode = await process.exitCode;
  if (exitCode != 0) {
    throw '$command exited with $exitCode';
  }
}
