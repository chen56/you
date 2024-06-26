// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:you_flutter/state.dart';
// import 'package:you_flutter/src/note/contents/markdown_content.dart';
// import 'package:you_flutter/src/note/contents/outline.dart';
// import 'package:you_flutter/src/note/navigator_v2.dart';
// import 'package:you_flutter/src/note/note.dart';
// import 'package:you_flutter/src/note/utils_ui.dart';
//
// /// 分割块，在cell间分割留白
// const Widget _cellSplitBlock = SizedBox(height: 18);
//
// @Deprecated("已被新router替代暂时保留，代码还没移植完")
// class LayoutScreen extends StatefulWidget with Screen<void> {
//   final NoteRoute note = NoteRoute.root();
//   final Cell rootCell;
//   final NoteRoute rootNote = NoteRoute.root();
//
//   LayoutScreen({
//     super.key,
//     required this.rootCell,
//   });
//
//   @override
//   String get location => note.path;
//
//   @override
//   State<StatefulWidget> createState() {
//     return _LayoutScreenState();
//   }
// }
//
// class _LayoutScreenState extends State<LayoutScreen> {
//   final ScrollController controllerV = ScrollController(initialScrollOffset: 0);
//   final Outline outline = Outline();
//
//   _LayoutScreenState();
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // to do
//       // flutter-markdown只有在Widget.build时才parse markdown，导致第一次[build]时,
//       // 装配的outline无法展示出来， 所以需要触发第二次build,以使其展示出来
//       // 暂时没想好最终处理办法，暂时这样。
//       setState(() {
//         outline.collectDone();
//       });
//     });
//   }
//
//   @override
//   void didUpdateWidget(covariant LayoutScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void activate() {
//     super.activate();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var navigatorTree = _NoteTreeView(widget.rootNote);
//
//     var outlineView = _OutlineTreeView(
//       pageController: controllerV,
//       outline: outline,
//     );
//
//     var pageBody = SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       controller: controllerV,
//       child: Watch(builder:(context) {
//         return ListBody(
//           children: [
//             ...widget.rootCell.toList().where((e) => !e.isContentsEmpty()).map((cell) => _NoteCellView(cell, outline: outline)),
//             //page下留白，避免被os工具栏遮挡
//             const SizedBox(height: 300),
//           ],
//         );
//       }),
//     );
//     var appBar = AppBar(title: Text(widget.note.displayName), toolbarHeight: 36);
//
//     //only for debug mode
//     var bottomDevBar = kReleaseMode
//         ? null
//         : BottomAppBar(
//             height: 36,
//             padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
//             child: Row(children: [
//               const Text("Devtools"),
//               const Spacer(),
//               IconButton(onPressed: () {}, tooltip: 'Search', icon: const Icon(Icons.search)),
//               IconButton(onPressed: () {}, tooltip: 'Favorite', icon: const Icon(Icons.favorite)),
//             ]));
//
//     ///  Responsive UI:
//     ///  Since StatefulWidget will automatically build() when the screen size changes,
//     ///  the processing of responsive UI does not require special processing,
//     ///  such as ListenableBuilder
//     var result = switch (WindowClass.of(context)) {
//       WindowClass.compact => Scaffold(
//           appBar: appBar,
//           drawer: Drawer(child: navigatorTree),
//           endDrawer: Drawer(child: outlineView),
//           bottomNavigationBar: bottomDevBar,
//           body: pageBody,
//         ),
//       WindowClass.medium => Scaffold(
//           appBar: appBar,
//           drawer: Drawer(child: navigatorTree),
//           endDrawer: null,
//           bottomNavigationBar: bottomDevBar,
//           body: SafeArea(
//             child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//               Expanded(child: pageBody),
//               SizedBox(width: 250, child: outlineView),
//             ]),
//           ),
//         ),
//       // full screen size expand all
//       _ => Scaffold(
//           appBar: appBar,
//           drawer: null,
//           endDrawer: null,
//           bottomNavigationBar: bottomDevBar,
//           body: SafeArea(
//             child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//               SizedBox(width: 220, child: navigatorTree),
//               Expanded(child: pageBody),
//               SizedBox(width: 250, child: outlineView),
//             ]),
//           ),
//         ),
//     };
//     return SelectionArea(child: result);
//   }
// }
//
// class _NoteTreeView extends StatefulWidget {
//   final NoteRoute root;
//
//   const _NoteTreeView(this.root);
//
//   @override
//   State<_NoteTreeView> createState() => _NoteTreeViewState();
// }
//
// class _NoteTreeViewState extends State<_NoteTreeView> {
//   _NoteTreeViewState();
//
//   @override
//   Widget build(BuildContext context) {
//     // 一页一个链接
//     Widget noteLink(NoteRoute node) {
//       click() {
//         if (node.isLeaf) {
//           NavigatorV2.of(context).push(node.path);
//         } else {
//           setState(() => node.expand = !node.expand);
//         }
//       }
//
//       String iconExtend = node.isLeaf
//           ? "   "
//           : node.expand
//               ? "▼"
//               : "︎︎︎▶";
//       // 📁📂📄🗓📜▸▾▹▿ ▶︎▷▼▽►●◦○ ↑→↓↑↘︎ ⌃⌄>〉⌵〉⎥ \⑊↘︎ -▶︎►▸▼▾
//
//       // TextButton link = TextButton(onPressed: (){}, child: Text(node.title));
//       return Padding(
//         // 缩进模仿树形
//         padding: EdgeInsets.only(left: 10 * (node.levelTo(widget.root) - 1).toDouble()),
//         child: TextButton(
//           onPressed: click,
//           child: Text("$iconExtend ${node.displayName}"),
//         ),
//       );
//     }
//
//     var notes = widget.root.toList(
//       includeThis: false,
//       test: (e) => e.isRoot ? true : e.parent!.expand,
//       sortBy: (a, b) => a.basename.compareTo(b.basename),
//     );
//     var column = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ...notes.map(noteLink),
//         const SizedBox(height: 200), // give space to bottom
//       ],
//     );
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: column,
//     );
//   }
// }
//
// class _OutlineTreeView extends StatelessWidget {
//   final Outline outline;
//
//   // 主内容部分的滚动控制，点击outline触发主屏滚动到指定标题
//   final ScrollController pageController;
//
//   const _OutlineTreeView({required this.outline, required this.pageController});
//
//   @override
//   Widget build(BuildContext context) {
//     // 一页一个链接
//     Widget headLink(OutlineNode node) {
//       var link2 = TextButton(
//         style: ButtonStyle(padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(2))),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // const Icon(
//             //   Icons.arrow_right,
//             // ),
//             // title 被Flexible包裹后，文本太长会自动换行▽
//             // 换行后左边图标需要CrossAxisAlignment.start 排在文本的第一行
//             //📜📁📂📄🗓📜 ▸▾▹▿▶︎▷▼▽►🔘◽️▫️◻️◼️⬛️🔹⚉
//             Flexible(child: Text("◻ ${node.title}")),
//           ],
//         ),
//         onPressed: () {
//           // 防止异常
//           if (pageController.hasClients) {
//             Scrollable.ensureVisible(node.key.currentContext!);
//           }
//         },
//       );
//       // TextButton link = TextButton(onPressed: (){}, child: Text(node.title));
//       return Padding(
//         // 缩进模仿树形
//         padding: EdgeInsets.only(left: 20 * (node.level - 1).toDouble()),
//         child: link2,
//       );
//     }
//
//     var nodes = outline.root.toList(includeThis: false);
//
//     var column = Column(
//       children: [
//         ...nodes.map((e) => headLink(e)),
//       ],
//     );
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: column,
//     );
//   }
// }
//
// ///
// /// code | codeView
// /// bar  | -------------------
// /// view | contentView
// class _NoteCellView extends StatelessWidget {
//   final Cell cell;
//   final Outline outline;
//
//   // ignore: prefer_const_constructors_in_immutables
//   _NoteCellView(
//     this.cell, {
//     // ignore: unused_element
//     super.key,
//     required this.outline,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO 130 remove
//     // var codeHighlightView = HighlightView(
//     //   // The original code to be highlighted
//     //   // TODO 130 remove
//     //   // cell.source.code,
//     //   "fack code TODO 130 remove",
//     //   // Specify language
//     //   // It is recommended to give it a value for performance
//     //   language: 'dart',
//     //
//     //   // Specify highlight theme
//     //   // All available themes are listed in `themes` folder
//     //   theme: atelierForestLightTheme,
//     //
//     //   // Specify padding
//     //   padding: const EdgeInsets.all(0),
//     //
//     //   // Specify text style
//     // );
//
//     var cellView = Watch(builder:
//       (context) {
//         // GetSizeBuilder: 总高度和cell的code及其展示相关，leftBar在第一次build时无法占满总高度，
//         // 所以用GetSizeBuilder来重新获得codeView的高度并适配之
//         resizeBuilder(BuildContext context, Size size, Widget? child) {
//           // if (size.width < 20 || size.height < 20) {
//           //   size = Size(20, 20);
//           // }
//           // TODO 130 remove
//           // var barText = cell.source.isCodeEmpty
//           //     ? " "
//           //     : cell.codeExpand
//           //         ? "▽"
//           //         : "▷";
//           var leftBar = Material(
//             child: InkWell(
//               onTap: () {
//                 // TODO 130 remove
//                 // cell.codeExpand = !cell.codeExpand;
//               },
//               child: Container(
//                 height: size.height,
//                 alignment: Alignment.topCenter,
//                 // child: Tooltip(
//                 //   message: 'TODO code 展开',
//                 //   // TODO 130 remove
//                 //   child: Text("▷"),
//                 // ),
//               ),
//             ),
//           );
//
//           // TODO 130 remove
//           // codeVeiw默认很窄，需扩展到占满所有宽度
//           // var codeViewFillWidth = LayoutBuilder(
//           //   builder: (BuildContext context, BoxConstraints constraints) {
//           //     return SizedBox(width: constraints.maxWidth, child: codeHighlightView);
//           //   },
//           // );
//
//           var cellContents = cell.contents.map((content) {
//             return switch (content) {
//               MD md => MarkdownContent(content: md.text, outline: outline),
//               Widget widget => widget,
//               _ => Text("$content"),
//             };
//           });
//           var cellFillSize = Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               leftBar,
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // TODO 130 remove
//                     // if (cell.source.isCodeNotEmpty && cell.codeExpand) codeViewFillWidth,
//                     ...cellContents,
//                     _cellSplitBlock,
//                   ],
//                 ),
//               ),
//             ],
//           );
//           return cellFillSize;
//         }
//
//         // return resizeBuilder(context, Size(621, 300), null);
//         // todo 发现StatefulWidget在最外层会随着屏幕大小变化自动build，
//         // 这里如果用StatefulWidget 是否可以不用这个了：GetSizeBuilder？
//         return _GetSizeBuilder(builder: resizeBuilder);
//       },
//     );
//     // TODO 130 remove
//     // return cell.contents.isEmpty && cell.source.isCodeEmpty ? Container() : cellView;
//     return cell.contents.isEmpty ? Container() : cellView;
//   }
// }
//
// /// todo 貌似有更先进的测量size方案，可以不用刷2次
// /// /flutter/examples/api/lib/widgets/framework/build_owner.0.dart
// class _GetSizeBuilder extends StatelessWidget {
//   final ValueNotifier<Size> size = ValueNotifier(const Size(0, 0));
//   final ValueWidgetBuilder<Size> builder;
//   final Widget? child;
//
//   _GetSizeBuilder({
//     // ignore: unused_element
//     super.key,
//     required this.builder,
//     // ignore: unused_element
//     this.child,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       var box = context.findRenderObject() as RenderBox;
//       if (box.hasSize) {
//         size.value = (context.findRenderObject() as RenderBox).size;
//       }
//     });
//     return ValueListenableBuilder<Size>(
//       valueListenable: size,
//       builder: builder,
//       child: child,
//     );
//   }
// }
