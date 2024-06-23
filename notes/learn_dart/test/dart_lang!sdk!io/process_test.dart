// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

main() async {
  var cmd = path.join(path.current, "test/dart_lang!sdk!io/process.sh1");
  await runProcess(cmd, []);
}

Future<void> runProcess(
  String command,
  List<String> args, {
  String? cwd,
}) async {
  print('\n cmd:$command args:${args.join(' ')}');

  var process = await Process.start(command, args, workingDirectory: cwd,runInShell: true);

  printStream(process.stdout);
  printStream(process.stderr);

  var exitCode = await process.exitCode;
  if (exitCode != 0) {
    throw '$command exited with $exitCode';
  }
}
Future<void> printStream(Stream<List<int>> stream) async {
  var s = stream.transform(utf8.decoder).transform(LineSplitter());
  await for (final line in s) {
    print('  $line');
  }

  // stream.transform(utf8.decoder).transform(LineSplitter()).listen((line) {
  //   print('  $line');
  // });

}