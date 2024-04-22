// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

/// cell本身作为树存在，而且api让使用者知道，这是树
/// 这个虽然api稍微比1.1复杂，
///   - 但同步异步都可以完全不靠Trace来定位cell，
///   - 可信度也较高（Trace总觉得有点不太靠谱，收集定位 source code 也就行了），
///   - 甚至可以作为通用架构来做note外的开发
void build(BuildContext context, Print printc) {
  printc(TestCell.namedBlock(
      title: Text("全named 参数 root, 格式化时,所有参数强制换行，无法调整啊"),
      style: ContentLayout(maxColumn: 3),
      block: (printc) {
        printc(TestCell.namedBlock(
            title: Text("1"),
            style: ContentLayout(maxColumn: 3),
            block: (printc) {
              return printc(Text(""));
            }));
        // 这样也可以，嵌套多一层，但api单一化了，都是print思路
        printc(TestCell.namedBlock(
            title: Text("2"),
            style: ContentLayout(maxColumn: 3),
            block: (printc) {
              printc(Text(""));
            }));
      }));

  printc(TestCell.named(title: Text("3"), style: ContentLayout(maxColumn: 3), children: [
    TestCell.namedBlock(
      title: Text("3"),
      style: ContentLayout(maxColumn: 3),
      block: (printc) => printc(Text("")),
    )
  ]));

  printc(TestCell.position(title: Text("全named 参数 root, 格式化时强制换行，无法调整啊"), style: ContentLayout(maxColumn: 3), (printc) {
    int i = 0;
    i++;
    printc(i);

    printc(TestCell.position(title: Text("1"), style: ContentLayout(maxColumn: 3), (printc) {
      printc(Text(""));
    }));
    for (int i = 0; i < 10; i++) {
      // 这样也可以，嵌套多一层，但api单一化了，都是print思路
      printc(TestCell.position(title: Text("2"), style: ContentLayout(maxColumn: 3), (printc) {
        printc(Text(""));
      }));
    }

    printc(Text(""));
  }));

  printc(TestCell.positionList(title: Text("位置参数block，root"), style: ContentLayout(maxColumn: 3), children: [
    TestCell.position(title: Text("1"), style: ContentLayout(maxColumn: 3), (printc) {
      printc("hello");
    }),
    TestCell.position(
      (printc) {
        printc("hello");
      },
      title: Text("1"),
      style: ContentLayout(maxColumn: 3),
    ),
  ]).style(ContentLayout(maxColumn: 3)));
}

class TestCell extends StatelessWidget {
  TestCell.namedBlock({dynamic block, super.key, Cell? print, Text title = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<TestCell> children = const <TestCell>[]}) {
    if (print != null) print(this);
  }

  const TestCell.named({super.key, required Text title, required ContentLayout style, required List<TestCell> children});

  const TestCell.position(
    Function(dynamic printc) block, {
    required Text title,
    required ContentLayout style,
  });

  const TestCell.positionList({required Text title, required ContentLayout style, List<TestCell> children = const []});

  TestCell style(ContentLayout style) {
    return this;
  }

  call() {}

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class PositionArgBlock extends StatelessWidget {
  PositionArgBlock(dynamic block, {super.key, Cell? print, Text title = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<TestCell> children = const <TestCell>[]}) {
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
