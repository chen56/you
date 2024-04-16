///  Configuration conventions for the note package.
library;

import 'package:path/path.dart' as path;

Conventions conventions = Conventions._();

class Conventions {
  Conventions._();

  String noteDartAssetPath(String notePath) {
    return path.join("lib/notes", notePath, "note.dart");
  }

  String noteConfAssetPath(String notePath) {
    return path.join("lib/notes", notePath, "note.json");
  }
}
