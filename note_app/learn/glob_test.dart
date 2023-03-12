// ignore_for_file: unnecessary_type_check

import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:test/test.dart';

void main() {
  test('string.split', () {
    Glob glob = Glob("lib/note/**/@page.dart");
    glob.listSync().forEach((element) {
      print(element);
    });
  });
}
