// note外壳

// We separate the note_page.dart and note_shell.dart packages of note,
// because shells can have both flutter and html implementations in the future,
// and notes should not depend on which shell is used
export 'package:note/src/note_system.dart' show NoteSystem;
export 'package:note/src/note_layout.dart' show LayoutScreen;
