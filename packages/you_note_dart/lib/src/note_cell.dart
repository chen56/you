// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'package:you_note_dart/src/note_page.dart';
import 'package:stack_trace/stack_trace.dart';

@internal
class Note {
  Note();

  /// 这个方法作用是代码区块隔离，方便语法分析器
  /// 这个函数会在代码显示器中擦除
  final List<Cell> cells = [];

  Cell next({Widget? title}) {
    var result = Cell(title: title, pen: this);
    cells.add(result);
    return result;
  }
}

/// TODO Cell应该时个普通的配置对象，类似Widget,用户可以扩展
/// 一个cell代表note中的一个代码块及其产生的内容cancel mate function mate feature
/// A cell represents a code block in a note and its generated content
class Cell extends ChangeNotifier {
  final List<Object?> _contents = List.empty(growable: true);
  final Note pen;
  final Widget? title;

  Cell({
    this.title,
    required this.pen,
  }) {
    // TODO 130 remove
    // var codeCell = pageSource.pageGenInfo.cells[index];
    // source = CellSource(
    //   codeEntity: CodeEntity(offset: codeCell.offset, end: codeCell.end),
    //   cellType: CellType.parse(codeCell.cellType),
    //   page: pen.notePage,
    //   specialSources: codeCell.specialNodes
    //       .map((e) => SpecialSource(
    //     codeType: e.nodeType,
    //     codeEntity: CodeEntity(offset: e.offset, end: e.end),
    //     page: pen.notePage,
    //     note: pen.note,
    //   ))
    //       .toList(),
    // );
  }

  List<Object?> get contents => List.unmodifiable(_contents);

  bool isContentEmpty() => contents.isEmpty;

  void print(Object? object) {
    call(object);
  }

  /// 注意：只能在NotePage的[_build]函数的最外层调用，不能放在button回调或Timer回调中
  /// 通过闭包记住currentCell的引用，以便可以在之后的回调中也可以print内容到currentCell
  @experimental
  void runInCurrentCell(void Function(Cell print) callback, {Object? title = const Text("")}) {
    callback(this);
  }

  /// 新增一个cell，cell代表note中的一个代码块及其产生的内容
  /// Add a new cell, which is a code block and its generated content in the note
  Cell next({Object title = ""}) {
    return pen.next();
  }

  Future<({Trace dartTrace, Frame? callerFrame})> caller() {
    try {
      throw Exception("track caller line");
    } catch (e, trace) {
      return NoteSystem.findCallerLine(
        trace: trace,
        location: Uri.base,
        jsSourceMapLoader: (uri) async => (await http.get(uri)).body,
      );
    }
  }

  void call(Object? content) {
    _add(content);
  }

  void _add(Object? content) {
    _contents.add(content);
    notifyListeners();
  }

  // TODO 130 remove
  // show == expand
  // bool get codeExpand {
  //   if (source.isCodeEmpty) return false;
  //   //markdown cell default hidden code
  //   if (_codeExpand == null) {
  //     return switch (source.cellType) {
  //       CellType.header => false,
  //       CellType.tail => false,
  //       CellType.body => pen._defaultCodeExpand && !isAllMarkdownContent,
  //     };
  //   }
  //   return _codeExpand ?? pen._defaultCodeExpand;
  // }

  // TODO 130 remove
  // set codeExpand(bool newValue) {
  //   _codeExpand = newValue;
  //   notifyListeners();
  // }

  @override
  String toString() {
    return "$Cell(hash:$hashCode, contents[${contents.length}]:$contents)";
  }
}
