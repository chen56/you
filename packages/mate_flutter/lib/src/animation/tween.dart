// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/animation/tween.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'dart:ui' as _i3;
import 'package:flutter/src/animation/curves.dart' as _i4;

/// class Tween<T extends Object?> extends Animatable<T>
class Tween$Mate<T extends Object?> extends _i1.Tween<T> with _i2.Mate {
  /// Tween<T> Tween({T? begin, T? end})
  Tween$Mate({
    /// optionalParameters: {T? begin} , default:none
    super.begin,

    /// optionalParameters: {T? end} , default:none
    super.end,
  })  : mateParams = {
          'begin': _i2.BuilderArg<T?>(
            name: 'begin',
            init: begin,
            isNamed: true,
          ),
          'end': _i2.BuilderArg<T?>(
            name: 'end',
            init: end,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'Tween';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => Tween$Mate<T>(
          begin: p.get('begin').build(),
          end: p.get('end').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ReverseTween<T extends Object?> extends Tween<T>
class ReverseTween$Mate<T extends Object?> extends _i1.ReverseTween<T>
    with _i2.Mate {
  /// ReverseTween<T> ReverseTween(Tween<T> parent)
  ReverseTween$Mate(

      /// requiredParameters: Tween<T> parent
      super.parent)
      : mateParams = {
          'parent': _i2.BuilderArg<_i1.Tween<T>>(
            name: 'parent',
            init: parent,
            isNamed: false,
          )
        },
        super() {
    mateBuilderName = 'ReverseTween';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => ReverseTween$Mate<T>(p.get('parent').value);
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ColorTween extends Tween<Color?>
class ColorTween$Mate extends _i1.ColorTween with _i2.Mate {
  /// ColorTween ColorTween({Color? begin, Color? end})
  ColorTween$Mate({
    /// optionalParameters: {Color? begin} , default:none
    super.begin,

    /// optionalParameters: {Color? end} , default:none
    super.end,
  })  : mateParams = {
          'begin': _i2.BuilderArg<_i3.Color?>(
            name: 'begin',
            init: begin,
            isNamed: true,
          ),
          'end': _i2.BuilderArg<_i3.Color?>(
            name: 'end',
            init: end,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'ColorTween';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => ColorTween$Mate(
          begin: p.get('begin').build(),
          end: p.get('end').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class SizeTween extends Tween<Size?>
class SizeTween$Mate extends _i1.SizeTween with _i2.Mate {
  /// SizeTween SizeTween({Size? begin, Size? end})
  SizeTween$Mate({
    /// optionalParameters: {Size? begin} , default:none
    super.begin,

    /// optionalParameters: {Size? end} , default:none
    super.end,
  })  : mateParams = {
          'begin': _i2.BuilderArg<_i3.Size?>(
            name: 'begin',
            init: begin,
            isNamed: true,
          ),
          'end': _i2.BuilderArg<_i3.Size?>(
            name: 'end',
            init: end,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'SizeTween';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => SizeTween$Mate(
          begin: p.get('begin').build(),
          end: p.get('end').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class RectTween extends Tween<Rect?>
class RectTween$Mate extends _i1.RectTween with _i2.Mate {
  /// RectTween RectTween({Rect? begin, Rect? end})
  RectTween$Mate({
    /// optionalParameters: {Rect? begin} , default:none
    super.begin,

    /// optionalParameters: {Rect? end} , default:none
    super.end,
  })  : mateParams = {
          'begin': _i2.BuilderArg<_i3.Rect?>(
            name: 'begin',
            init: begin,
            isNamed: true,
          ),
          'end': _i2.BuilderArg<_i3.Rect?>(
            name: 'end',
            init: end,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'RectTween';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => RectTween$Mate(
          begin: p.get('begin').build(),
          end: p.get('end').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class IntTween extends Tween<int>
class IntTween$Mate extends _i1.IntTween with _i2.Mate {
  /// IntTween IntTween({int? begin, int? end})
  IntTween$Mate({
    /// optionalParameters: {int? begin} , default:none
    super.begin,

    /// optionalParameters: {int? end} , default:none
    super.end,
  })  : mateParams = {
          'begin': _i2.BuilderArg<int?>(
            name: 'begin',
            init: begin,
            isNamed: true,
          ),
          'end': _i2.BuilderArg<int?>(
            name: 'end',
            init: end,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'IntTween';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => IntTween$Mate(
          begin: p.get('begin').build(),
          end: p.get('end').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class StepTween extends Tween<int>
class StepTween$Mate extends _i1.StepTween with _i2.Mate {
  /// StepTween StepTween({int? begin, int? end})
  StepTween$Mate({
    /// optionalParameters: {int? begin} , default:none
    super.begin,

    /// optionalParameters: {int? end} , default:none
    super.end,
  })  : mateParams = {
          'begin': _i2.BuilderArg<int?>(
            name: 'begin',
            init: begin,
            isNamed: true,
          ),
          'end': _i2.BuilderArg<int?>(
            name: 'end',
            init: end,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'StepTween';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => StepTween$Mate(
          begin: p.get('begin').build(),
          end: p.get('end').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ConstantTween<T> extends Tween<T>
class ConstantTween$Mate<T> extends _i1.ConstantTween<T> with _i2.Mate {
  /// ConstantTween<T> ConstantTween(T value)
  ConstantTween$Mate(

      /// requiredParameters: T value
      super.value)
      : mateParams = {
          'value': _i2.BuilderArg<T>(
            name: 'value',
            init: value,
            isNamed: false,
          )
        },
        super() {
    mateBuilderName = 'ConstantTween';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => ConstantTween$Mate<T>(p.get('value').value);
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class CurveTween extends Animatable<double>
class CurveTween$Mate extends _i1.CurveTween with _i2.Mate {
  /// CurveTween CurveTween({required Curve curve})
  CurveTween$Mate(
      {
      /// optionalParameters: {required Curve curve} , default:none
      required super.curve})
      : mateParams = {
          'curve': _i2.BuilderArg<_i4.Curve>(
            name: 'curve',
            init: curve,
            isNamed: true,
          )
        },
        super() {
    mateBuilderName = 'CurveTween';
    matePackageUrl = 'package:flutter/animation.dart';
    mateBuilder = (p) => CurveTween$Mate(curve: p.get('curve').build());
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}