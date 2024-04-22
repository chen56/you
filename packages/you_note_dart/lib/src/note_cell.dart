// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:you_flutter/you_state.dart';

import 'package:you_note_dart/src/note_page.dart';
import 'package:stack_trace/stack_trace.dart';

class Print {
  Print();

  /// 这个方法作用是代码区块隔离，方便语法分析器
  /// 这个函数会在代码显示器中擦除
  final List<Object?> _contents = [].signal();

  List<Object?> get contents => List.unmodifiable(_contents);

  void call(Object? content) {
    _add(content);
  }

  void _add(Object? content) {
    _contents.add(content);
  }

  Cell next({Widget? title}) {
    var result = Cell(title: title, pen: this);
    _contents.add(result);
    return result;
  }
  bool isEmpty() => contents.isEmpty;


  /// 注意：只能在NotePage的[_build]函数的最外层调用，不能放在button回调或Timer回调中
  /// 通过闭包记住currentCell的引用，以便可以在之后的回调中也可以print内容到currentCell
  @experimental
  void runInCurrentCell(void Function(Print print) callback, {Widget? title}) {
    callback(this);
  }

}

class Cell extends Print {
  final Print pen;
  final Widget? title;

  Cell({
    this.title,
    required this.pen,
  });

  /// 注意：只能在NotePage的[_build]函数的最外层调用，不能放在button回调或Timer回调中
  /// 通过闭包记住currentCell的引用，以便可以在之后的回调中也可以print内容到currentCell
  @experimental
  void runInCurrentCell(void Function(Cell print) callback, {Widget? title}) {
    callback(this);
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
