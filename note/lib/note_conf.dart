// class NoteSpaceConf {
//   List<NoteProjectConf> projects = [];
// }
//
// class NoteProjectConf {
//   late String name;
//   late String path;
//   late String type;
// }

import 'dart:convert';

import 'package:file/src/interface/file.dart' show File;

// format json
JsonEncoder _encoder = const JsonEncoder.withIndent('  ');

class SpaceConf {
  int nextNoteId = 0;
  final Map<String, SpaceNoteConf> notes = {};
  SpaceConf(Map<String, dynamic> json) {
    nextNoteId = json["nextNoteId"] ?? 0;

    json["notes"]?.forEach((key, value) {
      int? id = value["id"];
      assert(id != null,
          "$key: id is null, please remove json path [notes]  regenerate it ");

      String? title = value["title"];
      assert(title != null,
          "$key: title is null, please remove json path [notes]  regenerate it ");

      notes[key] = SpaceNoteConf(id: id!, title: title!);
    });
  }

  static Future<SpaceConf> load(File jsonFile) async {
    if (!await jsonFile.exists()) {
      return SpaceConf({});
    }

    Map<String, dynamic> json = jsonDecode(await jsonFile.readAsString());
    return SpaceConf(json);
  }

  Map<String, dynamic> toJson() {
    return {
      "notes": notes.map(
        (key, value) => MapEntry(
          key,
          {
            "id": value.id,
            "title": value.title,
          },
        ),
      ),
    };
  }

  Future<SpaceConf> save(File file) async {
    await file.writeAsString(_encoder.convert(toJson()));
    return this;
  }
}

class SpaceNoteConf {
  int id;
  String title;
  SpaceNoteConf({required this.id, required this.title});
}

class NoteConf {
  String title = "";
  NoteConf(Map<String, dynamic> json, {required String noteBasename}) {
    title = json["title"] ?? noteBasename;
  }

  static Future<NoteConf> load(File jsonFile,
      {required String noteBasename}) async {
    if (!await jsonFile.exists()) {
      return NoteConf({}, noteBasename: noteBasename);
    }

    var json = jsonDecode(await jsonFile.readAsString());
    return NoteConf(json, noteBasename: noteBasename);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
    };
  }

  Future<NoteConf> save(File file) async {
    await file.writeAsString(_encoder.convert(toJson()));
    return this;
  }
}
