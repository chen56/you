import 'package:file/memory.dart';
import 'package:test/test.dart';

import '../../bin/you_cli.dart';

void main() {
  late NotesGenerator gen;
  late MemoryFileSystem fs;

  setUp(() {
    fs = MemoryFileSystem();
    fs.directory("/n/lib/pages").createSync(recursive: true);
    fs.currentDirectory = "/n";

    gen = NotesGenerator(
      packageName: "flutter_web",
      fs: fs,
      projectDir: fs.directory("./"),
    );
  });

  group("NotesGenerator", () {
    test('basic app_info', () {
      expect(gen.projectDir.path, "./");
      expect(gen.libDir.path, "./lib");
      expect(gen.noteRootDir.path, "./lib/pages");
    });
  });

  group("NoteLib", () {
    test('relative path', () {
      var testcases = [
        (noteRoute: "lib/pages/note.dart", key: "/", flatName: "root", asset: "lib/pages/"),
        (noteRoute: "lib/pages/a/note.dart", key: "/a", flatName: "a", asset: "lib/pages/a/"),
        (noteRoute: "lib/pages/a/b/note.dart", key: "/a/b", flatName: "a_b", asset: "lib/pages/a/b/"),
        // number prefix may be use to sort
        (noteRoute: "lib/pages/1.a/note.dart", key: "/1.a", flatName: "a", asset: "lib/pages/1.a/"),
      ];
      for (var testcase in testcases) {
        NoteLib note = gen.newNoteLib2(fs.file(testcase.noteRoute));
        expect(note.noteKey, testcase.key);
        expect(note.flatName, testcase.flatName);
        expect(note.asset, testcase.asset);
      }
    });
    test('absolute path', () {
      gen = NotesGenerator(
        packageName: "flutter_web",
        fs: fs,
        projectDir: fs.directory("/n"),
      );

      var testcases = [
        (noteRoute: "/n/lib/pages/note.dart", key: "/", flatName: "root", asset: "lib/pages/"),
        (noteRoute: "/n/lib/pages/a/note.dart", key: "/a", flatName: "a", asset: "lib/pages/a/"),
        (noteRoute: "/n/lib/pages/a/b/note.dart", key: "/a/b", flatName: "a_b", asset: "lib/pages/a/b/"),
        // number prefix may be use to sort
        (noteRoute: "/n/lib/pages/1.a/note.dart", key: "/1.a", flatName: "a", asset: "lib/pages/1.a/"),
      ];
      for (var testcase in testcases) {
        NoteLib note = gen.newNoteLib2(fs.file(testcase.noteRoute));
        expect(note.noteKey, testcase.key);
        expect(note.flatName, testcase.flatName);
        expect(note.asset, testcase.asset);
      }
    });
  });

  group("gen cell app_info", () {
    test('1', () async {
      fs.file("/n/lib/pages/note.dart").writeAsStringSync("""import 'package:flutter/widgets.dart';
import 'package:you_note_dart/note.dart';

build(BuildContext context, Pen print) {
  print(const MD(r'''## cell 2'''));
  print("in cell 2");

  /// print.markdown is cell separator
  print(const MD(r'''## cell 3'''));
  print("in cell 3");
}
      """);
      var noteLib = gen.newNoteLib2(fs.file("lib/pages/note.dart"));
      // ignore: unused_local_variable
      PageData noteGen = await noteLib.collectPageData();
      // expect(noteGen.noteConf?.displayName, "/");
    });
  });
}
