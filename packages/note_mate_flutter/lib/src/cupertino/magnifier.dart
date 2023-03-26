// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/magnifier.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/animation/curves.dart';
import 'package:flutter/src/widgets/magnifier.dart';
import 'dart:core';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'dart:ui';
import 'package:flutter/src/painting/border_radius.dart';
import 'package:flutter/src/painting/box_shadow.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/animation/animation.dart';

/// class CupertinoTextMagnifier extends StatefulWidget
class CupertinoTextMagnifier$Mate extends CupertinoTextMagnifier with Mate {
  /// CupertinoTextMagnifier CupertinoTextMagnifier({Key? key, Curve animationCurve = Curves.easeOut, required MagnifierController controller, double dragResistance = 10.0, double hideBelowThreshold = 48.0, double horizontalScreenEdgePadding = 10.0, required ValueNotifier<MagnifierInfo> magnifierInfo})
  CupertinoTextMagnifier$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Curve animationCurve = Curves.easeOut} , defaultValue:unprocessed
    required Curve animationCurve,

    /// optionalParameters: {required MagnifierController controller} , defaultValue:none
    required MagnifierController controller,

    /// optionalParameters: {double dragResistance = 10.0} , defaultValue:Literal
    double dragResistance = 10.0,

    /// optionalParameters: {double hideBelowThreshold = 48.0} , defaultValue:Literal
    double hideBelowThreshold = 48.0,

    /// optionalParameters: {double horizontalScreenEdgePadding = 10.0} , defaultValue:Literal
    double horizontalScreenEdgePadding = 10.0,

    /// optionalParameters: {required ValueNotifier<MagnifierInfo> magnifierInfo} , defaultValue:none
    required ValueNotifier<MagnifierInfo> magnifierInfo,
  }) : super(
          key: key,
          animationCurve: animationCurve,
          controller: controller,
          dragResistance: dragResistance,
          hideBelowThreshold: hideBelowThreshold,
          horizontalScreenEdgePadding: horizontalScreenEdgePadding,
          magnifierInfo: magnifierInfo,
        ) {
    mateCreateName = 'CupertinoTextMagnifier';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoTextMagnifier$Mate(
          key: p.get('key').build(),
          animationCurve: p.get('animationCurve').build(),
          controller: p.get('controller').build(),
          dragResistance: p.get('dragResistance').build(),
          hideBelowThreshold: p.get('hideBelowThreshold').build(),
          horizontalScreenEdgePadding: p.get('horizontalScreenEdgePadding').build(),
          magnifierInfo: p.get('magnifierInfo').build(),
        );
    mateUse('key', key);
    mateUse('animationCurve', animationCurve);
    mateUse('controller', controller);
    mateUse('dragResistance', dragResistance);
    mateUse('hideBelowThreshold', hideBelowThreshold);
    mateUse('horizontalScreenEdgePadding', horizontalScreenEdgePadding);
    mateUse('magnifierInfo', magnifierInfo);
  }
}

/// class CupertinoMagnifier extends StatelessWidget
class CupertinoMagnifier$Mate extends CupertinoMagnifier with Mate {
  /// CupertinoMagnifier CupertinoMagnifier({Key? key, Size size = kDefaultSize, BorderRadius borderRadius = const BorderRadius.all(Radius.elliptical(60, 50)), Offset additionalFocalPointOffset = Offset.zero, List<BoxShadow> shadows = const <BoxShadow>[BoxShadow(color: Color.fromARGB(25, 0, 0, 0), blurRadius: 11, spreadRadius: 0.2)], BorderSide borderSide = const BorderSide(color: Color.fromARGB(255, 232, 232, 232)), Animation<double>? inOutAnimation})
  CupertinoMagnifier$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Size size = kDefaultSize} , defaultValue:unprocessed
    required Size size,

    /// optionalParameters: {BorderRadius borderRadius = const BorderRadius.all(Radius.elliptical(60, 50))} , defaultValue:unprocessed
    required BorderRadius borderRadius,

    /// optionalParameters: {Offset additionalFocalPointOffset = Offset.zero} , defaultValue:unprocessed
    required Offset additionalFocalPointOffset,

    /// optionalParameters: {List<BoxShadow> shadows = const <BoxShadow>[BoxShadow(color: Color.fromARGB(25, 0, 0, 0), blurRadius: 11, spreadRadius: 0.2)]} , defaultValue:unprocessed
    required List<BoxShadow> shadows,

    /// optionalParameters: {BorderSide borderSide = const BorderSide(color: Color.fromARGB(255, 232, 232, 232))} , defaultValue:unprocessed
    required BorderSide borderSide,

    /// optionalParameters: {Animation<double>? inOutAnimation} , defaultValue:none
    Animation<double>? inOutAnimation,
  }) : super(
          key: key,
          size: size,
          borderRadius: borderRadius,
          additionalFocalPointOffset: additionalFocalPointOffset,
          shadows: shadows,
          borderSide: borderSide,
          inOutAnimation: inOutAnimation,
        ) {
    mateCreateName = 'CupertinoMagnifier';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoMagnifier$Mate(
          key: p.get('key').build(),
          size: p.get('size').build(),
          borderRadius: p.get('borderRadius').build(),
          additionalFocalPointOffset: p.get('additionalFocalPointOffset').build(),
          shadows: p.get('shadows').build(),
          borderSide: p.get('borderSide').build(),
          inOutAnimation: p.get('inOutAnimation').build(),
        );
    mateUse('key', key);
    mateUse('size', size);
    mateUse('borderRadius', borderRadius);
    mateUse('additionalFocalPointOffset', additionalFocalPointOffset);
    mateUse('shadows', shadows);
    mateUse('borderSide', borderSide);
    mateUse('inOutAnimation', inOutAnimation);
  }
}
