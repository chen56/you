import 'package:learn_flutter/note/@common/note.dart';
import 'package:learn_flutter/note/material/text/Text/note.dart' as material_text_text;
import 'package:learn_flutter/note/material/text/RichText//note.dart' as material_text_rich_text;
import 'package:learn_flutter/note/state/1.vanilla_state/note.dart' as vanilla_state;
import 'package:learn_flutter/skeleton.dart';

Pag rootPage = Pag("/", skeleton: RootSkeleton(), kids: [
  Pag("/note", kids: [
    Pag("material", kids: [
      Pag("button", kids: []),
      Pag("text", kids: [
        material_text_text.note,
        material_text_rich_text.note,
      ]),
    ]),
    Pag("state", kids: [
      vanilla_state.note,
    ]),
  ]),
]);

Pag $(path) => rootPage.kid(path);

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

