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

class SpaceConf {
  int nextNoteId = 0;
  final Map<String, SpaceNoteConf> notes = {};
  SpaceConf(Map<String, dynamic> json) {
    nextNoteId = json["nextNoteId"] ?? 0;

    json["notes"]?.forEach((key, value) {
      int? id = value["id"];
      assert(id != null,
          "$key: id is null, please remove json path [notes]  regenerate it ");

      String? name = value["displayName"];
      assert(name != null,
          "$key: displayName is null, please remove json path [notes]  regenerate it ");

      notes[key] = SpaceNoteConf(displayName: name!);
    });
  }

  static Future<SpaceConf> load(File jsonFile) async {
    if (!await jsonFile.exists()) {
      return SpaceConf({});
    }

    Map<String, dynamic> json = jsonDecode(await jsonFile.readAsString());
    return SpaceConf(json);
  }

  SpaceConf.decode(String jsonStr) : this(jsonDecode(jsonStr));

  Map<String, dynamic> toJson() {
    return {
      "notes": notes.map(
        (key, value) => MapEntry(
          key,
          {
            "displayName": value.displayName,
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
  String displayName;
  SpaceNoteConf({required this.displayName});
  SpaceNoteConf.empty({required this.displayName});
}

class NoteConf {
  String displayName = "";
  // Sorting, small numbers first
  int order = 100;
  NoteConf(Map<String, dynamic> json, {required String noteBasename}) {
    displayName = json["displayName"] ?? noteBasename;
    order = json["order"] ?? 100;
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
      "displayName": displayName,
    };
  }

  Future<NoteConf> save(File file) async {
    await file.writeAsString(_encoder.convert(toJson()));
    return this;
  }
}
