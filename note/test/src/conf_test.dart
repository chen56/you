import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:note/note_conf.dart';

void main() {
  group("Space.json", () {
    test("to json", () {
      SpaceConf space = SpaceConf({});
      space.notes["/welcome"] = SpaceNoteConf(id: 1, title: "hello");
      expect(jsonEncode(space.toJson()), '{"notes":{"/welcome":{"id":1,"title":"hello"}}}');

      var loaded = SpaceConf(space.toJson());
      expect(jsonEncode(loaded.toJson()), jsonEncode(space.toJson()));
    });
  });
}
