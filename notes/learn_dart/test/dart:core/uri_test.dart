// ignore_for_file: unnecessary_type_check

import 'package:checks/checks.dart';
import 'package:test/test.dart';

void main() {
  group('uri', () {
    test('segments', () {
      //
      check(Uri.parse("/").pathSegments).deepEquals([]);
      check(Uri.parse("https://a.com/").pathSegments).deepEquals([]);


      check(Uri.parse("//").pathSegments).deepEquals([]);
      check(Uri.parse("https://a.com//").pathSegments).deepEquals(["",""]);

      check(Uri.parse("/a").pathSegments).deepEquals(["a"]);
      check(Uri.parse("https://a.com/a").pathSegments).deepEquals(["a"]);

      check(Uri.parse("/a/").pathSegments).deepEquals(["a",""]);
      check(Uri.parse("https://a.com/a/").pathSegments).deepEquals(["a",""]);
    });

  });
}
