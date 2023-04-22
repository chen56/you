import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/atelier-forest-light.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:note/mate.dart';
import 'package:note/navigator_v2.dart';
import 'package:note/page_core.dart';
import 'package:note/pen_markdown.dart';
import 'package:note/src/flutter_highlight.dart';

import 'sys.dart';

/// 分割块，在cell间分割留白
const Widget _cellSplitBlock = SizedBox(height: 18);

class LayoutScreen<T> extends StatefulWidget with Screen<T> {
  final Path<T> current;
  final Path? tree;
  final bool defaultCodeExpand;
  final Editors editors;

  LayoutScreen({
    super.key,
    this.tree,
    required this.current,
    required this.editors,
    this.defaultCodeExpand = false,
  });

  @override
  String get location => current.path;

  @override
  State<StatefulWidget> createState() {
    return _LayoutScreenState<T>();
  }
}

class _LayoutScreenState<T> extends State<LayoutScreen<T>> {
  final ScrollController controllerV = ScrollController(initialScrollOffset: 0);
  final Outline outline = Outline();
  _LayoutScreenState();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // to do
      // flutter-markdown只有在Widget.build时才parse markdown，导致第一次[build]时,
      // 装配的outline无法展示出来， 所以需要触发第二次build,以使其展示出来
      // 暂时没想好最终处理办法，暂时这样。
      setState(() {
        outline.collectDone();
      });
    });
  }

  ({List<Widget> cells, Outline outline}) buildNote(BuildContext context) {
    _NoteCellView newCellView(NoteCell cell) => _NoteCellView(
          cell,
          outline: outline,
          editors: widget.editors,
        );

    Pen pen = Pen.build(
      context,
      widget.current,
      defaultCodeExpand: widget.defaultCodeExpand,
    );
    return (
      cells: pen.cells.map((cell) => newCellView(cell)).toList(),
      outline: outline,
    );
  }

  @override
  Widget build(BuildContext context) {
    var noteResult = buildNote(context);

    var navigatorTree = _NoteTreeView(widget.tree ?? widget.current.root);

    var outlineView = _OutlineView(
      mainContentViewController: controllerV,
      outline: noteResult.outline,
    );

    // 总是偶发的报错: The Scrollbar's ScrollController has no ScrollPosition attached.
    // 参考：https://stackoverflow.com/questions/69853729/flutter-the-scrollbars-scrollcontroller-has-no-scrollposition-attached/71490688#71490688
    // 暂时用Scrollbar试试，但不知其所以然，还是对其布局机制不太懂啊：
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
          ...noteResult.cells,
          //page下留白，避免被os工具栏遮挡
          const SizedBox(height: 300),
        ],
      ),
    );
    var appBar = AppBar(
      title: Text(widget.current.shortTitle),
      toolbarHeight: 36,
    );

    ///  Responsive UI:
    ///  Since StatefulWidget will automatically build() when the screen size changes,
    ///  the processing of responsive UI does not require special processing,
    ///  such as ListenableBuilder
    var w = WindowClass.fromContext(context);
    if (w == WindowClass.compact) {
      return Scaffold(
        drawer: Drawer(child: navigatorTree),
        endDrawer: Drawer(child: outlineView),
        appBar: appBar,
        body: scrollV,
      );
    }

    if (w == WindowClass.medium) {
      return Scaffold(
        drawer: Drawer(child: navigatorTree),
        appBar: appBar,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: scrollV),
              SizedBox(width: 250, child: outlineView),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: 220, child: navigatorTree),
            Expanded(child: scrollV),
            SizedBox(width: 250, child: outlineView),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant LayoutScreen<T> oldWidget) {
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
        onPressed: node.isNotEmpty ? click : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => setState(() => node.extend = !node.extend),
              child: Text(iconExtend),
            ),
            Text(icon),
            Flexible(child: Text(node.shortTitle)),
          ],
        ),
      );

      // TextButton link = TextButton(onPressed: (){}, child: Text(node.title));
      return Padding(
        // 缩进模仿树形
        padding: EdgeInsets.only(
            left: 20 * (node.levelTo(widget.root) - 1).toDouble()),
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

  const _OutlineView(
      {required this.outline, required this.mainContentViewController});

  @override
  Widget build(BuildContext context) {
    // 一页一个链接
    Widget headLink(OutlineNode node) {
      var link2 = TextButton(
        style: ButtonStyle(
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(2))),
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

class _MateSampleWidget extends StatelessWidget {
  final ObjectParam rootParam;
  final Editors editors;
  final String title;
  final MateSampleContent content;
  const _MateSampleWidget({
    // ignore: unused_element
    super.key,
    required this.rootParam,
    required this.editors,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    var paramAndCodeView = _ParamAndCodeView(
      rootParam: rootParam,
      editors: editors,
      content: content,
      title: title,
    );

    return Card(
      elevation: 5,
      child: ListenableBuilder(
        listenable: rootParam,
        builder: (context, _) {
          var renderView = rootParam.build() as Widget;
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
  final String title;
  final MateSampleContent content;

  const _ParamAndCodeView({
    // ignore: unused_element
    super.key,
    required this.rootParam,
    required this.editors,
    required this.title,
    required this.content,
  });

  Widget responsiveUI({
    required BuildContext context,
    required Widget paramView,
    required Widget codeView,
  }) {
    WindowClass win = WindowClass.fromContext(context);

    // screen large enough
    if (win == WindowClass.expanded) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (content.isShowCode) Expanded(child: codeView),
          if (content.isShowParamEditor) Expanded(child: paramView),
        ],
      );
    }

    // screen large not enough
    var codeViewFillWidth = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(width: constraints.maxWidth, child: codeView);
      },
    );
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (content.isShowCode) codeViewFillWidth,
        if (content.isShowParamEditor) paramView,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget paramRow(Param param) {
      var nameWidget = Container(
        padding: EdgeInsets.only(left: param.level * 15),
        child: param.nameWidget(context, editors),
      );

      var row = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 40, child: nameWidget),
          // Flexible(child: param.valueWidget(context, editors)),
          Expanded(flex: 60, child: param.valueWidget(context, editors)),
        ],
      );
      // TextButton link = TextButton(onPressed: (){}, child: Text(node.title));
      // ignore: unused_local_variable
      var padding = Padding(
        // 缩进模仿树形
        padding: EdgeInsets.only(left: 2 * (param.level).toDouble()),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          height: 30,
          child: row,
        ),
      );

      return padding;
    }

    // codeView do not listen param changed, because we want keep Input widget
    var paramView = Column(
      children: [
        ...rootParam
            // hide null value
            .flat(test: (param) => param.isShow)
            .map(paramRow)
      ],
    );

    // codeView listen param changed
    var codeView = ListenableBuilder(
      listenable: rootParam,
      builder: (context, _) {
        return HighlightView(
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
        );
      },
    );
    return ExpansionTile(
      initiallyExpanded: false,
      expandedAlignment: Alignment.topLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: Row(children: [Text(title)]),
      children: [
        responsiveUI(
            context: context, codeView: codeView, paramView: paramView),
      ],
    );
  }
}

///
/// code | codeView
/// bar  | -------------------
/// view | contentView
class _NoteCellView extends StatelessWidget {
  final NoteCell cell;
  final Outline outline;
  final Editors editors;
  _NoteCellView(
    this.cell, {
    // ignore: unused_element
    super.key,
    required this.outline,
    required this.editors,
  });

  Widget contentToWidget(BuildContext context, NoteContent e) {
    if (e is MarkdownContent) {
      return MarkdownContentWidget(outline: outline, content: e.content);
    }
    if (e is WidgetContent) {
      return e.widget;
    }
    if (e is MateSampleContent) {
      return _MateSampleWidget(
        content: e,
        rootParam: e.mate.toRootParam(editors: editors),
        editors: editors,
        title: "展开代码(手机上暂时无法编辑文本、数字参数)",
      );
    }

    if (e is ObjectContent) {
      return Text("${e.object}");
    }

    throw UnimplementedError("NoteContent not implemented : $e");
  }

  @override
  Widget build(BuildContext context) {
    var codeHighlightView = HighlightView(
      // The original code to be highlighted
      cell.code.sourceCode,

      // Specify language
      // It is recommended to give it a value for performance
      language: 'dart',

      // Specify highlight theme
      // All available themes are listed in `themes` folder
      theme: atelierForestLightTheme,

      // Specify padding
      padding: const EdgeInsets.all(0),

      // Specify text style
    );

    var cellView = ListenableBuilder(
      listenable: cell,
      builder: (context, child) {
        Iterable<Widget> contentWidgets =
            cell.contents.map((e) => contentToWidget(context, e));
        // GetSizeBuilder: 总高度和cell的code及其展示相关，leftBar在第一次build时无法占满总高度，
        // 所以用GetSizeBuilder来重新获得codeView的高度并适配之
        resizeBuilder(BuildContext context, Size size, Widget? child) {
          // if (size.width < 20 || size.height < 20) {
          //   size = Size(20, 20);
          // }

          var barText = cell.code.isCodeEmpty
              ? "  "
              : cell.codeExpand
                  ? "${cell.index}▽"
                  : "${cell.index}▷";
          var leftBar = Material(
            child: InkWell(
              onTap: () {
                cell.codeExpand = !cell.codeExpand;
              },
              child: Container(
                height: size.height,
                alignment: Alignment.topCenter,
                child: Tooltip(
                  message: '${cell.name}，序号可能不连续，因为会隐藏空cell',
                  child: Text(barText),
                ),
              ),
            ),
          );

          // codeVeiw默认很窄，需扩展到占满所有宽度
          var codeViewFillWidth = LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                  width: constraints.maxWidth, child: codeHighlightView);
            },
          );

          var cellFillSize = Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              leftBar,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (cell.code.isCodeNotEmpty && cell.codeExpand)
                      codeViewFillWidth,
                    ...contentWidgets,
                    _cellSplitBlock,
                  ],
                ),
              ),
            ],
          );
          return cellFillSize;
        }

        // return resizeBuilder(context, Size(621, 300), null);
        // todo 发现StatefulWidget在最外层会随着屏幕大小变化自动build，
        // 这里如果用StatefulWidget 是否可以不用这个了：GetSizeBuilder？
        return GetSizeBuilder(builder: resizeBuilder);
      },
    );
    return cell.contents.isEmpty && cell.code.isCodeEmpty
        ? Container()
        : cellView;
  }
}

class GetSizeBuilder extends StatelessWidget {
  final ValueNotifier<Size> size = ValueNotifier(const Size(0, 0));
  final ValueWidgetBuilder<Size> builder;
  final Widget? child;
  GetSizeBuilder({
    super.key,
    required this.builder,
    this.child,
  }) {}

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var box = context.findRenderObject() as RenderBox;
      if (box.hasSize) {
        size.value = (context.findRenderObject() as RenderBox).size;
      }
    });
    return ValueListenableBuilder<Size>(
      valueListenable: size,
      builder: builder,
      child: child,
    );
  }
}

class SizeProvider extends StatefulWidget {
  final Widget child;
  final Function(Size) onChildSize;

  const SizeProvider({Key? key, required this.onChildSize, required this.child})
      : super(key: key);
  @override
  SizeProviderState createState() => SizeProviderState();
}

class SizeProviderState extends State<SizeProvider> {
  @override
  void initState() {
    super.initState();
    _onResize();
  }

  void _onResize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var box = context.findRenderObject() as RenderBox;
      if (box.hasSize) {
        widget.onChildSize(box.size);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // _onResize();
    return widget.child;
  }
}
