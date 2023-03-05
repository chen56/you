// value

import 'package:flutter_note/page.dart';
import 'package:flutter_note/pages/pages.dart';
import 'package:flutter_note/pages/@page.dart' as groot;
import 'package:flutter_note/pages/draft/dart3/@page.dart' as gdraft$dart3;
import 'package:flutter_note/pages/not_found/@page.dart' as gnot_found;
import 'package:flutter_note/pages/note/1.welcome/1.note-self/@page.dart' as gnote$welcome$note_self;
import 'package:flutter_note/pages/note/1.welcome/@page.dart' as gnote$welcome;
import 'package:flutter_note/pages/note/2.dev/debug/@page.dart' as gnote$dev$debug;
import 'package:flutter_note/pages/note/2.dev/mirror/@page.dart' as gnote$dev$mirror;
import 'package:flutter_note/pages/note/@page.dart' as gnote;
import 'package:flutter_note/pages/note/components/@page.dart' as gnote$components;
import 'package:flutter_note/pages/note/components/button/ElevatedButton/@page.dart'
    as gnote$components$button$ElevatedButton;
import 'package:flutter_note/pages/note/components/slider/@page.dart' as gnote$components$slider;
import 'package:flutter_note/pages/note/components/text/RichText/@page.dart' as gnote$components$text$RichText;
import 'package:flutter_note/pages/note/components/text/Text/@page.dart' as gnote$components$text$Text;
import 'package:flutter_note/pages/note/layout/@page.dart' as gnote$layout;
import 'package:flutter_note/pages/note/scrollable/Dismissible/@page.dart' as gnote$scrollable$Dismissible;
import 'package:flutter_note/pages/note/selectable/@page.dart' as gnote$selectable;
import 'package:flutter_note/pages/note/state/1.vanilla_state/@page.dart' as gnote$state$vanilla_state;
import 'package:flutter_note/pages/note/state/StatefulBuilder/@page.dart' as gnote$state$StatefulBuilder;

mixin PathsMixin {
  final Path root = put("/", groot.page);

  final Path draft$dart3 = put("/draft/dart3", gdraft$dart3.page);

  final Path not_found = put("/not_found", gnot_found.page);

  final Path note$welcome$note_self = put("/note/1.welcome/1.note-self", gnote$welcome$note_self.page);

  final Path note$welcome = put("/note/1.welcome", gnote$welcome.page);

  final Path note$dev$debug = put("/note/2.dev/debug", gnote$dev$debug.page);

  final Path note$dev$mirror = put("/note/2.dev/mirror", gnote$dev$mirror.page);

  final Path note = put("/note", gnote.page);

  final Path note$components = put("/note/components", gnote$components.page);

  final Path note$components$button$ElevatedButton =
      put("/note/components/button/ElevatedButton", gnote$components$button$ElevatedButton.page);

  final Path note$components$slider = put("/note/components/slider", gnote$components$slider.page);

  final Path note$components$text$RichText = put("/note/components/text/RichText", gnote$components$text$RichText.page);

  final Path note$components$text$Text = put("/note/components/text/Text", gnote$components$text$Text.page);

  final Path note$layout = put("/note/layout", gnote$layout.page);

  final Path note$scrollable$Dismissible = put("/note/scrollable/Dismissible", gnote$scrollable$Dismissible.page);

  final Path note$selectable = put("/note/selectable", gnote$selectable.page);

  final Path note$state$vanilla_state = put("/note/state/1.vanilla_state", gnote$state$vanilla_state.page);

  final Path note$state$StatefulBuilder = put("/note/state/StatefulBuilder", gnote$state$StatefulBuilder.page);
}
