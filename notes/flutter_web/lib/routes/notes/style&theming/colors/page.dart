import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_flutter/note.dart';

@NoteAnnotation(label: "Color roles",publish: true)
void build(BuildContext context, Cell print) {
  final colors = Theme.of(context).colorScheme;
  print(const MD(r'''
# Color roles

ref

- <https://m3.material.io/styles/color/roles>

  '''));

  print(
    Column(
      children: [
        Wrap(
          children: [
            ColorChip(label: "primary", color: colors.primary, onColors: [ColorItem(label: "onPrimary", color: colors.onPrimary)]),
            ColorChip(label: "secondary", color: colors.secondary, onColors: [ColorItem(label: "onSecondary", color: colors.onSecondary)]),
            ColorChip(label: "tertiary", color: colors.tertiary, onColors: [ColorItem(label: "onTertiary", color: colors.onTertiary)]),
          ],
        ),
        Wrap(
          children: [
            ColorChip(label: "primaryContainer", color: colors.primaryContainer, onColors: [ColorItem(label: "onPrimaryContainer", color: colors.onPrimaryContainer)]),
            ColorChip(label: "secondaryContainer", color: colors.secondaryContainer, onColors: [ColorItem(label: "onSecondaryContainer", color: colors.onSecondaryContainer)]),
            ColorChip(label: "tertiaryContainer", color: colors.tertiaryContainer, onColors: [ColorItem(label: "onTertiaryContainer", color: colors.onTertiaryContainer)]),
          ],
        ),
        Wrap(
          children: [
            ColorChip(label: "primaryFixed", color: colors.primaryFixed, onColors: [ColorItem(label: "onPrimaryFixed", color: colors.onPrimaryFixed)]),
            ColorChip(label: "secondaryFixed", color: colors.secondaryFixed, onColors: [ColorItem(label: "onSecondaryFixed", color: colors.onSecondaryFixed)]),
            ColorChip(label: "tertiaryFixed", color: colors.tertiaryFixed, onColors: [ColorItem(label: "onTertiaryFixed", color: colors.onTertiaryFixed)]),
          ],
        ),
        Wrap(
          children: [
            ColorChip(label: "primaryFixedDim", color: colors.primaryFixedDim, onColors: [
              ColorItem(label: "onPrimaryFixed", color: colors.onPrimaryFixed),
              ColorItem(label: "onPrimaryFixedVariant", color: colors.onPrimaryFixedVariant),
            ]),
            ColorChip(label: "secondaryFixedDim", color: colors.secondaryFixedDim, onColors: [
              ColorItem(label: "onSecondaryFixed", color: colors.onSecondaryFixed),
              ColorItem(label: "onSecondaryFixedVariant", color: colors.onSecondaryFixedVariant),
            ]),
            ColorChip(label: "tertiaryFixedDim", color: colors.tertiaryFixedDim, onColors: [
              ColorItem(label: "onTertiaryFixed", color: colors.onTertiaryFixed),
              ColorItem(label: "onTertiaryFixedVariant", color: colors.onTertiaryFixedVariant),
            ]),
          ],
        ),
        Wrap(
          children: [
            ColorChip(label: "error", color: colors.error, onColors: [ColorItem(label: "onError", color: colors.onError)]),
            ColorChip(label: "errorContainer", color: colors.errorContainer, onColors: [ColorItem(label: "onError", color: colors.onErrorContainer)]),
          ],
        ),
        Wrap(
          children: [
            ColorChip(label: "surface", color: colors.surface, onColors: [
              ColorItem(label: "onSurface", color: colors.onSurface),
              ColorItem(label: "onSurfaceVariant", color: colors.onSurfaceVariant),
              ColorItem(label: "outline", color: colors.outline),
              ColorItem(label: "outlineVariant", color: colors.outlineVariant),
            ]),
            ColorChip(label: "surfaceBright", color: colors.surfaceBright, onColors: [
              ColorItem(label: "onSurface", color: colors.onSurface),
              ColorItem(label: "onSurfaceVariant", color: colors.onSurfaceVariant),
              ColorItem(label: "outline", color: colors.outline),
              ColorItem(label: "outlineVariant", color: colors.outlineVariant),
            ]),
            ColorChip(label: "surfaceDim", color: colors.surfaceDim, onColors: [
              ColorItem(label: "onSurface", color: colors.onSurface),
              ColorItem(label: "onSurfaceVariant", color: colors.onSurfaceVariant),
              ColorItem(label: "outline", color: colors.outline),
              ColorItem(label: "outlineVariant", color: colors.outlineVariant),
            ]),
          ],
        ),
        Wrap(
          children: [
            ColorChip(label: "surfaceContainerHighest", color: colors.surfaceContainerHighest, onColors: [
              ColorItem(label: "onSurface", color: colors.onSurface),
              ColorItem(label: "onSurfaceVariant", color: colors.onSurfaceVariant),
              ColorItem(label: "outline", color: colors.outline),
              ColorItem(label: "outlineVariant", color: colors.outlineVariant),
            ]),
            ColorChip(label: "surfaceContainerHigh", color: colors.surfaceContainerHigh, onColors: [
              ColorItem(label: "onSurface", color: colors.onSurface),
              ColorItem(label: "onSurfaceVariant", color: colors.onSurfaceVariant),
              ColorItem(label: "outline", color: colors.outline),
              ColorItem(label: "outlineVariant", color: colors.outlineVariant),
            ]),
            ColorChip(label: "surfaceContainer", color: colors.surfaceContainer, onColors: [
              ColorItem(label: "onSurface", color: colors.onSurface),
              ColorItem(label: "onSurfaceVariant", color: colors.onSurfaceVariant),
              ColorItem(label: "outline", color: colors.outline),
              ColorItem(label: "outlineVariant", color: colors.outlineVariant),
            ]),
            ColorChip(label: "surfaceContainerLow", color: colors.surfaceContainerLow, onColors: [
              ColorItem(label: "onSurface", color: colors.onSurface),
              ColorItem(label: "onSurfaceVariant", color: colors.onSurfaceVariant),
              ColorItem(label: "outline", color: colors.outline),
              ColorItem(label: "outlineVariant", color: colors.outlineVariant),
            ]),
            ColorChip(label: "surfaceContainerLowest", color: colors.surfaceContainerLowest, onColors: [
              ColorItem(label: "onSurface", color: colors.onSurface),
              ColorItem(label: "onSurfaceVariant", color: colors.onSurfaceVariant),
              ColorItem(label: "outline", color: colors.outline),
              ColorItem(label: "outlineVariant", color: colors.outlineVariant),
            ]),
          ],
        ),
        ColorChip(label: "inverseSurface", color: colors.inverseSurface, onColors: [
          ColorItem(label: "onInverseSurface", color: colors.onInverseSurface),
          ColorItem(label: "inversePrimary", color: colors.inversePrimary),
        ]),
      ],
    ),
  );
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(color: color, width: 12, height: 12),
          const SizedBox(width: 2),
          Container(alignment: Alignment.center, child: Text(label, style: TextStyle(color: color))).borderAll$(),
        ],
      ).borderAll$(color: color),
    );
  }
}

class ColorChip extends StatelessWidget {
  const ColorChip({
    super.key,
    required this.label,
    required this.color,
    this.onColors = const [],
  });

  final Color color;
  final List<ColorItem> onColors;
  final String label;

  static Color contrastColor(Color color) {
    final Brightness brightness = ThemeData.estimateBrightnessForColor(color);
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(child: Text(label)),
        Container(
          // width: 200,
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                for (var onColor in onColors) onColor.marginAll$(4),
              ],
            ),
          ),
        )

      ],
    ).marginAll$(4).intrinsicWidth$(stepWidth: 200);
  }
}
