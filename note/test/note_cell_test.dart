import 'package:flutter_test/flutter_test.dart';
import 'package:note/note.dart';

void main() {
  group("note cell info", () {
    test("cell", () async {
      var root = Note.root();
      NotePage notePage = await root.loadPage();
    });
  });
}
