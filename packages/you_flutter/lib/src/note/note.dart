import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:meta/meta_meta.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:source_map_stack_trace/source_map_stack_trace.dart' as source_map_stack_trace;
import 'package:path/path.dart' as path;
import 'package:source_maps/source_maps.dart' as source_map;
import 'package:you_flutter/router.dart';
import 'package:you_flutter/src/note/contents/contents.dart';
import 'package:you_flutter/src/router.dart';
import 'package:you_flutter/state.dart';
import 'package:http/http.dart' as http;

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

/// 一个极简的笔记缺省布局，应自己提供layout覆盖
final class _DefaultNote extends StatelessWidget with NoteMixin {
  @override
  final Cell cell;

  const _DefaultNote({required this.cell});

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
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

  @internal
  Future<({Trace dartTrace, Frame? callerFrame})> caller() {
    try {
      throw Exception("track caller line");
    } catch (e, trace) {
      return _findCallerLine(
        trace: trace,
        location: Uri.base,
        jsSourceMapLoader: (uri) async => (await http.get(uri)).body,
      );
    }
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

  static Future<({Trace dartTrace, Frame? callerFrame})> _findCallerLine({
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
}
