// note外壳

// We separate the note.dart and note_shell.dart packages of note,
// because shells can have both flutter and html implementations in the future,
// and notes should not depend on which shell is used
export 'package:note_dart/src/note_layout.dart' show LayoutScreen, DeferredScreen;
