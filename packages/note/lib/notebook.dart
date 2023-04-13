import 'package:flutter/material.dart';
import 'package:note/mate.dart';
import 'package:note/page_core.dart';

class Notebook {
  MainCell header;
  List<MainCell> build;
  MainCell tail;
  Notebook({
    required this.header,
    required this.build,
    required this.tail,
  });
}

class CodePiece {
  int offset;
  int end;
  CodePiece(
    this.offset,
    this.end,
  );
}

class HeaderTailCell {
  final CodePiece codePiece;
  HeaderTailCell(this.codePiece);
}

/// 一个cell代表note中的一个代码块及其产生的内容
/// A cell represents a code block in a note and its generated content
class MainCell extends ChangeNotifier {
  final List<BaseNoteContent> _contents = List.empty(growable: true);
  // index use to find code
  final int index;
  final Pen pen;
  late final ObjectParam param = ObjectParam.root(editors: pen.editors);
  final CellBuilder _builder;
  MainCell({
    required this.index,
    required this.pen,
    required CellBuilder builder,
  }) : _builder = builder;

  bool isEmpty() => _contents.isEmpty;

  List<BaseNoteContent> get contents => List.unmodifiable(_contents);

  void print(Object? object) {
    call(object);
  }

  void clear() {
    _contents.clear();
  }

  void call(Object? object) {
    if (object is BaseNoteContent) {
      _add(object);
      return;
    }
    if (object is Mate) {
      _add(SampleNote(object));
      return;
    }
    if (object is Widget) {
      _add(WidgetNote(object));
      return;
    }
    _add(ObjectNote(object));
  }

  void _add(BaseNoteContent content) {
    _contents.add(content);
    notifyListeners();
  }

  String get code {
    return "code source... todo \n code.... \n code...";
  }

  /// 不包含pen相关调用的代码
  String get noPenCode {
    return "code source... todo \n code.... \n code...";
  }

  build(BuildContext context) {
    _contents.clear();
    _builder(context, this);
  }
}
