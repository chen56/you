import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_flutter/state.dart';

@experimental
class MaterialColorRoles extends StatelessWidget {
  MaterialColorRoles({super.key});

  final selectedPutOnSurface = <_ColorData>{}.signal();
  final selectedAll = false.signal();

  //可视性
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colors = _Colors(colorScheme: colorScheme);

    Size maxSizeOfOnSurfaces = Size.zero;
    for (var c in colors.onSurfaces) {
      final Size size = measureWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: _OnBlock(color: c),
      ));
      if (size.width > maxSizeOfOnSurfaces.width) {
        maxSizeOfOnSurfaces = size;
      }
    }
    Size maxSizeOfbackgroundColor = Size.zero;
    for (var c in colors.backgroundColors) {
      final Size size = measureWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Text(c.label),
      ));
      if (size.width > maxSizeOfbackgroundColor.width) {
        maxSizeOfbackgroundColor = size;
      }
    }

    Widget chipCanPutOnColor(_ColorData color) {
      return FilterChip(
        label: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(color: color.color, width: 16, height: 16),
            const SizedBox(width: 2),
            Text(color.label),
          ],
        ).intrinsicWidth$(stepWidth: 200),
        selected: selectedPutOnSurface.contains(color),
        onSelected: (bool selected) {
          if (selected) {
            selectedPutOnSurface.add(color);
          } else {
            selectedPutOnSurface.remove(color);
          }
        },
      );
    }

    _BackgroundBlock _backgroundBlock({required Color color, required String label, List<_ColorData> onColors = const []}) {
      return _BackgroundBlock(label: label, color: color, backgroundColorLabelWidth: maxSizeOfbackgroundColor.width, onColorWidth: maxSizeOfOnSurfaces.width, onColors: onColors);
    }

    var result = Watch((context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _backgroundBlock(label: "primary", color: colorScheme.primary, onColors: [
            _ColorData(label: "onPrimary", color: colorScheme.onPrimary),
          ]),
          _backgroundBlock(label: "secondary", color: colorScheme.secondary, onColors: [
            _ColorData(label: "onSecondary", color: colorScheme.onSecondary),
          ]),
          _backgroundBlock(label: "tertiary", color: colorScheme.tertiary, onColors: [
            _ColorData(label: "onTertiary", color: colorScheme.onTertiary),
          ]),
          _backgroundBlock(label: "primaryContainer", color: colorScheme.primaryContainer, onColors: [
            _ColorData(label: "onPrimaryContainer", color: colorScheme.onPrimaryContainer),
          ]),
          _backgroundBlock(label: "secondaryContainer", color: colorScheme.secondaryContainer, onColors: [
            _ColorData(label: "onSecondaryContainer", color: colorScheme.onSecondaryContainer),
          ]),
          _backgroundBlock(label: "tertiaryContainer", color: colorScheme.tertiaryContainer, onColors: [
            _ColorData(label: "onTertiaryContainer", color: colorScheme.onTertiaryContainer),
          ]),
          _backgroundBlock(label: "primaryFixed", color: colorScheme.primaryFixed, onColors: [
            _ColorData(label: "onPrimaryFixed", color: colorScheme.onPrimaryFixed),
          ]),
          _backgroundBlock(label: "secondaryFixed", color: colorScheme.secondaryFixed, onColors: [
            _ColorData(label: "onSecondaryFixed", color: colorScheme.onSecondaryFixed),
          ]),
          _backgroundBlock(label: "tertiaryFixed", color: colorScheme.tertiaryFixed, onColors: [
            _ColorData(label: "onTertiaryFixed", color: colorScheme.onTertiaryFixed),
          ]),
          _backgroundBlock(label: "primaryFixedDim", color: colorScheme.primaryFixedDim, onColors: [
            _ColorData(label: "onPrimaryFixed", color: colorScheme.onPrimaryFixed),
            _ColorData(label: "onPrimaryFixedVariant", color: colorScheme.onPrimaryFixedVariant),
          ]),
          _backgroundBlock(label: "secondaryFixedDim", color: colorScheme.secondaryFixedDim, onColors: [
            _ColorData(label: "onSecondaryFixed", color: colorScheme.onSecondaryFixed),
            _ColorData(label: "onSecondaryFixedVariant", color: colorScheme.onSecondaryFixedVariant),
          ]),
          _backgroundBlock(label: "tertiaryFixedDim", color: colorScheme.tertiaryFixedDim, onColors: [
            _ColorData(label: "onTertiaryFixed", color: colorScheme.onTertiaryFixed),
            _ColorData(label: "onTertiaryFixedVariant", color: colorScheme.onTertiaryFixedVariant),
          ]),
          _backgroundBlock(label: "error", color: colorScheme.error, onColors: [
            _ColorData(label: "onError", color: colorScheme.onError),
          ]),
          _backgroundBlock(label: "errorContainer", color: colorScheme.errorContainer, onColors: [
            _ColorData(label: "onError", color: colorScheme.onErrorContainer),
          ]),
          _backgroundBlock(label: "inverseSurface", color: colorScheme.inverseSurface, onColors: [
            _ColorData(label: "onInverseSurface", color: colorScheme.onInverseSurface),
            _ColorData(label: "inversePrimary", color: colorScheme.inversePrimary),
          ]),
          _backgroundBlock(label: "surface", color: colorScheme.surface, onColors: [
            _ColorData(label: "onSurface", color: colorScheme.onSurface),
            _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ...selectedPutOnSurface,
          ]),
          _backgroundBlock(label: "surfaceBright", color: colorScheme.surfaceBright, onColors: [
            _ColorData(label: "onSurface", color: colorScheme.onSurface),
            _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ...selectedPutOnSurface,
          ]),
          _backgroundBlock(label: "surfaceDim", color: colorScheme.surfaceDim, onColors: [
            _ColorData(label: "onSurface", color: colorScheme.onSurface),
            _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ...selectedPutOnSurface,
          ]),
          _backgroundBlock(label: "surfaceContainerHighest", color: colorScheme.surfaceContainerHighest, onColors: [
            _ColorData(label: "onSurface", color: colorScheme.onSurface),
            _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ...selectedPutOnSurface,
          ]),
          _backgroundBlock(label: "surfaceContainerHigh", color: colorScheme.surfaceContainerHigh, onColors: [
            _ColorData(label: "onSurface", color: colorScheme.onSurface),
            _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ...selectedPutOnSurface,
          ]),
          _backgroundBlock(label: "surfaceContainer", color: colorScheme.surfaceContainer, onColors: [
            _ColorData(label: "onSurface", color: colorScheme.onSurface),
            _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ...selectedPutOnSurface,
          ]),
          _backgroundBlock(label: "surfaceContainerLow", color: colorScheme.surfaceContainerLow, onColors: [
            _ColorData(label: "onSurface", color: colorScheme.onSurface),
            _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ...selectedPutOnSurface,
          ]),
          _backgroundBlock(label: "surfaceContainerLowest", color: colorScheme.surfaceContainerLowest, onColors: [
            _ColorData(label: "onSurface", color: colorScheme.onSurface),
            _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ...selectedPutOnSurface,
          ]),
          Text("其他可放到surface上的color roles (en:other color roles , can put on surface)", style: Theme.of(context).textTheme.headlineLarge),
          FilterChip(
            label: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("All"),
              ],
            ).intrinsicWidth$(stepWidth: 200),
            selected: selectedAll.value,
            onSelected: (bool selected) {
              if (selected) {
                selectedPutOnSurface.addAll(colors.onSurfaces);
              } else {
                selectedPutOnSurface.clear();
              }
              selectedAll.value = selected;
            },
          ),
          Wrap(
            children: [
              chipCanPutOnColor(colors.primary),
              chipCanPutOnColor(colors.primaryContainer),
              chipCanPutOnColor(colors.primaryFixed),
              chipCanPutOnColor(colors.primaryFixedDim),
            ],
          ),
          Wrap(
            children: [
              chipCanPutOnColor(colors.secondary),
              chipCanPutOnColor(colors.secondaryContainer),
              chipCanPutOnColor(colors.secondaryFixed),
              chipCanPutOnColor(colors.secondaryFixedDim),
            ],
          ),
          Wrap(
            children: [
              chipCanPutOnColor(colors.tertiary),
              chipCanPutOnColor(colors.tertiaryContainer),
              chipCanPutOnColor(colors.tertiaryFixed),
              chipCanPutOnColor(colors.tertiaryFixedDim),
            ],
          ),
          Wrap(
            children: [
              chipCanPutOnColor(colors.error),
              chipCanPutOnColor(colors.errorContainer),
            ],
          ),
          Wrap(
            children: [
              chipCanPutOnColor(colors.outline),
              chipCanPutOnColor(colors.outlineVariant),
            ],
          ),
          Wrap(
            children: [
              chipCanPutOnColor(colors.surface),
              chipCanPutOnColor(colors.surfaceDim),
              chipCanPutOnColor(colors.surfaceBright),
            ],
          ),
          Wrap(
            children: [
              chipCanPutOnColor(colors.surfaceContainerLowest),
              chipCanPutOnColor(colors.surfaceContainerLow),
              chipCanPutOnColor(colors.surfaceContainer),
              chipCanPutOnColor(colors.surfaceContainerHigh),
              chipCanPutOnColor(colors.surfaceContainerHighest),
            ],
          ),
          Wrap(
            children: [
              chipCanPutOnColor(colors.shadow),
              chipCanPutOnColor(colors.scrim),
              chipCanPutOnColor(colors.surfaceTint),
              chipCanPutOnColor(colors.inverseSurface),
            ],
          ),
        ],
      );
    });
    return result;
  }
}

@experimental
class MaterialColorRoles2 extends StatelessWidget {
  const MaterialColorRoles2({super.key});

  //可视性
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colors = _Colors(colorScheme: colorScheme);

    Size maxSize = Size.zero;
    for (var c in colors.onSurfaces) {
      final Size size = measureWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: _OnBlock(color: c),
      ));
      if (size.width > maxSize.width) {
        maxSize = size;
      }
    }
    Size maxSizeOfbackgroundColor = Size.zero;
    for (var c in colors.backgroundColors) {
      final Size size = measureWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: _OnBlock(color: c),
      ));
      if (size.width > maxSizeOfbackgroundColor.width) {
        maxSizeOfbackgroundColor = size;
      }
    }

    _BackgroundBlock _backgroundBlock({required Color color, required String label, List<_ColorData> onColors = const []}) {
      return _BackgroundBlock(label: label, color: color, backgroundColorLabelWidth: maxSizeOfbackgroundColor.width, onColorWidth: maxSize.width, onColors: onColors);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _backgroundBlock(label: "primary", color: colorScheme.primary, onColors: [
          _ColorData(label: "onPrimary", color: colorScheme.onPrimary),
        ]),
        _backgroundBlock(label: "secondary", color: colorScheme.secondary, onColors: [
          _ColorData(label: "onSecondary", color: colorScheme.onSecondary),
        ]),
        _backgroundBlock(label: "tertiary", color: colorScheme.tertiary, onColors: [
          _ColorData(label: "onTertiary", color: colorScheme.onTertiary),
        ]),
        Wrap(
          children: [
            _backgroundBlock(label: "primary", color: colorScheme.primary, onColors: [
              _ColorData(label: "onPrimary", color: colorScheme.onPrimary),
            ]),
            _backgroundBlock(label: "secondary", color: colorScheme.secondary, onColors: [
              _ColorData(label: "onSecondary", color: colorScheme.onSecondary),
            ]),
            _backgroundBlock(label: "tertiary", color: colorScheme.tertiary, onColors: [
              _ColorData(label: "onTertiary", color: colorScheme.onTertiary),
            ]),
          ],
        ),
        Wrap(
          children: [
            _backgroundBlock(label: "primaryContainer", color: colorScheme.primaryContainer, onColors: [
              _ColorData(label: "onPrimaryContainer", color: colorScheme.onPrimaryContainer),
            ]),
            _backgroundBlock(label: "secondaryContainer", color: colorScheme.secondaryContainer, onColors: [
              _ColorData(label: "onSecondaryContainer", color: colorScheme.onSecondaryContainer),
            ]),
            _backgroundBlock(label: "tertiaryContainer", color: colorScheme.tertiaryContainer, onColors: [
              _ColorData(label: "onTertiaryContainer", color: colorScheme.onTertiaryContainer),
            ]),
          ],
        ),
        Wrap(
          children: [
            _backgroundBlock(label: "primaryFixed", color: colorScheme.primaryFixed, onColors: [
              _ColorData(label: "onPrimaryFixed", color: colorScheme.onPrimaryFixed),
            ]),
            _backgroundBlock(label: "secondaryFixed", color: colorScheme.secondaryFixed, onColors: [
              _ColorData(label: "onSecondaryFixed", color: colorScheme.onSecondaryFixed),
            ]),
            _backgroundBlock(label: "tertiaryFixed", color: colorScheme.tertiaryFixed, onColors: [
              _ColorData(label: "onTertiaryFixed", color: colorScheme.onTertiaryFixed),
            ]),
          ],
        ),
        Wrap(
          children: [
            _backgroundBlock(label: "primaryFixedDim", color: colorScheme.primaryFixedDim, onColors: [
              _ColorData(label: "onPrimaryFixed", color: colorScheme.onPrimaryFixed),
              _ColorData(label: "onPrimaryFixedVariant", color: colorScheme.onPrimaryFixedVariant),
            ]),
            _backgroundBlock(label: "secondaryFixedDim", color: colorScheme.secondaryFixedDim, onColors: [
              _ColorData(label: "onSecondaryFixed", color: colorScheme.onSecondaryFixed),
              _ColorData(label: "onSecondaryFixedVariant", color: colorScheme.onSecondaryFixedVariant),
            ]),
            _backgroundBlock(label: "tertiaryFixedDim", color: colorScheme.tertiaryFixedDim, onColors: [
              _ColorData(label: "onTertiaryFixed", color: colorScheme.onTertiaryFixed),
              _ColorData(label: "onTertiaryFixedVariant", color: colorScheme.onTertiaryFixedVariant),
            ]),
          ],
        ),
        const Divider(),
        Wrap(
          children: [
            _backgroundBlock(label: "error", color: colorScheme.error, onColors: [
              _ColorData(label: "onError", color: colorScheme.onError),
            ]),
            _backgroundBlock(label: "errorContainer", color: colorScheme.errorContainer, onColors: [
              _ColorData(label: "onError", color: colorScheme.onErrorContainer),
            ]),
          ],
        ),
        const Divider(),
        Wrap(
          children: [
            _backgroundBlock(label: "surface", color: colorScheme.surface, onColors: [
              _ColorData(label: "onSurface", color: colorScheme.onSurface),
              _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _backgroundBlock(label: "surfaceBright", color: colorScheme.surfaceBright, onColors: [
              _ColorData(label: "onSurface", color: colorScheme.onSurface),
              _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _backgroundBlock(label: "surfaceDim", color: colorScheme.surfaceDim, onColors: [
              _ColorData(label: "onSurface", color: colorScheme.onSurface),
              _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
          ],
        ),
        Wrap(
          children: [
            _backgroundBlock(label: "surfaceContainerHighest", color: colorScheme.surfaceContainerHighest, onColors: [
              _ColorData(label: "onSurface", color: colorScheme.onSurface),
              _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _backgroundBlock(label: "surfaceContainerHigh", color: colorScheme.surfaceContainerHigh, onColors: [
              _ColorData(label: "onSurface", color: colorScheme.onSurface),
              _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _backgroundBlock(label: "surfaceContainer", color: colorScheme.surfaceContainer, onColors: [
              _ColorData(label: "onSurface", color: colorScheme.onSurface),
              _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _backgroundBlock(label: "surfaceContainerLow", color: colorScheme.surfaceContainerLow, onColors: [
              _ColorData(label: "onSurface", color: colorScheme.onSurface),
              _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
            _backgroundBlock(label: "surfaceContainerLowest", color: colorScheme.surfaceContainerLowest, onColors: [
              _ColorData(label: "onSurface", color: colorScheme.onSurface),
              _ColorData(label: "onSurfaceVariant", color: colorScheme.onSurfaceVariant),
            ]),
          ],
        ),
        const Divider(),
        Wrap(
          children: [
            _backgroundBlock(label: "inverseSurface", color: colorScheme.inverseSurface, onColors: [
              _ColorData(label: "onInverseSurface", color: colorScheme.onInverseSurface),
              _ColorData(label: "inversePrimary", color: colorScheme.inversePrimary),
            ]),
            _backgroundBlock(label: "surface", color: colorScheme.surface, onColors: [
              _ColorData(label: "outline", color: colorScheme.outline),
              _ColorData(label: "outlineVariant", color: colorScheme.outlineVariant),
              _ColorData(label: "scrim", color: colorScheme.scrim),
              _ColorData(label: "shadow", color: colorScheme.shadow),
              _ColorData(label: "surfaceTint", color: colorScheme.surfaceTint),
            ]),
          ],
        ),
      ],
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

    backgroundColors = {
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
      surface,
      surfaceDim,
      surfaceBright,
      surfaceContainerLowest,
      surfaceContainerLow,
      surfaceContainer,
      surfaceContainerHigh,
      surfaceContainerHighest,
      inverseSurface,
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
  late final Set<_ColorData> backgroundColors;

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
    required this.onColorWidth,
    required this.backgroundColorLabelWidth,
    required this.label,
    required this.color,
    this.onColors = const [],
  });

  final double onColorWidth;
  final double backgroundColorLabelWidth;
  final Color color;
  final List<_ColorData> onColors;
  final String label;
  static const double widthBuffer = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          color: color,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  width: backgroundColorLabelWidth + widthBuffer+24,
                  child: Row(
                    children: [
                      Icon(Icons.flip_to_back_sharp,color: onColors[0].color,),
                      Text(label, style: TextStyle(color: onColors[0].color)),
                    ],
                  )),
              for (var onColor in onColors)
                _OnBlock(
                  color: onColor,
                ).intrinsicWidth$(stepWidth: onColorWidth + widthBuffer).margin$(const EdgeInsets.symmetric(vertical: 2)),
            ],
          ),
        ).expanded$(),
      ],
    );
  }
}

class _OnBlock extends StatelessWidget {
  const _OnBlock({
    required this.color,
  });

  final _ColorData color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(color: color.color, width: 16, height: 16),
        const SizedBox(width: 2),
        Container(alignment: Alignment.center, child: Text(color.label, style: TextStyle(color: color.color))),
      ],
    ).borderAll$(color: color.color).paddingAll$(2);
  }
}

Size measureWidget(Widget widget) {
  final PipelineOwner pipelineOwner = PipelineOwner();
  final MeasurementView rootView = pipelineOwner.rootNode = MeasurementView();
  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());
  final RenderObjectToWidgetElement<RenderBox> element = RenderObjectToWidgetAdapter<RenderBox>(
    container: rootView,
    debugShortDescription: '[root]',
    child: widget,
  ).attachToRenderTree(buildOwner);
  try {
    rootView.scheduleInitialLayout();
    pipelineOwner.flushLayout();
    return rootView.size;
  } finally {
    // Clean up.
    element.update(RenderObjectToWidgetAdapter<RenderBox>(container: rootView));
    buildOwner.finalizeTree();
  }
}

class MeasurementView extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    assert(child != null);
    child!.layout(const BoxConstraints(), parentUsesSize: true);
    size = child!.size;
  }

  @override
  void debugAssertDoesMeetConstraints() => true;
}
