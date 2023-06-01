// class NoteSpaceConf {
//   List<NoteProjectConf> projects = [];
// }
//
// class NoteProjectConf {
//   late String name;
//   late String path;
//   late String type;
// }

class NoteSpaceConf {
  int nextNoteId = 0;
  final Map<String, NoteConf> notes = {};
  NoteSpaceConf();
  NoteSpaceConf.fromJSon(Map<String, dynamic> json) {
    nextNoteId = json["nextNoteId"] ?? 0;

    json["notes"]?.forEach((key, value) {
      int? id = value["id"];
      assert(id != null,
          "$key: id is null, please remove json path [notes]  regenerate it ");

      String? title = value["title"];
      assert(title != null,
          "$key: title is null, please remove json path [notes]  regenerate it ");

      notes[key] = NoteConf(id: id!, title: title!);
    });
  }

  toJson() {
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
}

class NoteConf {
  int id;
  String title;
  NoteConf({required this.id, required this.title});
}

class NotePageConf {
  int id;
  String title;
  NotePageConf({required this.id, required this.title});
}
