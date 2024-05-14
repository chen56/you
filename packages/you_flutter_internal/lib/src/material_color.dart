import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:you_flutter/better_ui.dart';

@experimental
class MaterialColorRoles extends StatelessWidget {
  const MaterialColorRoles({super.key});
  //可视性
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // final colors = _Colors(colorScheme: colorScheme);
    // List<Widget> canOnSurfaces = colors.onSurfaces
    //     .map(
    //       (e) => FilterChip(
    //         label: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Container(color: e.color, width: 16, height: 16),
    //             const SizedBox(width: 2),
    //             Text(e.label),
    //           ],
    //         ).intrinsicWidth$(stepWidth: 20),
    //         selected: false,
    //         onSelected: (bool selected) {},
    //       ).marginAll$(4),
    //     )
    //     .toList();

    return Column(
      children: [
        Row(children: [
          Column(
            children: [
              _BackgroundBlock(label: "primary", color: colorScheme.primary, onColors: [
                _ForegroundBlock(label: "onPrimary", color: colorScheme.onPrimary),
              ]),
              _BackgroundBlock(label: "secondary", color: colorScheme.secondary, onColors: [
                _ForegroundBlock(label: "onSecondary", color: colorScheme.onSecondary),
              ]),
              _BackgroundBlock(label: "tertiary", color: colorScheme.tertiary, onColors: [
                _ForegroundBlock(label: "onTertiary", color: colorScheme.onTertiary),
              ]),
            ],
          ),
          Column(
            children: [
              _BackgroundBlock(label: "primaryContainer", color: colorScheme.primaryContainer, onColors: [
                _ForegroundBlock(label: "onPrimaryContainer", color: colorScheme.onPrimaryContainer),
              ]),
              _BackgroundBlock(label: "secondaryContainer", color: colorScheme.secondaryContainer, onColors: [
                _ForegroundBlock(label: "onSecondaryContainer", color: colorScheme.onSecondaryContainer),
              ]),
              _BackgroundBlock(label: "tertiaryContainer", color: colorScheme.tertiaryContainer, onColors: [
                _ForegroundBlock(label: "onTertiaryContainer", color: colorScheme.onTertiaryContainer),
              ]),
            ],
          ),
          Column(
            children: [
              _BackgroundBlock(label: "primaryFixed", color: colorScheme.primaryFixed, onColors: [
                _ForegroundBlock(label: "onPrimaryFixed", color: colorScheme.onPrimaryFixed),
              ]),
              _BackgroundBlock(label: "secondaryFixed", color: colorScheme.secondaryFixed, onColors: [
                _ForegroundBlock(label: "onSecondaryFixed", color: colorScheme.onSecondaryFixed),
              ]),
              _BackgroundBlock(label: "tertiaryFixed", color: colorScheme.tertiaryFixed, onColors: [
                _ForegroundBlock(label: "onTertiaryFixed", color: colorScheme.onTertiaryFixed),
              ]),
            ],
          ),

          Column(
            children: [
              _BackgroundBlock(label: "primaryFixedDim", color: colorScheme.primaryFixedDim, onColors: [
                _ForegroundBlock(label: "onPrimaryFixed", color: colorScheme.onPrimaryFixed),
                _ForegroundBlock(label: "onPrimaryFixedVariant", color: colorScheme.onPrimaryFixedVariant),
              ]),
              _BackgroundBlock(label: "secondaryFixedDim", color: colorScheme.secondaryFixedDim, onColors: [
                _ForegroundBlock(label: "onSecondaryFixed", color: colorScheme.onSecondaryFixed),
                _ForegroundBlock(label: "onSecondaryFixedVariant", color: colorScheme.onSecondaryFixedVariant),
              ]),
              _BackgroundBlock(label: "tertiaryFixedDim", color: colorScheme.tertiaryFixedDim, onColors: [
                _ForegroundBlock(label: "onTertiaryFixed", color: colorScheme.onTertiaryFixed),
                _ForegroundBlock(label: "onTertiaryFixedVariant", color: colorScheme.onTertiaryFixedVariant),
              ]),
            ],
          ),
        ],),

        const Divider(),
        Wrap(
          children: [
            _BackgroundBlock(label: "primary", color: colorScheme.primary, onColors: [
              _ForegroundBlock(label: "onPrimary", color: colorScheme.onPrimary),
            ]),
            _BackgroundBlock(label: "secondary", color: colorScheme.secondary, onColors: [
              _ForegroundBlock(label: "onSecondary", color: colorScheme.onSecondary),
            ]),
            _BackgroundBlock(label: "tertiary", color: colorScheme.tertiary, onColors: [
              _ForegroundBlock(label: "onTertiary", color: colorScheme.onTertiary),
            ]),
          ],
        ),
        Wrap(
          children: [
            _BackgroundBlock(label: "primaryContainer", color: colorScheme.primaryContainer, onColors: [
              _ForegroundBlock(label: "onPrimaryContainer", color: colorScheme.onPrimaryContainer),
            ]),
            _BackgroundBlock(label: "secondaryContainer", color: colorScheme.secondaryContainer, onColors: [
              _ForegroundBlock(label: "onSecondaryContainer", color: colorScheme.onSecondaryContainer),
            ]),
            _BackgroundBlock(label: "tertiaryContainer", color: colorScheme.tertiaryContainer, onColors: [
              _ForegroundBlock(label: "onTertiaryContainer", color: colorScheme.onTertiaryContainer),
            ]),
          ],
        ),
        Wrap(
          children: [
            _BackgroundBlock(label: "primaryFixed", color: colorScheme.primaryFixed, onColors: [
              _ForegroundBlock(label: "onPrimaryFixed", color: colorScheme.onPrimaryFixed),
            ]),
            _BackgroundBlock(label: "secondaryFixed", color: colorScheme.secondaryFixed, onColors: [
              _ForegroundBlock(label: "onSecondaryFixed", color: colorScheme.onSecondaryFixed),
            ]),
            _BackgroundBlock(label: "tertiaryFixed", color: colorScheme.tertiaryFixed, onColors: [
              _ForegroundBlock(label: "onTertiaryFixed", color: colorScheme.onTertiaryFixed),
            ]),
          ],
        ),
        Wrap(
          children: [
            _BackgroundBlock(label: "primaryFixedDim", color: colorScheme.primaryFixedDim, onColors: [
              _ForegroundBlock(label: "onPrimaryFixed", color: colorScheme.onPrimaryFixed),
              _ForegroundBlock(label: "onPrimaryFixedVariant", color: colorScheme.onPrimaryFixedVariant),
            ]),
            _BackgroundBlock(label: "secondaryFixedDim", color: colorScheme.secondaryFixedDim, onColors: [
              _ForegroundBlock(label: "onSecondaryFixed", color: colorScheme.onSecondaryFixed),
              _ForegroundBlock(label: "onSecondaryFixedVariant", color: colorScheme.onSecondaryFixedVariant),
            ]),
            _BackgroundBlock(label: "tertiaryFixedDim", color: colorScheme.tertiaryFixedDim, onColors: [
              _ForegroundBlock(label: "onTertiaryFixed", color: colorScheme.onTertiaryFixed),
              _ForegroundBlock(label: "onTertiaryFixedVariant", color: colorScheme.onTertiaryFixedVariant),
            ]),
          ],
        ),
        const Divider(),
        Wrap(
          children: [
            _BackgroundBlock(label: "error", color: colorScheme.error, onColors: [
              _ForegroundBlock(label: "onError", color: colorScheme.onError),
            ]),
            _BackgroundBlock(label: "errorContainer", color: colorScheme.errorContainer, onColors: [
              _ForegroundBlock(label: "onError", color: colorScheme.onErrorContainer),
            ]),
          ],
        ),
        const Divider(),
        Wrap(
          children: [
            _BackgroundBlock(label: "surface", color: colorScheme.surface, onColors: [
              _ForegroundBlock(label: "onSurface", color: colorScheme.onSurface),
              _ForegroundBlock(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _BackgroundBlock(label: "surfaceBright", color: colorScheme.surfaceBright, onColors: [
              _ForegroundBlock(label: "onSurface", color: colorScheme.onSurface),
              _ForegroundBlock(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _BackgroundBlock(label: "surfaceDim", color: colorScheme.surfaceDim, onColors: [
              _ForegroundBlock(label: "onSurface", color: colorScheme.onSurface),
              _ForegroundBlock(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
          ],
        ),
        Wrap(
          children: [
            _BackgroundBlock(label: "surfaceContainerHighest", color: colorScheme.surfaceContainerHighest, onColors: [
              _ForegroundBlock(label: "onSurface", color: colorScheme.onSurface),
              _ForegroundBlock(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _BackgroundBlock(label: "surfaceContainerHigh", color: colorScheme.surfaceContainerHigh, onColors: [
              _ForegroundBlock(label: "onSurface", color: colorScheme.onSurface),
              _ForegroundBlock(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _BackgroundBlock(label: "surfaceContainer", color: colorScheme.surfaceContainer, onColors: [
              _ForegroundBlock(label: "onSurface", color: colorScheme.onSurface),
              _ForegroundBlock(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _BackgroundBlock(label: "surfaceContainerLow", color: colorScheme.surfaceContainerLow, onColors: [
              _ForegroundBlock(label: "onSurface", color: colorScheme.onSurface),
              _ForegroundBlock(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _BackgroundBlock(label: "surfaceContainerLowest", color: colorScheme.surfaceContainerLowest, onColors: [
              _ForegroundBlock(label: "onSurface", color: colorScheme.onSurface),
              _ForegroundBlock(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
          ],
        ),
        const Divider(),
        Wrap(
          children: [
            _BackgroundBlock(label: "inverseSurface", color: colorScheme.inverseSurface, onColors: [
              _ForegroundBlock(label: "onInverseSurface", color: colorScheme.onInverseSurface),
              _ForegroundBlock(label: "inversePrimary", color: colorScheme.inversePrimary),
            ]),
            _BackgroundBlock(label: "surface", color: colorScheme.surface, onColors: [
              _ForegroundBlock(label: "outline", color: colorScheme.outline),
              _ForegroundBlock(label: "outlineVariant", color: colorScheme.outlineVariant),
              _ForegroundBlock(label: "scrim", color: colorScheme.scrim),
              _ForegroundBlock(label: "shadow", color: colorScheme.shadow),
              _ForegroundBlock(label: "surfaceTint", color: colorScheme.surfaceTint),
            ]),
          ],
        ),
      ],
    );
  }
}

class _ForegroundBlock extends StatelessWidget {
  const _ForegroundBlock({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(color: color, width: 16, height: 16),
          const SizedBox(width: 2),
          Container(alignment: Alignment.center, child: Text(label, style: TextStyle(color: color))),
        ],
      ).borderAll$(color: color),
    );
  }
}

class _Colors {
  _Colors({required ColorScheme colorScheme}) {
    all = {
      primary = _ColorData(label: "primary", color: colorScheme.primary),
      onPrimary = _ColorData(label: "onPrimary", color: colorScheme.onPrimary),
      primaryContainer = _ColorData(label: "primaryContainer", color: colorScheme.primaryContainer),
      onPrimaryContainer = _ColorData(label: "onPrimaryContainer", color: colorScheme.onPrimaryContainer),
      primaryFixed = _ColorData(label: "primaryFixed", color: colorScheme.primaryFixed),
      primaryFixedDim = _ColorData(label: "primaryFixedDim", color: colorScheme.primaryFixedDim),
      onPrimaryFixed = _ColorData(label: "onPrimaryFixed", color: colorScheme.onPrimaryFixed),
      onPrimaryFixedVariant = _ColorData(label: "onPrimaryFixedVariant", color: colorScheme.onPrimaryFixedVariant),
      secondary = _ColorData(label: "secondary", color: colorScheme.secondary),
      onSecondary = _ColorData(label: "onSecondary", color: colorScheme.onSecondary),
      secondaryContainer = _ColorData(label: "secondaryContainer", color: colorScheme.secondaryContainer),
      onSecondaryContainer = _ColorData(label: "onSecondaryContainer", color: colorScheme.onSecondaryContainer),
      secondaryFixed = _ColorData(label: "secondaryFixed", color: colorScheme.secondaryFixed),
      secondaryFixedDim = _ColorData(label: "secondaryFixedDim", color: colorScheme.secondaryFixedDim),
      onSecondaryFixed = _ColorData(label: "onSecondaryFixed", color: colorScheme.onSecondaryFixed),
      onSecondaryFixedVariant = _ColorData(label: "onSecondaryFixedVariant", color: colorScheme.onSecondaryFixedVariant),
      tertiary = _ColorData(label: "tertiary", color: colorScheme.tertiary),
      onTertiary = _ColorData(label: "onTertiary", color: colorScheme.onTertiary),
      tertiaryContainer = _ColorData(label: "tertiaryContainer", color: colorScheme.tertiaryContainer),
      onTertiaryContainer = _ColorData(label: "onTertiaryContainer", color: colorScheme.onTertiaryContainer),
      tertiaryFixed = _ColorData(label: "tertiaryFixed", color: colorScheme.tertiaryFixed),
      tertiaryFixedDim = _ColorData(label: "tertiaryFixedDim", color: colorScheme.tertiaryFixedDim),
      onTertiaryFixed = _ColorData(label: "onTertiaryFixed", color: colorScheme.onTertiaryFixed),
      onTertiaryFixedVariant = _ColorData(label: "onTertiaryFixedVariant", color: colorScheme.onTertiaryFixedVariant),
      error = _ColorData(label: "error", color: colorScheme.error),
      onError = _ColorData(label: "onError", color: colorScheme.onError),
      errorContainer = _ColorData(label: "errorContainer", color: colorScheme.errorContainer),
      onErrorContainer = _ColorData(label: "onErrorContainer", color: colorScheme.onErrorContainer),
      outline = _ColorData(label: "outline", color: colorScheme.outline),
      outlineVariant = _ColorData(label: "outlineVariant", color: colorScheme.outlineVariant),
      surface = _ColorData(label: "surface", color: colorScheme.surface),
      surfaceDim = _ColorData(label: "surfaceDim", color: colorScheme.surfaceDim),
      surfaceBright = _ColorData(label: "surfaceBright", color: colorScheme.surfaceBright),
      surfaceContainerLowest = _ColorData(label: "surfaceContainerLowest", color: colorScheme.surfaceContainerLowest),
      surfaceContainerLow = _ColorData(label: "surfaceContainerLow", color: colorScheme.surfaceContainerLow),
      surfaceContainer = _ColorData(label: "surfaceContainer", color: colorScheme.surfaceContainer),
      surfaceContainerHigh = _ColorData(label: "surfaceContainerHigh", color: colorScheme.surfaceContainerHigh),
      surfaceContainerHighest = _ColorData(label: "surfaceContainerHighest", color: colorScheme.surfaceContainerHighest),
      onSurface = _ColorData(label: "onSurface", color: colorScheme.onSurface),
      onSurfaceVariant = _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
      inverseSurface = _ColorData(label: "inverseSurface", color: colorScheme.inverseSurface),
      onInverseSurface = _ColorData(label: "onInverseSurface", color: colorScheme.onInverseSurface),
      inversePrimary = _ColorData(label: "inversePrimary", color: colorScheme.inversePrimary),
      shadow = _ColorData(label: "shadow", color: colorScheme.shadow),
      scrim = _ColorData(label: "scrim", color: colorScheme.scrim),
      surfaceTint = _ColorData(label: "surfaceTint", color: colorScheme.surfaceTint),
    };

    onSurfaces = {
      primary,
      primaryContainer,
      primaryFixed,
      primaryFixedDim,
      secondary,
      secondaryContainer,
      secondaryFixed,
      secondaryFixedDim,
      tertiary,
      tertiaryContainer,
      tertiaryFixed,
      tertiaryFixedDim,
      error,
      errorContainer,
      outline,
      outlineVariant,
      surface,
      surfaceDim,
      surfaceBright,
      surfaceContainerLowest,
      surfaceContainerLow,
      surfaceContainer,
      surfaceContainerHigh,
      surfaceContainerHighest,
      onSurface,
      onSurfaceVariant,
      inverseSurface,
      inversePrimary,
      shadow,
      scrim,
      surfaceTint,
    };
  }

  late final Set<_ColorData> all;

  /// can pub on surface
  late final Set<_ColorData> onSurfaces;

  late final _ColorData primary;
  late final _ColorData onPrimary;
  late final _ColorData primaryContainer;
  late final _ColorData onPrimaryContainer;
  late final _ColorData primaryFixed;
  late final _ColorData primaryFixedDim;
  late final _ColorData onPrimaryFixed;
  late final _ColorData onPrimaryFixedVariant;
  late final _ColorData secondary;
  late final _ColorData onSecondary;
  late final _ColorData secondaryContainer;
  late final _ColorData onSecondaryContainer;
  late final _ColorData secondaryFixed;
  late final _ColorData secondaryFixedDim;
  late final _ColorData onSecondaryFixed;
  late final _ColorData onSecondaryFixedVariant;
  late final _ColorData tertiary;
  late final _ColorData onTertiary;
  late final _ColorData tertiaryContainer;
  late final _ColorData onTertiaryContainer;
  late final _ColorData tertiaryFixed;
  late final _ColorData tertiaryFixedDim;
  late final _ColorData onTertiaryFixed;
  late final _ColorData onTertiaryFixedVariant;
  late final _ColorData error;
  late final _ColorData onError;
  late final _ColorData errorContainer;
  late final _ColorData onErrorContainer;
  late final _ColorData outline;
  late final _ColorData outlineVariant;
  late final _ColorData surface;
  late final _ColorData onSurface;
  late final _ColorData surfaceDim;
  late final _ColorData surfaceBright;
  late final _ColorData surfaceContainerLowest;
  late final _ColorData surfaceContainerLow;
  late final _ColorData surfaceContainer;
  late final _ColorData surfaceContainerHigh;
  late final _ColorData surfaceContainerHighest;
  late final _ColorData onSurfaceVariant;
  late final _ColorData inverseSurface;
  late final _ColorData onInverseSurface;
  late final _ColorData inversePrimary;
  late final _ColorData shadow;
  late final _ColorData scrim;
  late final _ColorData surfaceTint;
}

class _ColorData {
  _ColorData({required this.label, required this.color});

  final String label;
  final Color color;
}

class _BackgroundBlock extends StatelessWidget {
  const _BackgroundBlock({
    required this.label,
    required this.color,
    this.onColors = const [],
  });

  final Color color;
  final List<Widget> onColors;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(child: Text(label)),
        Container(
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
    ).marginAll$(4).intrinsicWidth$(stepWidth: 1);
  }
}
