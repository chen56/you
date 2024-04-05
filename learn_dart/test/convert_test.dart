import 'dart:convert' as convert;

import 'package:test/test.dart';
import 'package:path/path.dart' as path;
import 'package:file/file.dart';
import 'package:file/local.dart';

void main() {
  FileSystem fs = const LocalFileSystem();

  group("json", () {
    test('jsonEncode', () {
      var encoded = convert.jsonEncode("\"obj#ect");
      expect(encoded, '''"\\"obj#ect"''');
      print(convert.jsonDecode(encoded));
      expect(convert.jsonDecode(encoded), "\"obj#ect");
    });
  });

  group("json", () {
    test('jsonEncode', () {
      //中文字符
      String str = fs.file(path.absolute("test/convert_test.dart")).readAsStringSync();
      final bytes = convert.utf8.encode(str);
      final encoded = convert.base64.encode(bytes);
      var decoded = convert.base64.decode(encoded);
      var decodedutf8 = convert.utf8.decode(decoded);
      print(encoded);
      print(decodedutf8);
    });
  });
}
