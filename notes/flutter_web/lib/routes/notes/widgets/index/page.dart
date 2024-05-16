import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:you_flutter/note.dart';

@NoteAnnotation(label: "Widgets cheatsheets", publish: true)
void build(BuildContext context, Cell print) {
  Widget cardCell() {
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

  Widget containerCell() {
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

  Widget buttonStyleButtonCell() {
    return Wrap(
      children: [
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton")),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              FilledButton.tonal(onPressed: () {}, child: const Text('FilledButton.tonal')),
              OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
            ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
          ),
        ),
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.image), label: const Text('Add Icon')),
              FilledButton.icon(onPressed: () {}, label: const Text('Add Icon'), icon: const Icon(Icons.image)),
              FilledButton.tonalIcon(onPressed: () {}, label: const Text('Add Icon'), icon: const Icon(Icons.image)),
              OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.image), label: const Text('Add Icon')),
              TextButton.icon(onPressed: () {}, icon: const Icon(Icons.image), label: const Text('Add Icon'))
            ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
          ),
        ),
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ElevatedButton(onPressed: null, child: Text("ElevatedButton")),
              const FilledButton(onPressed: null, child: Text('FilledButton')),
              const FilledButton.tonal(onPressed: null, child: Text('FilledButton.tonal')),
              const OutlinedButton(onPressed: null, child: Text('OutlinedButton')),
              const TextButton(onPressed: null, child: Text('TextButton')),
            ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
          ),
        ),
      ],
    );
  }

  Widget floatingActionButtonCell() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {},
          tooltip: "FloatingActionButton()",
          child: const Text("default"),
        ),
        FloatingActionButton.small(
          // isExtended: false,
          onPressed: () {},
          tooltip: "FloatingActionButton.small()",
          child: const Text("small"),
        ),
        FloatingActionButton.large(
          // isExtended: false,
          onPressed: () {},
          tooltip: "FloatingActionButton.large()",
          child: const Text("large"),
        ),
        FloatingActionButton.extended(
          // isExtended: false,
          onPressed: () {},
          tooltip: "FloatingActionButton.extended()",
          label: const Text('extended'),
          icon: const Icon(Icons.thumb_up),
        ),
      ].map((e) => Padding(padding: const EdgeInsets.all(2), child: e)).toList(),
    );
  }

  Widget iconButtonCell() {
    bool standardSelected = false;
    bool filledSelected = false;
    bool outlinedSelected = false;
    bool tonalSelected = false;
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text("IconButton()"),
              IconButton(
                isSelected: standardSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () => setState(() => standardSelected = !standardSelected),
              ),
              IconButton(
                isSelected: standardSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text("IconButton.filled()"),
              IconButton.filled(
                isSelected: filledSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () {
                  setState(() => filledSelected = !filledSelected);
                },
              ),
              IconButton.filled(
                isSelected: filledSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              const Text("IconButton.filledTonal()"),
              IconButton.filledTonal(
                isSelected: tonalSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () {
                  setState(() => tonalSelected = !tonalSelected);
                },
              ),
              IconButton.filledTonal(
                isSelected: tonalSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              const Text("IconButton.outlined()"),
              IconButton.outlined(
                isSelected: outlinedSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () {
                  setState(() => outlinedSelected = !outlinedSelected);
                },
              ),
              IconButton.outlined(
                isSelected: outlinedSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: null,
              ),
            ],
          ),
        ],
      );
    });
  }

  var x = Column(
    children: [
      Level1MasonryLayout(
        title: "xxx",
        cellWidth: 500,
        children: [
          CellView(title: "Card", child: cardCell()),
          CellView(title: "Container", child: containerCell()),
          CellView(title: "ButtonStyleButton", child: buttonStyleButtonCell()),
          CellView(title: "FloatingActionButton", child: floatingActionButtonCell()),
          CellView(title: "IconButton", child: iconButtonCell()),
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
