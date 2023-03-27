// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/material.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/painting/border_radius.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class Material extends StatefulWidget
class Material$Mate extends Material with Mate {
  /// Material Material({Key? key, MaterialType type = MaterialType.canvas, double elevation = 0.0, Color? color, Color? shadowColor, Color? surfaceTintColor, TextStyle? textStyle, BorderRadiusGeometry? borderRadius, ShapeBorder? shape, bool borderOnForeground = true, Clip clipBehavior = Clip.none, Duration animationDuration = kThemeChangeDuration, Widget? child})
  Material$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {MaterialType type = MaterialType.canvas} , defaultValue:PrefixedIdentifier
    MaterialType type = MaterialType.canvas,

    /// optionalParameters: {double elevation = 0.0} , defaultValue:Literal
    double elevation = 0.0,

    /// optionalParameters: {Color? color} , defaultValue:none
    Color? color,

    /// optionalParameters: {Color? shadowColor} , defaultValue:none
    Color? shadowColor,

    /// optionalParameters: {Color? surfaceTintColor} , defaultValue:none
    Color? surfaceTintColor,

    /// optionalParameters: {TextStyle? textStyle} , defaultValue:none
    TextStyle? textStyle,

    /// optionalParameters: {BorderRadiusGeometry? borderRadius} , defaultValue:none
    BorderRadiusGeometry? borderRadius,

    /// optionalParameters: {ShapeBorder? shape} , defaultValue:none
    ShapeBorder? shape,

    /// optionalParameters: {bool borderOnForeground = true} , defaultValue:Literal
    bool borderOnForeground = true,

    /// optionalParameters: {Clip clipBehavior = Clip.none} , defaultValue:PrefixedIdentifier
    Clip clipBehavior = Clip.none,

    /// optionalParameters: {Duration animationDuration = kThemeChangeDuration} , defaultValue:unprocessed
    required Duration animationDuration,

    /// optionalParameters: {Widget? child} , defaultValue:none
    Widget? child,
  }) : super(
          key: key,
          type: type,
          elevation: elevation,
          color: color,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          textStyle: textStyle,
          borderRadius: borderRadius,
          shape: shape,
          borderOnForeground: borderOnForeground,
          clipBehavior: clipBehavior,
          animationDuration: animationDuration,
          child: child,
        ) {
    mateCreateName = 'Material';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => Material$Mate(
          key: p.get('key').build(),
          type: p.get('type').build(),
          elevation: p.get('elevation').build(),
          color: p.get('color').build(),
          shadowColor: p.get('shadowColor').build(),
          surfaceTintColor: p.get('surfaceTintColor').build(),
          textStyle: p.get('textStyle').build(),
          borderRadius: p.get('borderRadius').build(),
          shape: p.get('shape').build(),
          borderOnForeground: p.get('borderOnForeground').build(),
          clipBehavior: p.get('clipBehavior').build(),
          animationDuration: p.get('animationDuration').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('type', type, isNamed: true);
    mateUse('elevation', elevation, isNamed: true);
    mateUse('color', color, isNamed: true);
    mateUse('shadowColor', shadowColor, isNamed: true);
    mateUse('surfaceTintColor', surfaceTintColor, isNamed: true);
    mateUse('textStyle', textStyle, isNamed: true);
    mateUse('borderRadius', borderRadius, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('borderOnForeground', borderOnForeground, isNamed: true);
    mateUse('clipBehavior', clipBehavior, isNamed: true);
    mateUse('animationDuration', animationDuration, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}

/// class ShapeBorderTween extends Tween<ShapeBorder?>
class ShapeBorderTween$Mate extends ShapeBorderTween with Mate {
  /// ShapeBorderTween ShapeBorderTween({ShapeBorder? begin, ShapeBorder? end})
  ShapeBorderTween$Mate({
    /// optionalParameters: {ShapeBorder? begin} , defaultValue:none
    ShapeBorder? begin,

    /// optionalParameters: {ShapeBorder? end} , defaultValue:none
    ShapeBorder? end,
  }) : super(
          begin: begin,
          end: end,
        ) {
    mateCreateName = 'ShapeBorderTween';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ShapeBorderTween$Mate(
          begin: p.get('begin').build(),
          end: p.get('end').build(),
        );
    mateUse('begin', begin, isNamed: true);
    mateUse('end', end, isNamed: true);
  }
}
