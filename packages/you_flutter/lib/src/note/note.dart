import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:source_map_stack_trace/source_map_stack_trace.dart' as source_map_stack_trace;
import 'package:path/path.dart' as path;
import 'package:source_maps/source_maps.dart' as source_map;
import 'package:you_flutter/router.dart';
import 'package:you_flutter/state.dart';
import 'package:you_flutter/src/note/note_conf.dart';
import 'package:you_flutter/src/note/conventions.dart';
import 'package:http/http.dart' as http;

typedef NoteBuilder = void Function(BuildContext context, Cell print);
typedef NoteLayoutBuilder = Widget Function(BuildContext context, NoteBuilder builder);

base class ToNote extends RouteBuilder {
  final NoteBuilder? page;
  final NoteBuilder? notFound;
  final NoteLayoutBuilder? layout;

  ToNote(super.part, {this.page, this.layout, this.notFound});

  @override
  Widget buildPage(BuildContext context, covariant ToNote forPage, RouteUri uri) {
    return layout!(context, forPage.page!);
  }

  @override
  Widget buildNotFound(BuildContext context, covariant ToNote forNotFound, RouteUri uri) {
    return layout!(context, forNotFound.notFound!);
  }

  @override
  bool get hasPage => page != null;

  @override
  bool get hasLayout => layout != null;

  @override
  bool get hasNotFound => notFound != null;
}
//
// base class ToNote extends To {
//   final NoteBuilder? _builder;
//   final NoteLayoutBuilder? _layout;
//
//   ToNote(super.part, {NoteBuilder? builder, NoteLayoutBuilder? layout, List<ToNote> children = const []})
//       : _builder = builder,
//         _layout = layout,
//         super(part,forBuild:this,children: children);
//
//   @override
//   bool get isValid => _builder != null;
//
//   @override
//   Widget build(BuildContext context, ToUri uri) {
//     if (_builder == null) {
//       // TODO not found
//       return Text("not found $uri");
//     }
//     List<ToNote> chain = [this, ...findAncestorsOfSameType<ToNote>()];
//     for (var i in chain) {
//       if (i._layout != null) return i._layout(context, _builder);
//     }
//     return NoteLayoutDefault(uri: uri, builder: _builder);
//   }
// }

@Deprecated("已被you_router取代，待删除")
class NoteRoute {
  /// A file system term,  that refers to the last part of a path
  /// example: a/b/c , c is basename
  final String basename;
  final Map<String, NoteRoute> _children = {};
  final NoteRoute? parent;
  bool expand = false;

  NoteConf? conf;

  NoteRoute.root()
      : basename = "",
        parent = null;

  void configTree({int extendLevel = 0}) {
    if (extendLevel <= 0) return;

    expand = extendLevel > 0;
    for (var e in children) {
      e.configTree(extendLevel: extendLevel - 1);
    }
  }

  List<NoteRoute> get children => List.from(_children.values);

  bool get isLeaf => _children.isEmpty;

  int get level => isRoot ? 0 : parent!.level + 1;

  int levelTo(NoteRoute parent) => level - parent.level;

  List<NoteRoute> get ancestors => isRoot ? [] : [parent!, ...parent!.ancestors];

  List<NoteRoute> get meAndAncestors => [this, ...ancestors];

  bool get isRoot => parent == null;

  NoteRoute get root => isRoot ? this : parent!.root;

  /// Note names, which can be set to human-readable names in note.json,
  /// are displayed on the navigation tree
  String get displayName => conf != null ? conf!.displayName : basename;

  String get path {
    if (isRoot) return "/";
    var parentPath = parent!.path;
    return parentPath == "/" ? "/$basename" : "$parentPath/$basename";
  }

  List<NoteRoute> toList({
    bool includeThis = true,
    bool Function(NoteRoute path)? test,
    Comparator<NoteRoute>? sortBy,
  }) {
    test = test ?? (e) => true;
    if (!test(this)) {
      return [];
    }
    List<NoteRoute> children = List.from(_children.values);
    if (sortBy != null) {
      children.sort(sortBy);
    }

    var flatChildren = children.expand((child) {
      return child.toList(includeThis: true, test: test, sortBy: sortBy);
    }).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  List<NoteRoute> topList({bool topDown = true}) {
    if (isRoot) {
      return [this];
    }
    return [...parent!.topList(), this];
  }

  // todo bug
  NoteRoute? child(String path) {
    NoteRoute? result = this;
    for (var split in path.split("/").map((e) => e.trim()).where((e) => e != "")) {
      result = result?._children[split];
      if (result == null) break;
    }
    return result;
  }

  /// 扁平化name，去掉排序用的数字前缀
  String get nameFlat {
    return basename.replaceAll(RegExp("\\d+[.]"), "") // 1.z.about -> z.about
        ;
  }

  String toStringShort() {
    return path;
  }

  @override
  String toString({bool? deep}) {
    if (deep == null || !deep) {
      return "Page($path ,kids:${_children.values.map((e) => e.toStringShort()).toList()})";
    } else {
      StringBuffer sb = StringBuffer();
      for (NoteRoute n in toList()) {
        sb.write("$n\n");
      }
      return sb.toString();
    }
  }

  bool contains(String location) {
    var c = child(location);
    return c != null;
  }

  void visit(bool Function(NoteRoute note) visitor) {
    if (!visitor(this)) {
      return;
    }
    for (var child in _children.values) {
      child.visit(visitor);
    }
  }

  String get dartAssetPath => conventions.noteDartAssetPath(path);

  String get confAssetPath => conventions.noteConfAssetPath(path);
}

class NoteSystem {
  final RouteNode root;

  NoteSystem({
    required this.root,
  });

  static Future<NoteSystem> load({
    required RouteNode root,
  }) async {
    return NoteSystem(
      root: root,
    );
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
      return NoteSystem.findCallerLine(
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
    return "$Cell(title:$title, hash:$hashCode, contents[${_children.length}]:$_children)";
  }

  List<Cell> toList() {
    return List.from(_traverse(this));
  }
}
