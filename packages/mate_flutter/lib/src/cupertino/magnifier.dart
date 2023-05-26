// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/cupertino/magnifier.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/foundation/key.dart' as _i3;
import 'package:flutter/src/animation/curves.dart' as _i4;
import 'package:flutter/animation.dart' as _i5;
import 'package:flutter/src/widgets/magnifier.dart' as _i6;
import 'package:flutter/src/foundation/change_notifier.dart' as _i7;
import 'dart:ui' as _i8;
import 'package:flutter/src/painting/border_radius.dart' as _i9;
import 'package:flutter/src/painting/box_shadow.dart' as _i10;
import 'package:flutter/src/painting/borders.dart' as _i11;
import 'package:flutter/src/animation/animation.dart' as _i12;

/// class CupertinoTextMagnifier extends StatefulWidget
class CupertinoTextMagnifier$Mate extends _i1.CupertinoTextMagnifier
    with _i2.Mate {
  /// CupertinoTextMagnifier CupertinoTextMagnifier({Key? key, Curve animationCurve = Curves.easeOut, required MagnifierController controller, double dragResistance = 10.0, double hideBelowThreshold = 48.0, double horizontalScreenEdgePadding = 10.0, required ValueNotifier<MagnifierInfo> magnifierInfo})
  CupertinoTextMagnifier$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {Curve animationCurve = Curves.easeOut} , default:processed=PrefixedIdentifierImpl
    super.animationCurve,

    /// optionalParameters: {required MagnifierController controller} , default:none
    required super.controller,

    /// optionalParameters: {double dragResistance = 10.0} , default:processed=DoubleLiteralImpl
    super.dragResistance,

    /// optionalParameters: {double hideBelowThreshold = 48.0} , default:processed=DoubleLiteralImpl
    super.hideBelowThreshold,

    /// optionalParameters: {double horizontalScreenEdgePadding = 10.0} , default:processed=DoubleLiteralImpl
    super.horizontalScreenEdgePadding,

    /// optionalParameters: {required ValueNotifier<MagnifierInfo> magnifierInfo} , default:none
    required super.magnifierInfo,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i3.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'animationCurve': _i2.BuilderArg<_i4.Curve>(
            name: 'animationCurve',
            init: animationCurve,
            isNamed: true,
            defaultValue: _i5.Curves.easeOut,
          ),
          'controller': _i2.BuilderArg<_i6.MagnifierController>(
            name: 'controller',
            init: controller,
            isNamed: true,
          ),
          'dragResistance': _i2.BuilderArg<double>(
            name: 'dragResistance',
            init: dragResistance,
            isNamed: true,
            defaultValue: 10.0,
          ),
          'hideBelowThreshold': _i2.BuilderArg<double>(
            name: 'hideBelowThreshold',
            init: hideBelowThreshold,
            isNamed: true,
            defaultValue: 48.0,
          ),
          'horizontalScreenEdgePadding': _i2.BuilderArg<double>(
            name: 'horizontalScreenEdgePadding',
            init: horizontalScreenEdgePadding,
            isNamed: true,
            defaultValue: 10.0,
          ),
          'magnifierInfo': _i2.BuilderArg<_i7.ValueNotifier<_i6.MagnifierInfo>>(
            name: 'magnifierInfo',
            init: magnifierInfo,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'CupertinoTextMagnifier';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoTextMagnifier$Mate(
          key: p.get('key').build(),
          animationCurve: p.get('animationCurve').build(),
          controller: p.get('controller').build(),
          dragResistance: p.get('dragResistance').build(),
          hideBelowThreshold: p.get('hideBelowThreshold').build(),
          horizontalScreenEdgePadding:
              p.get('horizontalScreenEdgePadding').build(),
          magnifierInfo: p.get('magnifierInfo').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class CupertinoMagnifier extends StatelessWidget
class CupertinoMagnifier$Mate extends _i1.CupertinoMagnifier with _i2.Mate {
  /// CupertinoMagnifier CupertinoMagnifier({Key? key, Size size = kDefaultSize, BorderRadius borderRadius = const BorderRadius.all(Radius.elliptical(60, 50)), Offset additionalFocalPointOffset = Offset.zero, List<BoxShadow> shadows = const <BoxShadow>[BoxShadow(color: Color.fromARGB(25, 0, 0, 0), blurRadius: 11, spreadRadius: 0.2)], BorderSide borderSide = const BorderSide(color: Color.fromARGB(255, 232, 232, 232)), Animation<double>? inOutAnimation})
  CupertinoMagnifier$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {Size size = kDefaultSize} , default:unprocessed=SimpleIdentifierImpl
    super.size,

    /// optionalParameters: {BorderRadius borderRadius = const BorderRadius.all(Radius.elliptical(60, 50))} , default:unprocessed=InstanceCreationExpressionImpl
    super.borderRadius,

    /// optionalParameters: {Offset additionalFocalPointOffset = Offset.zero} , default:processed=PrefixedIdentifierImpl
    super.additionalFocalPointOffset,

    /// optionalParameters: {List<BoxShadow> shadows = const <BoxShadow>[BoxShadow(color: Color.fromARGB(25, 0, 0, 0), blurRadius: 11, spreadRadius: 0.2)]} , default:unprocessed=ListLiteralImpl
    super.shadows,

    /// optionalParameters: {BorderSide borderSide = const BorderSide(color: Color.fromARGB(255, 232, 232, 232))} , default:unprocessed=InstanceCreationExpressionImpl
    super.borderSide,

    /// optionalParameters: {Animation<double>? inOutAnimation} , default:none
    super.inOutAnimation,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i3.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'size': _i2.BuilderArg<_i8.Size>(
            name: 'size',
            init: size,
            isNamed: true,
          ),
          'borderRadius': _i2.BuilderArg<_i9.BorderRadius>(
            name: 'borderRadius',
            init: borderRadius,
            isNamed: true,
          ),
          'additionalFocalPointOffset': _i2.BuilderArg<_i8.Offset>(
            name: 'additionalFocalPointOffset',
            init: additionalFocalPointOffset,
            isNamed: true,
            defaultValue: _i5.Offset.zero,
          ),
          'shadows': _i2.BuilderArg<List<_i10.BoxShadow>>(
            name: 'shadows',
            init: shadows,
            isNamed: true,
          ),
          'borderSide': _i2.BuilderArg<_i11.BorderSide>(
            name: 'borderSide',
            init: borderSide,
            isNamed: true,
          ),
          'inOutAnimation': _i2.BuilderArg<_i12.Animation<double>?>(
            name: 'inOutAnimation',
            init: inOutAnimation,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'CupertinoMagnifier';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoMagnifier$Mate(
          key: p.get('key').build(),
          size: p.get('size').build(),
          borderRadius: p.get('borderRadius').build(),
          additionalFocalPointOffset:
              p.get('additionalFocalPointOffset').build(),
          shadows: p.get('shadows').build(),
          borderSide: p.get('borderSide').build(),
          inOutAnimation: p.get('inOutAnimation').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}