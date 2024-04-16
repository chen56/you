import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:note_lang_dart/note_conf.dart';

void main() {
  group("Space.json", () {
    test("to json", () {
      SpaceConf space = SpaceConf.decode({});
      space.notes["/welcome"] = SpaceNoteConf.decode({});
      expect(jsonEncode(space.encode()), '{"notes":{"/welcome":{"displayName":"","order":100}}}');

      var loaded = SpaceConf.decode(space.encode());
      expect(jsonEncode(loaded.encode()), jsonEncode(space.encode()));
    });
  });
}
