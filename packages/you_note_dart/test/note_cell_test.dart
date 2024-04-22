import 'package:flutter_test/flutter_test.dart';
import 'package:checks/checks.dart';
import 'package:you_note_dart/note.dart';
import 'package:you_note_dart/src/note.dart';

void main() {
  group("Print.call", () {
    test("Print.call auto add first cell ", () async {
      Print print = Print();
      check(print.cells).deepEquals([]);

      //when
      print("hello");
      //then
      check(print.cells.length, because: "auto add cell").equals(1);
      check(print.cells[0].contents, because: "add to cells[0]").deepEquals(["hello"]);
    });
    test("Print.print(Cell) == get all Cells", () async {
      Cell cell = Cell();
      Cell cell2 = Cell();
      cell("print");
      cell(cell2);

      Print print = Print();
      print(cell);
      check(print.cells).deepEquals([cell, cell2]);
    });
    test("Print.print(Print) == get all Cells ", () async {
      Print print1 = Print();
      Cell cell1 = Cell();
      Cell cell2 = Cell();
      print1(cell1);
      print1(cell2);
      check(print1.cells).deepEquals([cell1, cell2]);

      Print rootPrint = Print();
      rootPrint(print1);
      check(rootPrint.cells).deepEquals([cell1, cell2]);
    });
  });
  group("Print.next", () {
    test("Print.next cell ", () async {
      Print print = Print();

      //when
      Cell cell1 = print.next();
      Cell cell2 = cell1.next();
      //then
      check(print.cells).deepEquals([cell1, cell2]);
    });
    test("Cell.next Orphan cells cannot build new cells ", () async {
      Cell cell1 = Cell();

      try {
        cell1.next();
        fail("not here");
      } catch (e) {
        check((e as AssertionError).message).equals("Orphan cells cannot build new cells");
      }
    });
  });
}
