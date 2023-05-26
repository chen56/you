// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/material/theme.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/foundation/key.dart' as _i3;
import 'package:flutter/src/material/theme_data.dart' as _i4;
import 'package:flutter/src/widgets/framework.dart' as _i5;
import 'package:flutter/src/animation/curves.dart' as _i6;
import 'package:flutter/animation.dart' as _i7;
import 'dart:ui' as _i8;

/// class Theme extends StatelessWidget
class Theme$Mate extends _i1.Theme with _i2.Mate {
  /// Theme Theme({Key? key, required ThemeData data, required Widget child})
  Theme$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {required ThemeData data} , default:none
    required super.data,

    /// optionalParameters: {required Widget child} , default:none
    required super.child,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i3.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'data': _i2.BuilderArg<_i4.ThemeData>(
            name: 'data',
            init: data,
            isNamed: true,
          ),
          'child': _i2.BuilderArg<_i5.Widget>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'Theme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => Theme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ThemeDataTween extends Tween<ThemeData>
class ThemeDataTween$Mate extends _i1.ThemeDataTween with _i2.Mate {
  /// ThemeDataTween ThemeDataTween({ThemeData? begin, ThemeData? end})
  ThemeDataTween$Mate({
    /// optionalParameters: {ThemeData? begin} , default:none
    super.begin,

    /// optionalParameters: {ThemeData? end} , default:none
    super.end,
  })  : mateParams = {
          'begin': _i2.BuilderArg<_i4.ThemeData?>(
            name: 'begin',
            init: begin,
            isNamed: true,
          ),
          'end': _i2.BuilderArg<_i4.ThemeData?>(
            name: 'end',
            init: end,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'ThemeDataTween';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ThemeDataTween$Mate(
          begin: p.get('begin').build(),
          end: p.get('end').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class AnimatedTheme extends ImplicitlyAnimatedWidget
class AnimatedTheme$Mate extends _i1.AnimatedTheme with _i2.Mate {
  /// AnimatedTheme AnimatedTheme({Key? key, required ThemeData data, Curve curve = Curves.linear, Duration duration = kThemeAnimationDuration, void Function()? onEnd, required Widget child})
  AnimatedTheme$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {required ThemeData data} , default:none
    required super.data,

    /// optionalParameters: {Curve curve = Curves.linear} , default:processed=PrefixedIdentifierImpl
    super.curve,

    /// optionalParameters: {Duration duration = kThemeAnimationDuration} , default:unprocessed=SimpleIdentifierImpl
    super.duration,

    /// optionalParameters: {void Function()? onEnd} , default:none
    super.onEnd,

    /// optionalParameters: {required Widget child} , default:none
    required super.child,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i3.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'data': _i2.BuilderArg<_i4.ThemeData>(
            name: 'data',
            init: data,
            isNamed: true,
          ),
          'curve': _i2.BuilderArg<_i6.Curve>(
            name: 'curve',
            init: curve,
            isNamed: true,
            defaultValue: _i7.Curves.linear,
          ),
          'duration': _i2.BuilderArg<Duration>(
            name: 'duration',
            init: duration,
            isNamed: true,
          ),
          'onEnd': _i2.BuilderArg<_i8.VoidCallback?>(
            name: 'onEnd',
            init: onEnd,
            isNamed: true,
          ),
          'child': _i2.BuilderArg<_i5.Widget>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'AnimatedTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => AnimatedTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          curve: p.get('curve').build(),
          duration: p.get('duration').build(),
          onEnd: p.get('onEnd').build(),
          child: p.get('child').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}