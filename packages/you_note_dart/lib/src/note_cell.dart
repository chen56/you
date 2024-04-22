// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:you_note_dart/src/content/object_content.dart';
import 'package:you_note_dart/src/content/markdown_content.dart';
import 'package:you_note_dart/src/note_page.dart';
import 'package:stack_trace/stack_trace.dart';

@internal
class CellPrint {
  @internal
  CellPrint.build(
      BuildContext context, {
        required this.notePage,
        required bool defaultCodeExpand,
        required this.outline,
      })  : _defaultCodeExpand = defaultCodeExpand,
        note = notePage.noteRoute;

  /// 这个方法作用是代码区块隔离，方便语法分析器
  /// 这个函数会在代码显示器中擦除
  final List<Cell> cells = [];
  @internal
  final Outline outline;
  @internal
  final NoteRoute note;
  @internal
  final NotePage notePage;
  final bool _defaultCodeExpand;

  Cell next({Object title = ""}) {
    var result = Cell(title: title, pen: this, index: cells.length, pageSource: note.source);
    cells.add(result);
    return result;
  }
}

/// TODO Cell应该时个普通的配置对象，类似Widget,用户可以扩展
/// 一个cell代表note中的一个代码块及其产生的内容cancel mate function mate feature
/// A cell represents a code block in a note and its generated content
class Cell extends ChangeNotifier {
  final List<Widget> _contents = List.empty(growable: true);

  // index use to find code
  final int index;
  final CellPrint pen;
  late final CellSource source;
  final Outline outline;
  final Object title;

  Cell({
    this.title = "",
    required this.pen,
    required this.index,
    required NoteSource pageSource,
  }) : outline = pen.outline {
    var codeCell = pageSource.pageGenInfo.cells[index];
    source = CellSource(
      codeEntity: CodeEntity(offset: codeCell.offset, end: codeCell.end),
      cellType: CellType.parse(codeCell.cellType),
      page: pen.notePage,
      specialSources: codeCell.specialNodes
          .map((e) => SpecialSource(
        codeType: e.nodeType,
        codeEntity: CodeEntity(offset: e.offset, end: e.end),
        page: pen.notePage,
        note: pen.note,
      ))
          .toList(),
    );
  }

  List<Widget> get contents => List.unmodifiable(_contents);

  get name {
    return "cell[$index]";
  }

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
      return NotePage.findCallerLine(
        trace: trace,
        location: Uri.base,
        jsSourceMapLoader: (uri) async => (await http.get(uri)).body,
      );
    }
  }

  void markdown(String content) {
    call(MarkdownContent(outline: outline, content: content));
  }

  bool get isAllMarkdownContent {
    if (_contents.isEmpty) return false;
    return _contents.every((e) => e is MarkdownContent);
  }

  void call(Object? content) {
    Widget result = switch (content) {
      MD md => MarkdownContent(content: md.text, outline: outline),
      Widget widget => widget,
      _ => ObjectContent(content: content),
    };
    _add(result);
  }

  void _add(Widget content) {
    _contents.add(content);
    notifyListeners();
  }

  bool? _codeExpand;

  // show == expand
  bool get codeExpand {
    if (source.isCodeEmpty) return false;
    //markdown cell default hidden code
    if (_codeExpand == null) {
      return switch (source.cellType) {
        CellType.header => false,
        CellType.tail => false,
        CellType.body => pen._defaultCodeExpand && !isAllMarkdownContent,
      };
    }
    return _codeExpand ?? pen._defaultCodeExpand;
  }

  set codeExpand(bool newValue) {
    _codeExpand = newValue;
    notifyListeners();
  }

  @override
  String toString() {
    return "$name(hash:$hashCode  index:$index ,isMarkdownCell:$isAllMarkdownContent, isEmptyCode:$source.isCodeEmpty contents-${contents.length}:$contents)";
  }
}

// markdown 的结构轮廓，主要用来显示TOC
@internal
class Outline {
  bool _done = false;

  OutlineNode root = OutlineNode(key: GlobalKey(), heading: 0, title: "");
  OutlineNode? current;

  void add(OutlineNode newNode) {
    if (_done) return;
    if (current == null) {
      current = root.add(newNode);
      return;
    }
    current = current!.add(newNode);
  }

  /// bed design: 目前非常糟糕的设计，因为outline会在markdown 第一次Widget.build后才能装配好
  /// 第一次build时 界面上是看不到outline的，后面如果因为resize多次build，会造成outline持续重复增加内容
  /// 所以要结束掉它
  void collectDone() {
    _done = true;
  }
}
