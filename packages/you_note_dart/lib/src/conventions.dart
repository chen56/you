///  Configuration conventions for the note package.
library;

import 'package:path/path.dart' as path;

Conventions conventions = Conventions._();

/// 惯用规则
class Conventions {
  Conventions._();

  String noteDartAssetPath(String notePath) {
    return path.join("lib/pages", path.relative(notePath, from: "/"), "page.dart");
  }

  String noteConfAssetPath(String notePath) {
    return path.join("lib/pages", path.relative(notePath, from: "/"), "page.json");
  }
}
