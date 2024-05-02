import 'package:flutter_test/flutter_test.dart';
import 'package:checks/checks.dart';
import 'package:you_note_dart/note.dart';
import 'package:you_note_dart/src/note/note.dart';

void main() {
  group("Cell.call", () {
    test("print(obj) == Cell.call(obj) == Cell.contents.add(obj)", () async {
      Cell print = Cell.empty();
      check(print.children).deepEquals([]);

      //when
      print("hello");

      //then
      check(print.contents).deepEquals(["hello"]);
      check(print.children.isEmpty).isTrue();
    });

    test("Root Cell print(Cell) == root.contents.add(Cell)", () async {
      Cell print = Cell.empty();
      Cell childPrint = Cell.empty();
      print(childPrint);
      check(print.children.length).equals(0);
      check(print.contents, because: "print == add content").deepEquals([childPrint]);
    });
  });
  group("Print.next", () {
    test("addCell()", () async {
      Cell print = Cell.empty();
      print.addCell(title: "1");
      print.addCell(title: "2");
      check(print.children.map((e) => e.title)).deepEquals(["1", "2"]);
    });
  });
  group("Cell.toList", () {
    test("toList()", () async {
      Cell print = Cell.empty(title: "0");
      print.addCell(title: "1");
      print.addCell(title: "2").addCell(title: "2.1");
      check(print.toList().map((e) => e.title)).deepEquals(["0", "1", "2", "2.1"]);
    });
    test("note Sequential writing style", () async {
      Cell print = Cell.empty(title: "0");
      var root = print;

      print("0:content");
      print = print.addCell(title: "1");
      print("1:content");
      print = print.addCell(title: "2");
      print("2:content");
      check(root.toList().map((e) => e.title)).deepEquals(["0", "1", "2"]);
    });
  });
}
