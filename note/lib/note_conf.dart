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
  SpaceNoteConf.decode(Map<String, dynamic> json)
      : this(
          displayName: json["displayName"] ?? "",
          order: json["order"] ?? 100,
        );

  SpaceNoteConf({required this.displayName, required this.order});
}

/// note.json
class NoteConf {
  late String displayName;
  late bool codeExpand;

  // Sorting, small numbers first
  late int order;

  NoteConf.decode(String jsonStr) {
    Map<String, dynamic> json = jsonDecode(jsonStr);
    displayName = json["displayName"] ?? "";
    order = json["order"] ?? 100;
    codeExpand = json["codeExpand"] ?? true;
  }

  Map<String, dynamic> encode() {
    return {
      "displayName": displayName,
      "order": order,
      "codeExpand": codeExpand,
    };
  }

  Future<NoteConf> save(File file) async {
    await file.writeAsString(_encoder.convert(encode()));
    return this;
  }
}
