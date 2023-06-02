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

import 'package:file/file.dart';

// format json
JsonEncoder _encoder = const JsonEncoder.withIndent('  ');

/// note_space.json
class SpaceConf {
  int nextNoteId = 0;
  final Map<String, SpaceNoteConf> notes = {};
  SpaceConf.decode(Map<String, dynamic> json) {
    nextNoteId = json["nextNoteId"] ?? 0;

    json["notes"]?.forEach((key, value) {
      notes[key] =
          SpaceNoteConf.decode(value is Map<String, dynamic> ? value : {});
    });
  }

  static Future<SpaceConf> load(File jsonFile) async {
    if (!await jsonFile.exists()) {
      return SpaceConf.decode({});
    }

    Map<String, dynamic> json = jsonDecode(await jsonFile.readAsString());
    return SpaceConf.decode(json);
  }

  SpaceConf.decodeJson(String jsonStr) : this.decode(jsonDecode(jsonStr));

  Map<String, dynamic> encode() {
    return {
      "notes": notes.map(
        (key, value) => MapEntry(
          key,
          {
            "displayName": value.displayName,
            "order": value.order,
          },
        ),
      ),
    };
  }

  Future<SpaceConf> save(File file) async {
    await file.writeAsString(_encoder.convert(encode()));
    return this;
  }
}

/// This is a lite version of note.json, summarized in note_space.json, for easy navigation
class SpaceNoteConf {
  String displayName;
  // Sorting, small numbers first
  int order;
  SpaceNoteConf.decode(Map<String, dynamic> json, {String displayName = ""})
      : displayName = json["displayName"] ?? displayName,
        order = json["order"] ?? 100;

  SpaceNoteConf({this.displayName = "", this.order = 100});
}

/// note.json
class NoteConf {
  String displayName = "";
  // Sorting, small numbers first
  int order = 100;

  NoteConf.decode(Map<String, dynamic> json, {String noteBasename = ""}) {
    displayName = json["displayName"] ?? noteBasename;
    order = json["order"] ?? 100;
  }

  static Future<NoteConf> load(File jsonFile,
      {String noteBasename = ""}) async {
    if (!await jsonFile.exists()) {
      return NoteConf.decode({}, noteBasename: noteBasename);
    }

    var json = jsonDecode(await jsonFile.readAsString());
    return NoteConf.decode(json, noteBasename: noteBasename);
  }

  Map<String, dynamic> encode() {
    return {
      "displayName": displayName,
    };
  }

  Future<NoteConf> save(File file) async {
    await file.writeAsString(_encoder.convert(encode()));
    return this;
  }
}
