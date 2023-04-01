import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:note/mate.dart';
import 'package:note/navigator_v2.dart';
import 'package:note/page_core.dart';
import 'package:note/pen_markdown.dart';
import 'package:note/src/flutter_highlight.dart';

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
  late final _PagePen pen;
  final ScrollController controller = ScrollController(initialScrollOffset: 0);

  _PageScreenState();

  @override
  void initState() {
    super.initState();

    pen = _PagePen(editors: widget.editors);

    //内容outline只build一次
    widget.current.build(pen, context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 第一次[build]时, flutter-mardown包无法装配出outline，只有第一次[build]完，才能装配好，
      // 所以需要触发第二次build
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var navigatorTree = _NoteTreeView(widget.tree ?? widget.current.root);

    var outlineView = _OutlineView(contentPartController: controller, outline: pen.outline);

    // 总是偶发的报错: The Scrollbar's ScrollController has no ScrollPosition attached.
    // 参考：https://stackoverflow.com/questions/69853729/flutter-the-scrollbars-scrollcontroller-has-no-scrollposition-attached/71490688#71490688
    // 暂时用Scrollbar试试，但不知其所以然，还是对其布局机制不太熟悉：
    var contentListView = ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      controller: controller,
      children: pen._contents,
    );
    final scrollBehavior = const ScrollBehavior().buildScrollbar(context, contentListView,
        ScrollableDetails(direction: AxisDirection.down, controller: controller));

    var row = Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(width: 220, child: navigatorTree),
        Expanded(child: scrollBehavior),
        SizedBox(width: 200, child: outlineView),
      ],
    );
    var container = Container(
      child: row,
    );
    var safeArea = SafeArea(
      child: container,
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
    // 初始化 所有parent为展开状态
    for (var parent in root.parents) {
      parent.extend = true;
    }
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
    return Column(children: notes.map((e) => newLink(e)).toList());
  }
}

// 在Note上扩展出UI相关的字段，比如目录树的点开状态`extend`
extension _TreeViewNote on Path {
  static const _extendAttrName = "note.layout._TreeViewNote.extend";

  //展开状态
  bool get extend {
    if (isLeaf) {
      return false;
    }
    Object? result = attributes[_extendAttrName];
    return result == null ? false : result as bool;
  }

  set extend(bool extend) {
    if (isLeaf) {
      return;
    }
    attributes[_extendAttrName] = extend;
  }
}

class _OutlineView extends StatelessWidget {
  final Outline outline;

  // 主内容部分的滚动控制，防止异常用
  final ScrollController contentPartController;

  const _OutlineView({required this.outline, required this.contentPartController});

  @override
  Widget build(BuildContext context) {
    // 一页一个链接
    Widget headLink(OutlineNode node) {
      var link2 = TextButton(
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
          if (contentPartController.hasClients) {
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
    return Container(
      // width: 300.0,
      color: Colors.blue.shade50,
      child: Column(
        children: [
          ...nodes.map((e) => headLink(e)).toList(),
        ],
      ),
    );
  }
}

class _PagePen extends Pen {
  int i = 0;

  final Editors editors;

  _PagePen({required this.editors});

  Outline outline = Outline();
  final List<Widget> _contents = List.empty(growable: true);

  List<Content> get contents => List.unmodifiable(_contents);

  @override
  void markdown(String content) {
    _contents.add(MarkdownContent(
      key: ValueKey(i++),
      outline: outline,
      content: content,
    ));
  }

  @override
  void widget(Widget Function(ObjectParam node) builder) {
    // ObjectParam node = ObjectParam(init: null, builder: (p) => builder(p));
    // sampleMate(builder(node));
  }

  @override
  void sampleFile(Widget sample) {
    _contents.add(ConstrainedBox(
      key: ValueKey(i++),
      constraints: const BoxConstraints.tightFor(width: 200, height: 200),
      child: sample,
    ));
  }

  @override
  void sampleMate<T extends Mate>(T widgetMate) {
    _contents.add(_MateSample(
      rootParam: ObjectParam.rootFrom(widgetMate),
      editors: editors,
    ));
  }
}

class _MateSample extends StatelessWidget {
  final ObjectParam rootParam;
  final Editors editors;

  // ignore: unused_element
  const _MateSample({
    // ignore: unused_element
    super.key,
    required this.rootParam,
    required this.editors,
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

  // ignore: unused_element
  const _ParamAndCodeView({super.key, required this.rootParam, required this.editors});

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
      title: const Row(children: [Text("显示代码")]),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: paramView),
            Expanded(child: codeView),
          ],
        )
      ],
    );
  }
}
