// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

/// cell本身作为树存在，而且api让使用者知道，这是树
/// 这个虽然api稍微比1.1复杂，
///   - 但同步异步都可以完全不靠Trace来定位cell，
///   - 可信度也较高（Trace总觉得有点不太靠谱，收集定位 source code 也就行了），
///   - 甚至可以作为通用架构来做note外的开发
void build(BuildContext context, CellPrint printc) {
  printc(Cell.namedBlock(
      title: Text("全named 参数 root, 格式化时,所有参数强制换行，无法调整啊"),
      style: ContentLayout(maxColumn: 3),
      block: (printc) {
        printc(Cell.namedBlock(
            title: Text("1"),
            style: ContentLayout(maxColumn: 3),
            block: (printc) {
              return printc(Text(""));
            }));
        // 这样也可以，嵌套多一层，但api单一化了，都是print思路
        printc(Cell.namedBlock(
            title: Text("2"),
            style: ContentLayout(maxColumn: 3),
            block: (printc) {
              printc(Text(""));
            }));
      }));

  printc(Cell.named(title: Text("3"), style: ContentLayout(maxColumn: 3), children: [
    Cell.namedBlock(
      title: Text("3"),
      style: ContentLayout(maxColumn: 3),
      block: (printc) => printc(Text("")),
    )
  ]));

  printc(Cell.position(title: Text("全named 参数 root, 格式化时强制换行，无法调整啊"), style: ContentLayout(maxColumn: 3), (printc) {
    printc(Cell.position(title: Text("1"), style: ContentLayout(maxColumn: 3), (printc) {
      printc(Text(""));
    }));
    // 这样也可以，嵌套多一层，但api单一化了，都是print思路
    printc(Cell.position(title: Text("2"), style: ContentLayout(maxColumn: 3), (printc) {
      printc(Text(""));
    }));
  }));

  printc(Cell.positionList(title: Text("位置参数block，root"), style: ContentLayout(maxColumn: 3), children: [
    Cell.position(title: Text("1"), style: ContentLayout(maxColumn: 3), (printc) {
      printc("hello");
    }),
    Cell.position(
      (printc) {
        printc("hello");
      },
      title: Text("1"),
      style: ContentLayout(maxColumn: 3),
    ),
  ]).style(ContentLayout(maxColumn: 3)));
}

class Cell extends StatelessWidget {
  Cell.namedBlock({dynamic block, super.key, CellPrint? print, Text title = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Cell> children = const <Cell>[]}) {
    if (print != null) print(this);
  }

  Cell.named({super.key, required Text title, required ContentLayout style, required List<Cell> children}) {}

  Cell.position(
    Function(dynamic printc) block, {
    required Text title,
    required ContentLayout style,
  }) {}

  Cell.positionList({required Text title, required ContentLayout style, List<Cell> children = const []}) {}

  Cell style(ContentLayout style) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class PositionArgBlock extends StatelessWidget {
  PositionArgBlock(dynamic block, {super.key, CellPrint? print, Text title = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Cell> children = const <Cell>[]}) {
    if (print != null) print(this);
  }

  PositionArgBlock style(ContentLayout style) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class CodeBlock2 extends StatelessWidget {
  const CodeBlock2(dynamic bb, {super.key, dynamic block});

  CodeBlock2 style(ContentLayout style) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class ContentLayout {
  final int maxColumn;

  const ContentLayout({this.maxColumn = 1});
}
