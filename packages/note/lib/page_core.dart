// ignore_for_file: non_constant_identifier_names

import 'package:note/navigator_v2.dart';
import 'package:flutter/material.dart';
import 'package:note/mate.dart';
import 'package:note/utils.dart';
import 'dart:convert';
import 'package:code_builder/code_builder.dart' as code;

typedef NotePageBuilder = void Function(BuildContext context, Pen pen);
typedef NoteLoader = Future<NoteConfPart> Function();
typedef NoteSourceData = ({
  List<
      ({
        String cellType,
        int end,
        int offset,
        List<
            ({
              String nodeType,
              int end,
              int offset,
            })> specialNodes,
        int statementCount
      })> cells,
  String encodedCode,
  NoteConfPart meta
});
// List<({String blockType, int end, int offset})> specialNodes

NoteSourceData _emptyPageGenInfo = (
  cells: [
    (
      cellType: CellType.header.name,
      offset: 0,
      end: 0,
      statementCount: 0,
      specialNodes: [],
    )
  ],
  encodedCode: "",
  meta: NoteConfPart.empty(),
);
NoteSource _emptyPageSource = NoteSource(pageGenInfo: _emptyPageGenInfo);

/// 可序列化的config 数据
class NoteConf {
  final String shortTitle;
  NoteConf({required this.shortTitle});
}

/// 本项目page开发模型，包括几部分：
/// - 本包：page开发模型的核心数据结构，并不参与具体UI样式表现
/// - [Layout]的具体实现，比如
/// 本package关注page模型的逻辑数据，并不参与展示页面的具体样式构造

/// <T>: [NavigatorV2.push] 的返回类型
/// todo 因此类是页面定义元数据，应该是临时格式的record对象，不应是个类
class NoteConfPart<T> {
  /// 短标题，，应提供为page内markdown一级标题的缩短版，用于导航树等（边栏宽度有限）
  final String shortTitle;
  final NoteConf conf;
  final NotePageBuilder builder;
  late final Layout? layout;
  final bool empty;

  NoteConfPart({
    required this.shortTitle,
    required this.builder,
    this.layout,
    // todo remove empty field
    this.empty = false,
  }) : conf = NoteConf(shortTitle: shortTitle);

  NoteConfPart.empty({String shortTitle = ""})
      : this(
          empty: true,
          shortTitle: shortTitle,
          builder: (context, print) {},
        );

  @override
  String toString() {
    return "PageMeta($shortTitle)";
  }
}

class Note<T> {
  final String name;
  final List<Note> _children = List.empty(growable: true);
  final Map<String, Note> _childrenMap = {};
  final Note? parent;
  bool expand = false;
  final Map<String, Object> attributes = {};
  NoteConfPart<T> _meta = NoteConfPart(
    empty: true,
    shortTitle: "",
    builder: (context, print) {},
  );

  NoteSource _source = _emptyPageSource;

  Note._child(
    this.name, {
    required Note this.parent,
  }) : _meta = NoteConfPart.empty(shortTitle: name);

  Note.root()
      : name = "",
        parent = null;

  void extendTree(bool value) {
    expand = value;
    for (var e in children) {
      e.extendTree(value);
    }
  }

  bool get isEmpty => _meta.empty;

  bool get isNotEmpty => !_meta.empty;

  List<Note> get children => List.unmodifiable(_children);

  NoteSource get source => _source;

  Note<C> put<C>(String fullPath, NoteSourceData data) {
    var p = fullPath
        .split("/")
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    var path = _ensurePath(p);

    path._meta = data.meta;
    path._source = NoteSource(pageGenInfo: data);
    return path as Note<C>;
  }

  Note _ensurePath<C>(List<String> nameList) {
    if (nameList.isEmpty) {
      return this;
    }
    String name = nameList[0];
    assert(name != "" && name != "/",
        "path:$nameList, path[0]:'$name' must not be '' and '/' ");
    var next = _childrenMap.putIfAbsent(name, () {
      var child = Note._child(name, parent: this);
      _children.add(child);
      _childrenMap[name] = child;
      return child;
    });
    return next._ensurePath(nameList.sublist(1));
  }

  /// 页面骨架
  /// 树形父子Page的页面骨架有继承性，即自己没有配置骨架，就用父Page的骨架
  Layout get layout {
    if (_meta.layout != null) {
      return _meta.layout!;
    }

    if (isRoot) {
      return <T>(Note<T> note) => _DefaultScreen<T>(
            current: note,
          );
    }
    return parent!.layout;
  }

  bool get isLeaf => _children.isEmpty;

  int get level => isRoot ? 0 : parent!.level + 1;

  int levelTo(Note parent) => this.level - parent.level;

  List<Note> get parents => this.isRoot ? [this] : [this, ...parent!.parents];

  bool get isRoot => parent == null;

  Note get root => isRoot ? this : parent!.root;

  String get shortTitle => _meta.shortTitle;

  String get path {
    if (isRoot) return "/";
    var parentPath = parent!.path;
    return parentPath == "/" ? "/$name" : "$parentPath/$name";
  }

  List<Note> toList({bool includeThis = true, bool Function(Note path)? test}) {
    test = test ?? (e) => true;
    if (!test(this)) {
      return [];
    }
    var flatChildren = _children.expand((child) {
      return child.toList(includeThis: true, test: test);
    }).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  List<Note> topList({bool topDown = true}) {
    if (isRoot) {
      return [this];
    }
    return [...parent!.topList(), this];
  }

  Note? child(String path) {
    Note? result = this;
    for (var split
        in path.split("/").map((e) => e.trim()).where((e) => e != "")) {
      result = result?._childrenMap[split];
      if (result == null) break;
    }
    return result;
  }

  Screen createScreen(String location) => layout(this);

  /// 扁平化name，去掉排序用的数字前缀
  String get nameFlat {
    return name.replaceAll(RegExp("\\d+[.]"), "") // 1.note-self -> note-self
        ;
  }

  String toStringShort() {
    return path;
  }

  @override
  String toString({bool? deep}) {
    if (deep == null || !deep) {
      return "Page($path ,kids:${_children.map((e) => e.toStringShort()).toList()})";
    } else {
      StringBuffer sb = StringBuffer();
      for (Note n in toList()) {
        sb.write("$n\n");
      }
      return sb.toString();
    }
  }
}

///
/// cell 是一段代码加上其运行后的一块界面区域，和jupyter/observablehq 中的cell概念类似，
/// 但由于我们并没有一个notebook编辑器，一个cell，一个cell的编辑运行代码，而是通过代码分析器从
/// dart代码中自动分割cell的，所以逻辑上有些许不同。
///
/// A cell is a block of code and an it's display area on page ui.
/// The concept of a cell in jupyter/Observablehq is similar,
/// but since we do not have a notebook editor, a cell is auto analyzed from Dart code,
///
/// - flutter_note 的cell在界面上是只读的
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

class Pen {
  /// 这个方法作用是代码区块隔离，方便语法分析器
  /// 这个函数会在代码显示器中擦除
  // void cell(CellBuilder builder);
  // final List<NoteCell> cells = List.empty(growable: true);
  // NoteCell _currentCell = NoteCell(index: 0);
  late final List<NoteCell> cells;
  late NoteCell currentCell;

  final Note path;
  final bool defaultCodeExpand;

  // Pen({required this.editors});
  Pen.build(
    BuildContext context,
    this.path, {
    required this.defaultCodeExpand,
  }) {
    assert(path.source._pageGenInfo.cells.isNotEmpty,
        "page cells should not be empty");

    List<NoteCell> cells = List.empty(growable: true);
    for (int i = 0; i < path.source._pageGenInfo.cells.length; i++) {
      cells.add(NoteCell(
        pen: this,
        index: i,
        pageSource: path.source,
      ));
    }
    this.cells = List.unmodifiable(cells);
    // first cell is dart head code , All code before the build() function
    currentCell = cells.first;

    // Skip the header code block
    $____________________________________________________________________();

    path._meta.builder(context, this);
  }

  /// 新增一个cell，cell代表note中的一个代码块及其产生的内容
  /// Add a new cell, which is a code block and its generated content in the note
  ///
  /// 通过[builder]参数可以重建此cell
  /// cell can be rebuilt using the [builder] arg
  void $____________________________________________________________________() {
    int nextCellIndex = currentCell.index + 1;
    // It is already the last cell
    // It is possible that the code generation has not been synchronized
    if (nextCellIndex >= cells.length) {
      return;
    }

    currentCell = cells[nextCellIndex];
  }

  /// markdown 独占一个新cell
  void markdown(String content) {
    currentCell.print(MarkdownContent(content));
  }

  void call(Object? object) {
    currentCell.print(object);
    // currentCell.print(catchStack().safeSubstring(0, 500));
  }

  /// 注意：只能在NotePage的[build]函数的最外层调用，不能放在button回调或Timer回调中
  /// 通过闭包记住currentCell的引用，以便可以在之后的回调中也可以print内容到currentCell
  void runInCurrentCell(void Function(NoteCell print) callback) {
    callback(currentCell);
  }

  // 法宝cell find
  // String catchStack() {
  //   try {
  //     throw Exception("eeeeee");
  //   } catch (es, stack) {
  //     return "$es : $stack";
  //   }
  // }
}

/// note content is not widget , it is data.
class NoteContent {}

class MarkdownContent extends NoteContent {
  final String content;

  MarkdownContent(this.content);

  @override
  String toString() {
    return "MarkdownContent('${content.replaceAll("\n", "\\n").safeSubstring(0, 50)}')";
  }
}

class ObjectContent extends NoteContent {
  final Object? object;

  ObjectContent(this.object);

  @override
  String toString() {
    return "ObjectNote('${object?.toString()}')";
  }
}

class WidgetContent extends NoteContent {
  final Widget widget;

  WidgetContent(this.widget);

  @override
  String toString() {
    return "WidgetNote('${widget.runtimeType}')";
  }
}

class MateSample extends NoteContent {
  final Mate mate;
  final bool isShowCode;
  final bool isShowParamEditor;
  final SampleTemplate codeTemplate;

  /// if true , we will return : cell code + mate gen code
  /// and we will erase MateSample call statement and Pen.runInCurrentCell statement
  // final bool isUseCellCodeAsTemplate;
  MateSample(
    this.mate, {
    this.isShowCode = true,
    this.isShowParamEditor = true,
    SampleTemplate? sampleTemplate,
  }) : codeTemplate = sampleTemplate ?? SampleTemplate.notIncludeCellCode;

  @override
  String toString() {
    return "MateSample('${mate.toString()}')";
  }

  String toSampleCode(NoteCell cell, ObjectParam param, Editors editors) {
    return codeTemplate.codeBuilder(cell, param, editors);
  }
}

typedef SampleCodeBuilder = String Function(
    NoteCell cell, ObjectParam param, Editors editors);

class SampleTemplate {
  String name;
  SampleCodeBuilder codeBuilder;
  SampleTemplate({required this.name, required this.codeBuilder});

  // ignore: prefer_function_declarations_over_variables
  static final SampleTemplate notIncludeCellCode = SampleTemplate(
      name: "notIncludeCellCode",
      codeBuilder: (cell, param, editors) {
        var emitter = editors.emitter;
        var formatter = editors.formatter;

        var mateExpression = param.toCodeExpression(editors: editors);

        var toCode = code.Block.of([
          const code.Code("""
    import 'package:flutter/material.dart';
    
    void main() {
      var sample="""),
          mateExpression.statement,
          const code.Code("""      
      runApp(MaterialApp(home: Scaffold(body: sample)));
    }
    """),
        ]);

        String result = toCode.accept(emitter).toString();
        result = formatter.format(result);
        return result;
      });
  // ignore: prefer_function_declarations_over_variables
  static final SampleTemplate includeCleanCellCode = SampleTemplate(
      name: "includeCleanCellCode",
      codeBuilder: (cell, param, editors) {
        var emitter = editors.emitter;
        var formatter = editors.formatter;

        var mateExpression = param.toCodeExpression(editors: editors);
        var toCode = code.Block.of([
          code.Code("""
    import 'package:flutter/material.dart';
    
    void main() {
      
      ${_cleanCellCode(cell, param)}
      
      var sample="""),
          mateExpression.statement,
          const code.Code("""      
      runApp(MaterialApp(home: Scaffold(body: sample)));
    }
    """),
        ]);

        String result = toCode.accept(emitter).toString();
        result = formatter.format(result);
        return result;
      });

  /// The piece of code to be erased from the cell code
  static const Set<String> _eraseCodeTypes = {
    "MateSample.new.firstParentStatement",
    "Pen.runInCurrentCell"
  };

  /// cell代码被转换后作为范例代码
  /// The cell code is transformed as sample code
  static String _cleanCellCode(NoteCell cell, ObjectParam rootParam) {
    var sources = cell.source.specialSources
        .where((e) => _eraseCodeTypes.contains(e.codeType))
        .toList();

    sources.sort((a, b) => a.codeEntity.offset.compareTo(b.codeEntity.offset));

    int offset = cell.source.codeEntity.offset;
    List<String> codes = List.empty(growable: true);
    for (var s in sources) {
      codes.add(
          cell.pen.path.source.code.safeSubstring(offset, s.codeEntity.offset));

      offset = s.codeEntity.end;
    }
    return codes.join(" ");
  }
}

// markdown 的结构轮廓，主要用来显示TOC
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

typedef Layout = Screen Function(Note page);

/// 在页面树上找不到任何Layout时套用这个缺省的
class _DefaultScreen<T> extends StatelessWidget with Screen<T> {
  final Note<T> current;

  _DefaultScreen({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("_DefaultScreen")),
      body: SingleChildScrollView(
        child: Center(
          child: Text(
            "WARN：当前Path上未配置任何Layout: ${current.path}",
            style: theme.textTheme.titleLarge
                ?.copyWith(color: theme.colorScheme.error),
          ),
        ),
      ),
    );
  }

  @override
  String get location => current.path;
}

class NoteSource {
  late final String code;
  final NoteSourceData _pageGenInfo;
  NoteSource({required NoteSourceData pageGenInfo})
      : _pageGenInfo = pageGenInfo {
    var decoded = base64.decode(pageGenInfo.encodedCode);
    code = utf8.decode(decoded);
  }

  String _getCellCode(CodeEntity codeEntity) {
    if (codeEntity.end > code.length) {
      return "// ${codeEntity.offset}:(${codeEntity.end}) >= code.length(${code.length})  ";
    }
    return code.safeSubstring(codeEntity.offset, codeEntity.end);
  }
}

/// CodeEntity is same as analyzer [SyntacticEntity]
class CodeEntity {
  final int offset;
  final int end;
  CodeEntity({required this.offset, required this.end});

  int get length => end - offset;

  @override
  String toString() {
    return "CodeEntity(offset:$offset, end:$end, length:$length )";
  }
}

class CellSource {
  final int index;
  final CellType cellType;
  final CodeEntity codeEntity;
  final int statementCount;
  final NoteSource _pageSource;
  List<SpecialSource> specialSources;

  CellSource({
    required this.cellType,
    required this.codeEntity,
    required this.specialSources,
    required this.statementCount,
    required NoteCell cell,
  })  : index = cell.index,
        _pageSource = cell.pen.path._source {}

  String get code {
    return _pageSource._getCellCode(codeEntity);
  }

  bool get isCodeEmpty {
    return code.contains(RegExp(r'^\s*$'));
  }

  bool get isCodeNotEmpty {
    return !isCodeEmpty;
  }

  @override
  String toString() {
    return "CellSource(index:$index, block:$codeEntity, statementCount:$statementCount )";
  }
}

class SpecialSource {
  String codeType;
  final CodeEntity codeEntity;
  final NoteCell cell;
  final NoteSource pageSource;
  SpecialSource({
    required this.codeType,
    required this.codeEntity,
    required this.cell,
  }) : pageSource = cell.pen.path.source;

  String get code {
    return pageSource._getCellCode(codeEntity);
  }

  @override
  String toString() {
    return "SpecialSource(codeType:$codeType,codeEntity:$codeEntity,)";
  }
}

enum CellType {
  header,
  body,
  tail;

  static CellType parse(String name) {
    for (CellType t in CellType.values) {
      if (t.name == name) return t;
    }
    throw Exception("CellType.name:$name not exist");
  }
}

/// todo cell内函数太乱，待整理重构
/// 一个cell代表note中的一个代码块及其产生的内容
/// A cell represents a code block in a note and its generated content
class NoteCell extends ChangeNotifier {
  final List<NoteContent> _contents = List.empty(growable: true);

  // index use to find code
  final int index;
  final Pen pen;
  late final CellSource source;

  NoteCell({
    required this.pen,
    required this.index,
    required NoteSource pageSource,
  }) {
    var codeCell = pageSource._pageGenInfo.cells[index];
    source = CellSource(
      codeEntity: CodeEntity(offset: codeCell.offset, end: codeCell.end),
      statementCount: codeCell.statementCount,
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

  List<NoteContent> get contents => List.unmodifiable(_contents);

  get name {
    return "cell[$index]";
  }

  bool isContentEmpty() => contents.isEmpty;

  void print(Object? object) {
    call(object);
  }

  void clear() {
    _contents.clear();
  }

  void markdown(String content) {
    call(MarkdownContent(content));
  }

  bool get isAllMarkdownContent {
    if (_contents.isEmpty) return false;
    return _contents.every((e) => e is MarkdownContent);
  }

  void call(Object? object) {
    if (object is NoteContent) {
      _add(object);
      return;
    }
    if (object is Mate) {
      _add(MateSample(object));
      return;
    }
    if (object is Widget) {
      _add(WidgetContent(object));
      return;
    }
    _add(ObjectContent(object));
  }

  void _add(NoteContent content) {
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
        CellType.body => pen.defaultCodeExpand && !isAllMarkdownContent,
        _ => false,
      };
    }
    return _codeExpand ?? pen.defaultCodeExpand;
  }

  set codeExpand(bool newValue) {
    _codeExpand = newValue;
    notifyListeners();
  }

  @override
  String toString() {
    return "$name(hash:$hashCode,isMarkdownCell:$isAllMarkdownContent, isEmptyCode:$source.isCodeEmpty contents-${contents.length}:$contents)";
  }
}

extension NoteSampleExt on Object {
  static final _code = Expando<code.Expression>();
  //todo 收缩sampleCode和sampleCodeStr为一个属性
  code.Expression? get sampleCode => _code[this];
  set sampleCode(code.Expression? v) => _code[this] = v;
  set sampleCodeStr(String? v) =>
      _code[this] = v == null ? null : code.CodeExpression(code.Code(v));
}
