import 'package:file/local.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_tools/src/note_dev_gen.dart';

void main() {
  group("NotesGenerator", () {
    NotesGenerator gen = NotesGenerator(packageBaseName: "flutter_note", fs: LocalFileSystem(), projectDir: "./");

    test('NotesGenerator dir', () {
      expect(gen.projectDir, ".");
    });
  });

  group("NoteLib", () {
    test('relative path', () {
      NotesGenerator gen = NotesGenerator(packageBaseName: "flutter_note", fs: LocalFileSystem(), projectDir: "./");

      var testcases = [
        (note: "lib/notes/note.dart", key: "/", name: "root", asset: "lib/notes/"),
        (note: "lib/notes/a/note.dart", key: "/a", name: "a", asset: "lib/notes/a/"),
        (note: "lib/notes/a/b/note.dart", key: "/a/b", name: "a_b", asset: "lib/notes/a/b/"),
        // number prefix may be use to sort
        (note: "lib/notes/1.a/note.dart", key: "/1.a", name: "a", asset: "lib/notes/1.a/"),
      ];
      for (var testcase in testcases) {
        NoteLib note = gen.noteOf(testcase.note);
        expect(note.noteKey, testcase.key);
        expect(note.name, testcase.name);
        expect(note.asset, testcase.asset);
      }
    });
    test('aba path', () {
      NotesGenerator gen = NotesGenerator(packageBaseName: "flutter_note", fs: LocalFileSystem(), projectDir: "/n");

      var testcases = [
        (note: "/n/lib/notes/note.dart", key: "/", name: "root", asset: "lib/notes/"),
        (note: "/n/lib/notes/a/note.dart", key: "/a", name: "a", asset: "lib/notes/a/"),
        (note: "/n/lib/notes/a/b/note.dart", key: "/a/b", name: "a_b", asset: "lib/notes/a/b/"),
        // number prefix may be use to sort
        (note: "/n/lib/notes/1.a/note.dart", key: "/1.a", name: "a", asset: "lib/notes/1.a/"),
      ];
      for (var testcase in testcases) {
        NoteLib note = gen.noteOf(testcase.note);
        expect(note.noteKey, testcase.key);
        expect(note.name, testcase.name);
        expect(note.asset, testcase.asset);
      }
    });
  });
}
