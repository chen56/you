import 'package:file/memory.dart';
import 'package:test/test.dart';

import '../../bin/notecli.dart';

void main() {
  late NotesGenerator gen;
  late MemoryFileSystem fs;

  setUp(() {
    fs = MemoryFileSystem();
    fs.directory("/n/lib/notes").createSync(recursive: true);
    fs.currentDirectory = "/n";

    gen = NotesGenerator(
      packageBaseName: "flutter_web",
      fs: fs,
      projectDir: fs.directory("./"),
    );
  });

  group("NotesGenerator", () {
    test('basic app_info', () {
      expect(gen.projectDir.path, "./");
      expect(gen.libDir.path, "./lib");
      expect(gen.noteRootDir.path, "./lib/notes");
    });
  });

  group("NoteLib", () {
    test('relative path', () {
      var testcases = [
        (noteRoute: "lib/notes/note.dart", key: "/", asVariableName: "root", asset: "lib/notes/"),
        (noteRoute: "lib/notes/a/note.dart", key: "/a", asVariableName: "a", asset: "lib/notes/a/"),
        (noteRoute: "lib/notes/a/b/note.dart", key: "/a/b", asVariableName: "a_b", asset: "lib/notes/a/b/"),
        // number prefix may be use to sort
        (noteRoute: "lib/notes/1.a/note.dart", key: "/1.a", asVariableName: "a", asset: "lib/notes/1.a/"),
      ];
      for (var testcase in testcases) {
        NoteLib note = gen.noteOf(testcase.noteRoute);
        expect(note.noteKey, testcase.key);
        expect(note.asVariableName, testcase.asVariableName);
        expect(note.asset, testcase.asset);
      }
    });
    test('absolute path', () {
      gen = NotesGenerator(
        packageBaseName: "flutter_web",
        fs: fs,
        projectDir: fs.directory("/n"),
      );

      var testcases = [
        (noteRoute: "/n/lib/notes/note.dart", key: "/", asVariableName: "root", asset: "lib/notes/"),
        (noteRoute: "/n/lib/notes/a/note.dart", key: "/a", asVariableName: "a", asset: "lib/notes/a/"),
        (noteRoute: "/n/lib/notes/a/b/note.dart", key: "/a/b", asVariableName: "a_b", asset: "lib/notes/a/b/"),
        // number prefix may be use to sort
        (noteRoute: "/n/lib/notes/1.a/note.dart", key: "/1.a", asVariableName: "a", asset: "lib/notes/1.a/"),
      ];
      for (var testcase in testcases) {
        NoteLib note = gen.noteOf(testcase.noteRoute);
        expect(note.noteKey, testcase.key);
        expect(note.asVariableName, testcase.asVariableName);
        expect(note.asset, testcase.asset);
      }
    });
  });

  group("gen cell app_info", () {
    test('1', () async {
      fs.file("/n/lib/notes/note.dart").writeAsStringSync("""import 'package:flutter/widgets.dart';
import 'package:note_dart/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''## cell 2''');
  print("in cell 2");

  /// print.markdown is cell separator
  print.markdown(r'''## cell 3''');
  print("in cell 3");
}
      """);
      var noteLib = gen.noteOf("lib/notes/note.dart");
      // ignore: unused_local_variable
      NoteParseResult noteGen = await noteLib.gen();
      // expect(noteGen.noteConf?.displayName, "/");
    });
  });
}
