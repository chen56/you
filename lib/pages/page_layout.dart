import 'package:learn_flutter/page.dart';
import 'package:learn_flutter/navigator_v2.dart';
import 'package:flutter/material.dart';

class PageScreen<T> extends StatefulWidget with Screen<T> {
  final Path<T> current;

  final Path? tree;

  PageScreen({super.key, this.tree, required this.current});

  @override
  String get location => current.path;

  @override
  State<StatefulWidget> createState() {
    return _PageScreenState<T>();
  }
}

class _PageScreenState<T> extends State<PageScreen<T>> {
  Pen? pen;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool afterFirstBuild = pen != null;
      // 第一次build后, outline才被装配出内容，再次绘制，outline才能显示
      // 所以每次页面都需要两次build
      if (afterFirstBuild) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //第一次layout build时, widget.current.build()
    //第二次layout build时, pen=null
    bool firstBuild = pen == null;
    bool secondBuild = pen != null;

    if (firstBuild) {
      pen = Pen();
      widget.current.build(pen!, context);
    }

    var navigatorTree = _NoteTreeView(widget.tree ?? widget.current.root);

    var outline = OutlineView(outline: pen!.outline);

    var content = ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ...pen!.content,
      ],
    );
    // outline 非空说明是第二次build，这时候已经收集完widget，可以释放了
    if (secondBuild) {
      pen = null;
    }

    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.current.title),
        toolbarHeight: 36,
        titleTextStyle: theme.appBarTheme.titleTextStyle,
      ),
      body: Row(
        children: [
          navigatorTree,
          Expanded(flex: 100, child: content),
          Expanded(flex: 30, child: outline),
        ],
      ),
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

  const _NoteTreeView(
    this.root, {
    Key? key,
  }) : super(key: key);

  @override
  State<_NoteTreeView> createState() => _NoteTreeViewState();
}

class _NoteTreeViewState extends State<_NoteTreeView> {
  _NoteTreeViewState();

  @override
  Widget build(BuildContext context) {
    // 一页一个链接
    Widget pageLink(Path note) {
      IconData titleIcon = note.isLeaf ? Icons.remove : Icons.keyboard_arrow_down;
      click() {
        // 还未用上这个展开状态，还没想好怎么让ListView模仿树节点的展开和关闭
        note.extend = !note.extend;
        NavigatorV2.of(context).push(note.path);
      }

      return ListTile(
        // trailing: Icon(note.isLeaf ? Icons.open_in_new : null),
        title: Row(children: [Icon(titleIcon), Text(note.title)]),
        onTap: note.hasPage ? click : null,
        // 是否选中
        selected: false,
        //---------------下面是外观调整
        //更紧凑布局
        dense: false,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        contentPadding: EdgeInsets.only(left: 20 * (note.level - 1).toDouble()),
      );
    }

    var notes = widget.root.toList(includeThis: false);
    return Drawer(
      child: ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.all(2),
        children: notes.map((e) => pageLink(e)).toList(),
      ),
    );
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

class OutlineView extends StatelessWidget {
  final Outline outline;

  const OutlineView({super.key, required this.outline});

  @override
  Widget build(BuildContext context) {
    // 一页一个链接
    Widget headLink(OutlineNode node) {
      IconData titleIcon = node.isLeaf ? Icons.remove : Icons.keyboard_arrow_down;
      return Padding(
        padding: EdgeInsets.only(left: 20 * (node.level - 1).toDouble()),
        child: Row(
          // title 被Flexible包裹后，文本太长会自动换行
          // 换行后左边图标需要CrossAxisAlignment.start 排在文本的第一行
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(titleIcon),
            Flexible(child: Text(node.title)),
          ],
        ),
      );
    }

    var nodes = outline.root.toList(includeThis: false);
    var headings = Column(
      children: [
        const Text("Table of Contents"),
        ...nodes.map((e) => headLink(e)).toList(),
      ],
    );
    return Container(
      // width: 300.0,
      color: Colors.blue.shade50,
      child: Align(
        alignment: Alignment.topRight,
        child: headings,
      ),
    );
  }
}
