import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_flutter/note.dart';

@NoteAnnotation(label: "Widgets cheatsheets", publish: true)
void build(BuildContext context, Cell print) {
  Widget card() {
    var colors = Theme.of(context).colorScheme;
    return Wrap(
      children: [
        Card(
          elevation: 4,
          child: Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
            child: const Text('Elevated'),
          ),
        ),
        Card(
          elevation: 0,
          color: colors.surfaceDim,
          child: Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            child: const Text('Filled'),
          ),
        ),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: colors.outlineVariant),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            child: const Text('Border'),
          ),
        ),
      ],
    );
  }

  Widget container() {
    var colors = Theme.of(context).colorScheme;
    return Wrap(
      children: [
        Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.surface,
              boxShadow: [
                BoxShadow(
                  color: colors.shadow.withOpacity(0.2), // 阴影颜色
                  spreadRadius: 2, // 阴影扩散范围
                  blurRadius: 2, // 阴影模糊程度
                  offset: const Offset(2, 1), // 阴影偏移量，水平和垂直方向
                ),
              ],
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Text("模仿Card\nImitate Card") // Your widget here
            )
      ],
    );
  }

  var x = Column(
    children: [
      Level1MasonryLayout(
        title: "xxx",
        cellWidth: 300,
        children: [
          CellView(title: "Card", child: card()),
          CellView(title: "Container", child: container()),
          CellView(title: "Card", child: card()),
          CellView(title: "Container", child: container()),
          CellView(title: "Card", child: card()),
          CellView(title: "Container", child: container()),
          CellView(title: "Card", child: card()),
          CellView(title: "Container", child: container()),
        ],
      ),
      Level1GridLayout(
        title: "xxx",
        cellWidth: 300,
        children: [
          CellView(title: "Card阿斯顿发", child: card()),
          CellView(title: "Container", child: container()),
          CellView(title: "Card", child: card()),
          CellView(title: "Container", child: container()),
          CellView(title: "Card", child: card()),
          CellView(title: "Container", child: container()),
          CellView(title: "Card", child: card()),
          CellView(title: "Container", child: container()),
        ],
      ),
    ],
  );

  print(x);
}

class CellView extends StatelessWidget {
  final String title;
  final Widget child;

  const CellView({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(color: colors.surfaceContainer, borderRadius: BorderRadius.circular(8.0), border: Border.all(width: 1, color: colors.outlineVariant)),
      child: Column(
        children: [
          AppBar(
            toolbarHeight: 36,
            elevation: 1,
            backgroundColor: colors.surfaceContainer,
            title: Text(title),
            actions: <Widget>[
              IconButton(icon: const Icon(Icons.code), onPressed: () {}),
              IconButton(icon: const Icon(Icons.fullscreen), onPressed: () {}),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            width: 350,
            child: child,
          ),
        ],
      ),
    );
  }
}

class Level1GridLayout extends StatelessWidget {
  final String title;
  final List<CellView> children;
  final double? cellWidth;

  const Level1GridLayout({super.key, required this.title, this.cellWidth, required this.children});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(builder: (context, constraints) {
      var crossAxisCount = cellWidth == null ? 1 : (constraints.maxWidth / cellWidth!).toInt();
      crossAxisCount = crossAxisCount <= 1 ? 1 : crossAxisCount;

      return Column(
        children: [
          Text(title, style: textTheme.headlineLarge),
          Container(
            padding: const EdgeInsets.all(12),
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              // to disable GridView's scrolling
              shrinkWrap: true,
              // You won't see infinite size erro
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: crossAxisCount,
              children: <Widget>[
                ...children,
              ],
            ),
          ),
        ],
      );
    });
  }
}

class Level1MasonryLayout extends StatelessWidget {
  final String title;
  final List<CellView> children;
  final double? cellWidth;

  const Level1MasonryLayout({super.key, required this.title, this.cellWidth, required this.children});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(builder: (context, constraints) {
      var crossAxisCount = cellWidth == null ? 1 : (constraints.maxWidth / cellWidth!).toInt();
      crossAxisCount = crossAxisCount <= 1 ? 1 : crossAxisCount;
      return Column(
        children: [
          Text(title, style: textTheme.headlineLarge),
          Container(
            padding: const EdgeInsets.all(12),
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              // to disable GridView's scrolling
              shrinkWrap: true,
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) => children[index],
              itemCount: children.length,
            ),
          ),
        ],
      );
    });
  }
}
