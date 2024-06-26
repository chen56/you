import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:meta/meta_meta.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/src/note/contents/contents.dart';
import 'package:you_flutter/src/router.dart';
import 'package:you_flutter/state.dart';

typedef NoteBuilder = void Function(BuildContext context, Cell print);
typedef NoteLayoutBuilder = NoteMixin Function(BuildContext context, NoteMixin child);

/// annotation to Note  [build] function
@Target({
  TargetKind.function,
})
class NoteAnnotation extends PageAnnotation {
  const NoteAnnotation({required this.label, this.publish = false})
      : super(
          toType: ToNote,
        );

  /// 每个节点单独设置，子节点不继承
  final String label;

  /// 每个节点单独设置，子节点不继承
  final bool publish;
}

mixin NoteMixin on StatelessWidget {
  Cell get cell;
}

base class ToNote extends To {
  ToNote(
    super.part, {
    NoteBuilder? page,
    NoteAnnotation? pageAnno,
    NoteBuilder? notFound,
    NoteLayoutBuilder? layout,
    List<ToNote> children = const [],
  }) : super(
          page: page == null ? null : (context) => _build(context, page),
          pageAnno: pageAnno,
          notFound: notFound == null ? null : (context) => _build(context, notFound),
          layout: layout == null ? null : (context, child) => layout(context, child as NoteMixin),
          children: children,
        );

  static NoteMixin _build(BuildContext context, NoteBuilder page) {
    Cell cell = Cell.empty();
    page.call(context, cell);
    return _DefaultNote(cell: cell);
  }

  @override
  List<ToNote> get children => super.children.cast<ToNote>();

  @override
  NoteAnnotation? get pageAnno => super.pageAnno == null ? null : super.pageAnno as NoteAnnotation;

  @nonVirtual
  bool get isPublish => pageAnno == null ? false : pageAnno!.publish;

  @override
  @nonVirtual
  String get label => pageAnno == null ? part : pageAnno!.label;

  @nonVirtual
  bool containsPublishNode({bool includeThis = true}) {
    if (includeThis) {
      if (isPublish) return true;
    }
    for (var c in children) {
      if (c.containsPublishNode()) return true;
    }
    return false;
  }
}

/// 极简的笔记缺省布局，当[ToNote]链上没有配置任何[ToNote.layout]时，
/// 此Widget作为page传递到更高层的 [To.layout]
/// 应用程序应该提供自己的layout,重新解析cell并覆盖之
final class _DefaultNote extends StatelessWidget with NoteMixin {
  @override
  final Cell cell;

  const _DefaultNote({required this.cell});

  @override
  Widget build(BuildContext context) {
    return Watch(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cell.toList().expand((cell) sync* {
          for (var content in cell.contents) {
            yield contents.contentToWidget(content);
          }
        }).toList(),
      );
    });
  }
}

base class Cell {
  Cell(
    Function(Cell print) callback, {
    this.title,
  }) {
    callback(this);
  }

  Cell.empty({this.title});

  final Object? title;
  final List<Object?> _contents = [].signal();

  /// open data,can crud
  final List<Cell> _children = <Cell>[].signal();

  @nonVirtual
  List<Object?> get contents => List.unmodifiable(_contents);

  List<Cell> get children => List.unmodifiable(_children);

  void call(Object? content) {
    _contents.add(content);
  }

  Cell addCell({Object? title}) {
    return addCellWith(Cell.empty(title: title));
  }

  /// 可以传入自定义Cell
  Cell addCellWith(Cell cell) {
    _children.add(cell);
    return cell;
  }

  @nonVirtual
  bool isCellsEmpty() => _children.isEmpty;

  @nonVirtual
  bool isContentsEmpty() => _contents.isEmpty;

  /// 注意：只能在NotePage的[_build]函数的最外层调用，不能放在button回调或Timer回调中
  /// 通过闭包记住currentCell的引用，以便可以在之后的回调中也可以print内容到currentCell
  @experimental
  @nonVirtual
  void runInCurrentCell(void Function(Cell print) callback, {Widget? title}) {
    callback(this);
  }

  static Iterable<Cell> _traverse(Cell node) sync* {
    yield node;
    for (var cell in node._children) {
      yield* _traverse(cell);
    }
  }

  @override
  String toString() {
    return "$Cell(title:$title, hash:$hashCode, contents[${_contents.length}]:$_contents)";
  }

  List<Cell> toList() {
    return List.from(_traverse(this));
  }
}
