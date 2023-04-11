import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/atelier-forest-light.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:note/mate.dart';
import 'package:note/navigator_v2.dart';
import 'package:note/page_core.dart';
import 'package:note/pen_markdown.dart';
import 'package:note/src/flutter_highlight.dart';

import 'notebook.dart';

class PageScreen<T> extends StatefulWidget with Screen<T> {
  final Path<T> current;
  final Path? tree;

  final Editors editors;

  PageScreen({
    super.key,
    this.tree,
    required this.current,
    required this.editors,
  });

  @override
  String get location => current.path;

  @override
  State<StatefulWidget> createState() {
    return _PageScreenState<T>();
  }
}

class _PageScreenState<T> extends State<PageScreen<T>> {
  late final PenImpl pen;
  final ScrollController controllerV = ScrollController(initialScrollOffset: 0);

  _PageScreenState();

  @override
  void initState() {
    super.initState();

    pen = PenImpl(editors: widget.editors);

    //内容outline只build一次
    widget.current.build(pen, context);
    pen.block_______________();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 第一次[build]时, flutter-mardown包无法装配出outline，只有第一次[build]完，才能装配好，
      // 所以需要触发第二次build
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var navigatorTree = _NoteTreeView(widget.tree ?? widget.current.root);

    var outlineView = _OutlineView(mainContentViewController: controllerV, outline: pen.outline);

    // 总是偶发的报错: The Scrollbar's ScrollController has no ScrollPosition attached.
    // 参考：https://stackoverflow.com/questions/69853729/flutter-the-scrollbars-scrollcontroller-has-no-scrollposition-attached/71490688#71490688
    // 暂时用Scrollbar试试，但不知其所以然，还是对其布局机制不太熟悉：
    // var contentListView = ListView(
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   controller: controller,
    //   children: [
    //     ...pen._contents,
    //     //page下留白，避免被os工具栏遮挡
    //     const SizedBox(height: 200),
    //   ],
    // );
    // 20230404 chen56
    // why use SingleChildScrollView+ListBody replace ListView ：
    // ListView is lazy load, so page not complete, then outline load not complete.

    var scrollV = SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: controllerV,
      child: ListBody(
        children: [
          ...pen.blocks.map((e) => _NoteBlockView(e)),
          //page下留白，避免被os工具栏遮挡
          const SizedBox(height: 300),
        ],
      ),
    );

    var row = Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(width: 220, child: navigatorTree),
        Expanded(child: scrollV),
        SizedBox(width: 250, child: outlineView),
      ],
    );
    var safeArea = SafeArea(
      child: row,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.current.title),
        toolbarHeight: 36,
      ),
      body: safeArea,
    );
  }

  @override
  void didUpdateWidget(covariant PageScreen<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void activate() {
    super.activate();
  }
}

class _NoteTreeView extends StatefulWidget {
  final Path root;

  _NoteTreeView(
    this.root, {
    Key? key,
  }) : super(key: key) {
    // 当前文档较少，先都展开
    root.extendAll(true);
  }

  @override
  State<_NoteTreeView> createState() => _NoteTreeViewState();
}

class _NoteTreeViewState extends State<_NoteTreeView> {
  _NoteTreeViewState();

  @override
  Widget build(BuildContext context) {
    // 一页一个链接
    Widget newLink(Path node) {
      click() {
        NavigatorV2.of(context).push(node.path);
      }

      String iconExtend = node.isLeaf
          ? "     "
          : node.extend
              ? "▽  "
              : "▷︎  ";
      String icon = "🗓";
      // 📁📂📄🗓📜▸▾▹▿ ▶︎▷▼▽►
      // title 被Flexible包裹后，文本太长会自动换行
      // 换行后左边图标需要CrossAxisAlignment.start 排在文本的第一行
      // children: [Flexible(child: Text("$icon ${node.title}"))],
      // 但是Flexible要上面套一个Flex的子类
      var link = TextButton(
        onPressed: node.hasPage ? click : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => setState(() => node.extend = !node.extend),
              child: Text(iconExtend),
            ),
            Text(icon),
            Flexible(child: Text(node.title)),
          ],
        ),
      );

      // TextButton link = TextButton(onPressed: (){}, child: Text(node.title));
      return Padding(
        // 缩进模仿树形
        padding: EdgeInsets.only(left: 20 * (node.levelTo(widget.root) - 1).toDouble()),
        child: link,
      );
    }

    // var notes = widget.root.toListWithExtend(includeThis: false, hiddenNoExpend: true);
    var notes = widget.root.toList(
      includeThis: false,
      test: (e) => e.isRoot ? true : e.parent!.extend,
    );
    var column = Column(children: notes.map((e) => newLink(e)).toList());
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: column,
    );
  }
}

// 在Note上扩展出UI相关的字段，比如目录树的点开状态`extend`
extension _PathExt on Path {
  static const _extendAttrName = "note/page_layout/extend";

  //展开状态
  bool get extend {
    if (isLeaf) {
      return false;
    }
    Object? result = attributes[_extendAttrName];
    return result == null ? true : result as bool;
  }

  set extend(bool extend) {
    if (isLeaf) {
      return;
    }
    attributes[_extendAttrName] = extend;
  }

  void extendAll(bool extend) {
    extend = extend;
    children.forEach((e) {
      e.extendAll(extend);
    });
  }
}

class _OutlineView extends StatelessWidget {
  final Outline outline;

  // 主内容部分的滚动控制，点击outline触发主屏滚动到指定标题
  final ScrollController mainContentViewController;

  const _OutlineView({required this.outline, required this.mainContentViewController});

  @override
  Widget build(BuildContext context) {
    // 一页一个链接
    Widget headLink(OutlineNode node) {
      var link2 = TextButton(
        style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(2))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Icon(
            //   Icons.arrow_right,
            // ),
            // title 被Flexible包裹后，文本太长会自动换行▽
            // 换行后左边图标需要CrossAxisAlignment.start 排在文本的第一行
            //📜📁📂📄🗓📜 ▸▾▹▿▶︎▷▼▽►🔘◽️▫️◻️◼️⬛️🔹⚉
            Flexible(child: Text("◻ ${node.title}")),
          ],
        ),
        onPressed: () {
          // 防止异常
          if (mainContentViewController.hasClients) {
            Scrollable.ensureVisible(node.key.currentContext!);
          }
        },
      );
      // TextButton link = TextButton(onPressed: (){}, child: Text(node.title));
      return Padding(
        // 缩进模仿树形
        padding: EdgeInsets.only(left: 20 * (node.level - 1).toDouble()),
        child: link2,
      );
    }

    var nodes = outline.root.toList(includeThis: false);

    var column = Column(
      children: [
        ...nodes.map((e) => headLink(e)).toList(),
      ],
    );
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: column,
    );
  }
}

class PenImpl extends Pen {
  int _blockIndex = 0;
  int _key = 0;

  final Editors editors;
  final Outline outline = Outline();

  final List<ContentBlock> blocks = List.empty(growable: true);
  ContentBlock _currentBlock = ContentBlock(index: 0);

  PenImpl({required this.editors});

  @override
  void markdown(String content) {
    _add(MarkdownContent(
      key: ValueKey(_key++),
      outline: outline,
      content: content,
    ));
  }

  @override
  void widget(Widget Function(ObjectParam node) builder) {
    _add(builder(ObjectParam.root(editors: editors)));
  }

  @override
  void sampleFile(Widget sample) {
    _add(ConstrainedBox(
      key: ValueKey(_key++),
      constraints: const BoxConstraints.tightFor(width: 200, height: 200),
      child: sample,
    ));
  }

  @override
  void sampleMate(
    Mate widgetMate, {
    String title = "展开代码&编辑器",
    bool isShowCode = true,
    bool isShowParamEditor = true,
  }) {
    _add(_MateSample(
      rootParam: widgetMate.toRootParam(editors: editors),
      editors: editors,
      isShowCode: isShowCode,
      isShowParamEditor: isShowParamEditor,
      title: title,
    ));
  }

  @override
  void sampleBlock(
    Widget Function(ObjectParam param) builder, {
    String title = "展开代码&编辑器",
    bool isShowCode = true,
    bool isShowParamEditor = true,
  }) {
    ObjectParam rootParam = ObjectParam.root(editors: editors, builder: (param) => builder(param));
    _add(_MateSample(
      rootParam: rootParam,
      editors: editors,
      isShowCode: isShowCode,
      isShowParamEditor: isShowParamEditor,
      title: title,
    ));
  }

  void _add(Widget content) {
    _currentBlock.add(content);
  }

  /// 创建一个代码区块
  /// create a new code block
  /// 只能用最外层语句调用此函数
  /// This function can only be called with the outermost statement
  /// example:
  /// build(Pen pen){
  ///   pen.block_______________();  // is ok
  ///   {
  ///      pen.block_______________();  // is not ok
  ///   }
  /// }
  /// 如果[block]参数为null, 则在代码视图中隐藏此行
  /// if block arg is null, then hidden this statement in codeView:
  ///     -> pen.block_______________();  //hidden this line
  @override
  // ignore: non_constant_identifier_names
  void block_______________([void Function()? block]) {
    _blockIndex++;
    blocks.add(_currentBlock);
    _currentBlock = ContentBlock(
      index: _blockIndex,
      block: block,
    );
    if (block != null) block();
  }

  @override
  void print(Object? o) {
    _add(Text("print:$o"));
  }
}

class _MateSample extends StatelessWidget {
  final ObjectParam rootParam;
  final Editors editors;
  final bool isShowCode;
  final bool isShowParamEditor;
  final String title;
  const _MateSample({
    // ignore: unused_element
    super.key,
    required this.rootParam,
    required this.editors,
    required this.isShowCode,
    required this.isShowParamEditor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListenableBuilder(
        listenable: rootParam,
        builder: (context, _) {
          var renderView = rootParam.build() as Widget;
          var paramAndCodeView = _ParamAndCodeView(
            rootParam: rootParam,
            editors: editors,
            isShowCode: isShowCode,
            isShowEidtors: isShowParamEditor,
            title: title,
          );
          return Column(
            children: [
              paramAndCodeView,
              renderView,
            ],
          );
        },
      ),
    );
  }
}

class _ParamAndCodeView extends StatelessWidget {
  final ObjectParam rootParam;
  final Editors editors;
  final bool isShowCode;
  final bool isShowEidtors;
  final String title;

  const _ParamAndCodeView({
    // ignore: unused_element
    super.key,
    required this.rootParam,
    required this.editors,
    required this.isShowCode,
    required this.isShowEidtors,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Widget paramRow(Param param) {
      var nameWidget = Container(
        padding: EdgeInsets.only(left: param.level * 15),
        child: param.nameWidget(context, editors),
      );

      var row = TextButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: nameWidget),
            Flexible(child: param.valueWidget(context, editors)),
          ],
        ),
        onPressed: () {},
      );
      // TextButton link = TextButton(onPressed: (){}, child: Text(node.title));
      return Padding(
        // 缩进模仿树形
        padding: EdgeInsets.only(left: 2 * (param.level).toDouble()),
        child: Container(
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
          height: 25,
          child: row,
        ),
      );
    }

    var paramView = Column(
      children: [
        ...rootParam
            // hide null value
            .flat(test: (param) => param.isShow)
            .map(paramRow)
      ],
    );
    var codeView = HighlightView(
      // The original code to be highlighted
      rootParam.toSampleCodeString(snippet: false, format: true),

      // Specify language
      // It is recommended to give it a value for performance
      language: 'dart',

      // Specify highlight theme
      // All available themes are listed in `themes` folder
      theme: vs2015Theme,

      // Specify padding
      padding: const EdgeInsets.all(6),

      // Specify text style
    );
    return ExpansionTile(
      initiallyExpanded: false,
      expandedAlignment: Alignment.topLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: Row(children: [Text(title)]),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isShowEidtors) Expanded(child: paramView),
            if (isShowCode) Expanded(child: codeView),
          ],
        )
      ],
    );
  }
}

class _NoteBlockView extends StatelessWidget {
  final ContentBlock block;
  final ValueNotifier isShowCode = ValueNotifier(true);
  _NoteBlockView(
    this.block, {
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var codeView = HighlightView(
      // The original code to be highlighted
      "code source... todo \n code.... \n code...",

      // Specify language
      // It is recommended to give it a value for performance
      language: 'dart',

      // Specify highlight theme
      // All available themes are listed in `themes` folder
      theme: atelierForestLightTheme,

      // Specify padding
      padding: const EdgeInsets.all(6),

      // Specify text style
    );

    // We use Padding to avoid complex nested Columns/Rows:
    // code | codeView
    // bar  | -------------------
    // view | contentView
    const double leftOfBar = 20;

    var leftBar = const Icon(size: leftOfBar, Icons.code);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (isShowCode.value)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leftBar,
            Expanded(child: codeView),
          ],
        ),
      ...block.contents.map((e) => Container(
            padding: const EdgeInsets.only(left: leftOfBar),
            child: e,
          )),
      const SizedBox(height: 10),
    ]);
  }
}
