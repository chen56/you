import 'package:flutter/material.dart';
import 'package:you_flutter/note.dart';

/// [NoteLayoutBuilder]
NoteMixin build(BuildContext context, NoteMixin child) {
  // ignore: unnecessary_type_check
  assert(build is NoteLayoutBuilder);
  return NoteRootLayout(child: child);
}

/// 一个极简的笔记布局范例
/// 左边routes树，右边页面内容
final class NoteRootLayout extends StatelessWidget with NoteMixin {
  final NoteMixin child;

  const NoteRootLayout({super.key, required this.child});

  @override
  Cell get cell => child.cell;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

///
/// code | codeView
/// bar  | -------------------
/// view | contentView
// class _NoteCellView extends StatelessWidget {
//   final Cell cell;
//   final Outline outline;
//
//   // ignore: prefer_const_constructors_in_immutables
//   _NoteCellView(
//       this.cell, {
//         // ignore: unused_element
//         super.key,
//         required this.outline,
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     // var codeHighlightView = HighlightView(
//     //   // The original code to be highlighted
//     //   // cell.source.code,
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
//           (context) {
//         // GetSizeBuilder: 总高度和cell的code及其展示相关，leftBar在第一次build时无法占满总高度，
//         // 所以用GetSizeBuilder来重新获得codeView的高度并适配之
//         resizeBuilder(BuildContext context, Size size, Widget? child) {
//           // if (size.width < 20 || size.height < 20) {
//           //   size = Size(20, 20);
//           // }
//           // var barText = cell.source.isCodeEmpty
//           //     ? " "
//           //     : cell.codeExpand
//           //         ? "▽"
//           //         : "▷";
//           var leftBar = Material(
//             child: InkWell(
//               onTap: () {
//                 // cell.codeExpand = !cell.codeExpand;
//               },
//               child: Container(
//                 height: size.height,
//                 alignment: Alignment.topCenter,
//                 // child: Tooltip(
//                 //   message: 'TODO code 展开',
//                 //   child: Text("▷"),
//                 // ),
//               ),
//             ),
//           );
//
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
//         // 这里如果用StatefulWidget 是否可以不用这个了：GetSizeBuilder？
//         return _GetSizeBuilder(builder: resizeBuilder);
//       },
//     );
//     // return cell.contents.isEmpty && cell.source.isCodeEmpty ? Container() : cellView;
//     return cell.contents.isEmpty ? Container() : cellView;
//   }
// }
