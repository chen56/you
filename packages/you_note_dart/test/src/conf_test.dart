import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:you_note_dart/note_conf.dart';

void main() {
  group("Space.json", () {
    test("to json", () {
      SpaceConf space = SpaceConf.decode({});
      space.notes["/welcome"] = NoteConf.decodeJson({});
      expect(jsonEncode(space.encode(includeComment: false)), '{"currentMaxNoteId":1,"notes":{"/welcome":{"displayName":"","order":100,"codeExpand":false}}}');

      var loaded = SpaceConf.decode(space.encode());
      expect(jsonEncode(loaded.encode()), jsonEncode(space.encode()));
    });
  });
}
