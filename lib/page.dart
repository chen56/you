import 'package:learn_flutter/note/@common/note.dart';
import 'package:learn_flutter/note/material/text/Text/note.dart' as material_text_text;
import 'package:learn_flutter/note/material/text/RichText//note.dart' as material_text_rich_text;
import 'package:learn_flutter/note/state/1.vanilla_state/note.dart' as vanilla_state;
import 'package:learn_flutter/skeleton.dart';

Note rootPage = Note("/", skeleton: RootSkeleton(), kids: [
  Note("note", kids: [
    Note("material", kids: [
      Note("button", kids: []),
      Note("text", kids: [
        Note("", meta: material_text_text.note),
        Note("", meta: material_text_rich_text.note),
      ]),
    ]),
    Note("state", kids: [
      Note("1.vanilla_state", meta: vanilla_state.note),
    ]),
  ]),
]);

Note $(path) => rootPage.kid(path);

var root = (
/**/$:$("/"),
/**/note: (
/****/dev : (
/******/mirror: $("/note/dev/mirror"),
/****/),
/**/)
);

main() {
  root.$.skeleton = RootSkeleton();
  // var x = pages.self./**/;
}

