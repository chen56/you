// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'package:you_note_dart/src/note_page.dart';
import 'package:stack_trace/stack_trace.dart';

@internal
class Note extends ChangeNotifier{
  Note();

  /// 这个方法作用是代码区块隔离，方便语法分析器
  /// 这个函数会在代码显示器中擦除
  final List<Object?> _contents = [];

  List<Object?> get contents => List.unmodifiable(_contents);

  void call(Object? content) {
    _add(content);
  }
  void _add(Object? content) {
    _contents.add(content);
    notifyListeners();
  }

  Cell next({Widget? title}) {
    var result = Cell(title: title, pen: this);
    _contents.add(result);
    return result;
  }
}

class Cell extends ChangeNotifier {
  final List<Object?> _contents = List.empty(growable: true);
  final Note pen;
  final Widget? title;

  Cell({
    this.title,
    required this.pen,
  });

  List<Object?> get contents => List.unmodifiable(_contents);

  bool isEmpty() => contents.isEmpty;

  void call(Object? content) {
    _add(content);
  }

  void _add(Object? content) {
    _contents.add(content);
    notifyListeners();
  }

  /// 注意：只能在NotePage的[_build]函数的最外层调用，不能放在button回调或Timer回调中
  /// 通过闭包记住currentCell的引用，以便可以在之后的回调中也可以print内容到currentCell
  @experimental
  void runInCurrentCell(void Function(Cell print) callback, {Widget? title}) {
    callback(this);
  }

  /// 新增一个cell，cell代表note中的一个代码块及其产生的内容
  /// Add a new cell, which is a code block and its generated content in the note
  Cell next({Widget? title}) {
    return pen.next();
  }

  @internal
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

  @override
  String toString() {
    return "$Cell(hash:$hashCode, contents[${contents.length}]:$contents)";
  }
}
