// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:you_note_dart/src/content/object_content.dart';
import 'package:you_note_dart/src/content/markdown_content.dart';
import 'package:you_note_dart/src/note_route.dart';
import 'package:source_map_stack_trace/source_map_stack_trace.dart' as source_map_stack_trace;
import 'package:stack_trace/stack_trace.dart';
import 'package:path/path.dart' as path;
import 'package:source_maps/source_maps.dart' as source_map;

/// 本项目page开发模型，包括几部分：
/// - 本包：page开发模型的核心数据结构，并不参与具体UI样式表现
/// - [Layout]的具体实现，比如
/// 本package关注page模型的逻辑数据，并不参与展示页面的具体样式构造

///
/// cell 是一段代码加上其运行后的一块界面区域，和jupyter/observablehq 中的cell概念类似，
/// 但由于我们并没有一个notebook编辑器，一个cell，一个cell的编辑运行代码，而是通过代码分析器从
/// dart代码中自动分割cell的，所以逻辑上有些许不同。
///
/// A cell is a block of code and an it's display area on page ui.
/// The concept of a cell in jupyter/Observablehq is similar,
/// but since we do not have a notebook editor, a cell is auto analyzed from Dart code,
///
/// - flutter_web 的cell在界面上是只读的
/// - cell是我们对dart文件的一种视角
///
/// 一个dart文件被识别为以下cells
/// ================================= cell[0] header code block
/// import 'package:some/package.dart';
///
/// class X{}
/// var x = "some var";
///
/// build(context,print){
/// ================================= cell[1] code block
///   do something
///   print.$_______________________;   // new cell directive
/// ================================= cell[2] code block
///   do something
/// ================================= cell[3] tail code block
/// } // end of build()
/// class Y{}
/// var y = "some var";
///
///

class CellPrint {
  /// 这个方法作用是代码区块隔离，方便语法分析器
  /// 这个函数会在代码显示器中擦除
  @internal
  late final List<NoteCell> cells;
  @internal
  final Outline outline;
  @internal
  final NoteRoute note;
  @internal
  final NotePage notePage;
  final bool _defaultCodeExpand;

  late NoteCell _currentCell;

  @internal
  CellPrint.build(
    BuildContext context, {
    required this.notePage,
    required bool defaultCodeExpand,
    required this.outline,
  })  : _defaultCodeExpand = defaultCodeExpand,
        note = notePage.noteRoute {
    assert(note.source.pageGenInfo.cells.isNotEmpty, "page cells should not be empty");

    List<NoteCell> cells = List.empty(growable: true);
    for (int i = 0; i < note.source.pageGenInfo.cells.length; i++) {
      cells.add(NoteCell(
        pen: this,
        index: i,
        pageSource: note.source,
      ));
    }
    this.cells = List.unmodifiable(cells);
    // first cell is dart head code , All code before the build() function
    _currentCell = cells.first;

    // Skip the header code block
    $____________________________________________________________________();

    notePage.pageBuilder(context, this);
  }

  /// 新增一个cell，cell代表note中的一个代码块及其产生的内容
  /// Add a new cell, which is a code block and its generated content in the note
  void $____________________________________________________________________() {
    int nextCellIndex = _currentCell.index + 1;
    // It is already the last cell
    // It is possible that the code generation has not been synchronized
    if (nextCellIndex >= cells.length) {
      return;
    }

    _currentCell = cells[nextCellIndex];
  }

  /// FIXME 待处理
  Future<({Trace dartTrace, Frame? callerFrame})> caller() {
    try {
      throw Exception("track caller line");
    } catch (e, trace) {
      return NoteCell.findCallerLine(
        trace: trace,
        location: Uri.base,
        jsSourceMapLoader: (uri) async => (await http.get(uri)).body,
      );
    }
  }

  void call(Object? object) {
    _currentCell.print(object);
  }

  /// TODO 这个方案不错，可惜编辑器导航条需要有一个Text组件，加一个title
  /// 注意：只能在NotePage的[_build]函数的最外层调用，不能放在button回调或Timer回调中
  /// 通过闭包记住currentCell的引用，以便可以在之后的回调中也可以print内容到currentCell
  @experimental
  void runInCurrentCell(void Function(NoteCell print) callback, {Object? title = const Text("")}) {
    callback(_currentCell);
  }

  void markdown(String content) {
    call(MarkdownContent(outline: outline, content: content));
  }
}

/// 一个cell代表note中的一个代码块及其产生的内容qcancel mate function mate feature
/// A cell represents a code block in a note and its generated content
@internal
class NoteCell extends ChangeNotifier {
  final List<Widget> _contents = List.empty(growable: true);

  // index use to find code
  final int index;
  final CellPrint pen;
  late final CellSource source;
  final Outline outline;

  NoteCell({
    required this.pen,
    required this.index,
    required NoteSource pageSource,
  }) : outline = pen.outline {
    var codeCell = pageSource.pageGenInfo.cells[index];
    source = CellSource(
      codeEntity: CodeEntity(offset: codeCell.offset, end: codeCell.end),
      cellType: CellType.parse(codeCell.cellType),
      cell: this,
      specialSources: codeCell.specialNodes
          .map((e) => SpecialSource(
                codeType: e.nodeType,
                codeEntity: CodeEntity(offset: e.offset, end: e.end),
                cell: this,
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

  static Future<({Trace dartTrace, Frame? callerFrame})> findCallerLine({
    required StackTrace trace,
    required Uri location,
    Future<String> Function(Uri uri)? jsSourceMapLoader,
  }) async {
    Uri getJsMapUriFromJsTrace(StackTrace trace) {
      var parsed = Trace.from(trace);
      for (var frame in parsed.frames) {
        // 如果遇到解析不了的行(可能发生在测试中或其他情况)
        if (frame.line == null || frame.uri.path == "unparsed") {
          continue;
        }
        if (path.basename(frame.uri.path) != "main.dart.js") {
          return frame.uri.replace(path: "${frame.uri.path}.map");
        }
      }
      throw AssertionError("current only support deferred import page, that uri looks like: http://localhost:8080/you/flutter_web/main.dart.js_24.part.js, but your stack: $trace  ");
    }

    Frame? findCallerLineInDartTrace(StackTrace stackTrace, Uri location) {
      var trace = Trace.from(stackTrace);
      Frame? found;
      // 找到堆栈中连续出现的本页面中最后一个，就是哪一行实际触发了异常
      for (var frame in trace.frames) {
        if (frame.uri.path.endsWith(path.normalize("/notes/${location.fragment}/note.dart"))) {
          found = frame;
        } else {
          if (found != null) {
            return found;
          }
        }
      }
      return found;
    }

    Future<Trace> jsTraceToDartTrace(StackTrace jsTrace, Uri location) async {
      String sourceMap = await jsSourceMapLoader!(getJsMapUriFromJsTrace(trace));
      var dartTrace = source_map_stack_trace.mapStackTrace(source_map.parse(sourceMap), jsTrace);
      return Trace.from(dartTrace);
    }

    var dartTrace = jsSourceMapLoader == null ? Trace.from(trace) : await jsTraceToDartTrace(trace, location);

    return (dartTrace: dartTrace, callerFrame: findCallerLineInDartTrace(dartTrace, location));
  }

  @override
  String toString() {
    return "$name(hash:$hashCode,isMarkdownCell:$isAllMarkdownContent, isEmptyCode:$source.isCodeEmpty contents-${contents.length}:$contents)";
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

@internal
class OutlineNode {
  GlobalKey key;

  /// markdown 的原始标题级数：
  ///   root特殊为 0级
  ///   # 一级
  ///   ## 二级
  ///   等等...
  /// heading 和 level不一定想等，有时候markdown 的级数可能乱标，我们按idea,vscode的父子逻辑
  /// 来组织tree
  int heading;
  String title;

  OutlineNode? _parent;
  List<OutlineNode> kids = List.empty(growable: true);

  OutlineNode({required this.title, required this.heading, required this.key});

  OutlineNode add(OutlineNode newNode) {
    if (_parent == null || heading < newNode.heading) {
      newNode._parent = this;
      kids.add(newNode);
      return newNode;
    }
    return _parent!.add(newNode);
  }

  bool get isLeaf => kids.isEmpty;

  int get level => isRoot ? 0 : _parent!.level + 1;

  bool get isRoot => _parent == null;

  OutlineNode get root => isRoot ? this : _parent!.root;

  List<OutlineNode> toList({bool includeThis = true}) {
    var flatChildren = kids.expand((element) => element.toList()).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  @override
  String toString() {
    return "heading:$heading title:$title kids:${kids.length}";
  }

  void clear() {
    kids.clear();
  }
}
