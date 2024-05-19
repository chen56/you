import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CellView extends StatelessWidget {
  final String title;
  final Widget child;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;

  const CellView({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.constraints,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textStyle = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(color: colors.surfaceContainerLow, borderRadius: BorderRadius.circular(8.0), border: Border.all(width: 1, color: colors.outlineVariant)),
      child: Column(
        children: [
          Container(
            height: 36,
            color: colors.surfaceContainerHigh,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 10),
                Text(title, style: textStyle.titleMedium),
                const Spacer(),
                IconButton(icon: const Icon(size: 24, Icons.code), onPressed: () {}),
                IconButton(icon: const Icon(size: 24, Icons.fullscreen), onPressed: () {}),
              ],
            ),
          ),
          Container(
            width: width,
            height: height,
            constraints: constraints,
            // color: colors.surface,

            padding: const EdgeInsets.all(12),
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
      var crossAxisCount = 1;
      if (cellWidth != null) {
        if (constraints.maxWidth.isFinite && cellWidth!.isFinite) {
          crossAxisCount = (constraints.maxWidth / cellWidth!).toInt();
        }
      }
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
