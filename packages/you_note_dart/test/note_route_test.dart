import 'package:flutter_test/flutter_test.dart';
import 'package:checks/checks.dart';
import 'package:path/path.dart' as path;
void main() {
  group("Note path", () {
    test("study", () async {
      check(path.dirname("/")).equals("/");
      check(path.dirname("/a/b")).equals("/a");
      check(path.relative("/a/b",from: "/")).equals("a/b");
      check(path.dirname("")).equals(".");
      check(path.basename("/")).equals("/");
      check(path.basename("")).equals("");

    });
  });
}
