// ide style ui widgets

import 'package:flutter/material.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_flutter/state.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({
    super.key,
    required this.view,
    required this.themeMode,
    required this.seedColor,
    required this.extWidgets,
  });

  final Value<String> view;
  final Value<ThemeMode> themeMode;
  final Value<Color> seedColor;
  final List<Widget> extWidgets;

  @override
  State<StatefulWidget> createState() {
    return _ThemeViewState();
  }
}

class _ThemeViewState extends State<ThemeView> {
  final Value<bool> includeDraft = false.signal();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    List<Color> getChildrenColors(MaterialColor e) {
      return [
        e.shade50,
        e.shade100,
        e.shade200,
        e.shade300,
        e.shade400,
        e.shade500,
        e.shade600,
        e.shade700,
        e.shade800,
        e.shade900,
      ];
    }

    return Column(
      children: [
        Container(
          color: colors.surfaceContainer,
          child: OverflowBar(alignment: MainAxisAlignment.end, children: [
            IconButton(tooltip: "Hidden", icon: const Icon(Icons.horizontal_rule), iconSize: 24, onPressed: () => widget.view.value = ""),
          ]),
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        const Text("Theme mode"),
        Card(
          child: Watch(builder:(context) {
            return SegmentedButton<ThemeMode>(
              segments: const <ButtonSegment<ThemeMode>>[
                ButtonSegment<ThemeMode>(value: ThemeMode.light, label: Text('Light'), icon: Icon(Icons.light_mode_outlined)),
                ButtonSegment<ThemeMode>(value: ThemeMode.system, label: Text('Sys'), icon: Icon(Icons.brightness_auto_outlined)),
                ButtonSegment<ThemeMode>(value: ThemeMode.dark, label: Text('Dark'), icon: Icon(Icons.dark_mode_outlined)),
              ],
              selected: <ThemeMode>{widget.themeMode.value},
              onSelectionChanged: (Set<ThemeMode> newSelection) {
                widget.themeMode.value = newSelection.first;
              },
            );
          }),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Theme color seed"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...Colors.primaries.map((e) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getChildrenColors(e).map((color) => ColorBlock(color: color, seedColor: widget.seedColor)).toList(),
              );
            }),
          ],
        ).paddingAll$(10),
        ...widget.extWidgets,
      ],
    ).constrainedBox$(
      constraints: const BoxConstraints.tightFor(width: 280),
    );
  }
}

// color block
class ColorBlock extends StatelessWidget {
  final Color color;
  final Value<Color> seedColor;

  const ColorBlock({super.key, required this.color, required this.seedColor});

  @override
  Widget build(BuildContext context) {
    Widget colorWidget = Container(width: 20, height: 20, color: color);
    return InkWell(
      onTap: () {
        seedColor.value = color;
      },
      child: Watch(builder:(context) {
        return seedColor.value == color ? colorWidget.borderAll$() : colorWidget;
      }),
    );
  }
}
