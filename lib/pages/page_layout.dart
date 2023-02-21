import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:learn_flutter/page.dart';
import 'package:learn_flutter/navigator_v2.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/pen_markdown.dart';

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
  final _PagePen pen=_PagePen();
  final ScrollController controller = ScrollController(initialScrollOffset: 0);

  @override
  void initState() {
    super.initState();
    //内容outline只build一次
    widget.current.build(pen!, context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 第一次[build]时, flutter-mardown包无法装配出outline，只有第一次[build]完，才能装配好，
      // 所以需要触发第二次build
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var navigatorTree = _NoteTreeView(widget.tree ?? widget.current.root);

    var outlineView =
    _OutlineView(contentPartController: controller, outline: pen.outline);

    // 总是偶发的报错: The Scrollbar's ScrollController has no ScrollPosition attached.
    // 参考：https://stackoverflow.com/questions/69853729/flutter-the-scrollbars-scrollcontroller-has-no-scrollposition-attached/71490688#71490688
    // 暂时用Scrollbar试试，但不知其所以然，还是对其布局机制不太熟悉：
    var contentListView = ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        controller: controller,
        children:pen._contents,
      );
    var content = Scrollbar(
      thickness: 10,
      controller: controller, // Here
      child: contentListView,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.current.title),
        toolbarHeight: 36,
      ),
      body: Center(child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(width: 200, child: navigatorTree),
          Expanded(child: contentListView,),
          SizedBox(width:200,child: outlineView,),
        ],
      ),),
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

  const _NoteTreeView(this.root, {
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
      IconData titleIcon =
      note.isLeaf ? Icons.remove : Icons.keyboard_arrow_down;
      click() {
        // 还未用上这个展开状态，还没想好怎么让ListView模仿树节点的展开和关闭
        note.extend = !note.extend;
        NavigatorV2.of(context).push(note.path);
      }

      // title 被Flexible包裹后，文本太长会自动换行
      // 换行后左边图标需要CrossAxisAlignment.start 排在文本的第一行
      var title = Flexible(child: Text(note.title));

      return ListTile(
        title: Row(children: [Icon(titleIcon), title]),
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
    return ListView(
      shrinkWrap: false,
      padding: const EdgeInsets.all(2),
      children: notes.map((e) => pageLink(e)).toList(),

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
            const Icon(
              Icons.arrow_right,
            ),
            // title 被Flexible包裹后，文本太长会自动换行
            // 换行后左边图标需要CrossAxisAlignment.start 排在文本的第一行
            Flexible(child: Text(node.title)),
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
  _PagePen();

  Outline outline = Outline();
  final List<Widget> _contents = List.empty(growable: true);

  List<Content> get contents => List.unmodifiable(_contents);

  void sample(Widget sample) {
    _contents.add(ConstrainedBox(constraints: BoxConstraints.tightFor(width: 200,height: 200),child: sample,));
  }

  void widget(Widget widget) {
    _contents.add(ConstrainedBox(constraints: BoxConstraints.tightFor(width: 200,height: 200),child: widget,));
  }

  void markdown(String content) {
    _contents.add(MarkdownView(outline: outline, content: content,));
  }
}
