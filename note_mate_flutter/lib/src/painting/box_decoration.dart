// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/painting/box_decoration.dart';
import 'dart:ui';
import 'package:flutter/src/painting/decoration_image.dart';
import 'package:flutter/src/painting/box_border.dart';
import 'package:flutter/src/painting/border_radius.dart';
import 'dart:core';
import 'package:flutter/src/painting/box_shadow.dart';
import 'package:flutter/src/painting/gradient.dart';
import 'package:note/mate.dart';

/// class BoxDecoration extends Decoration
class BoxDecoration$Mate extends BoxDecoration with Mate<BoxDecoration$Mate> {
  /// BoxDecoration BoxDecoration({Color? color, DecorationImage? image, BoxBorder? border, BorderRadiusGeometry? borderRadius, List<BoxShadow>? boxShadow, Gradient? gradient, BlendMode? backgroundBlendMode, BoxShape shape = BoxShape.rectangle})
  BoxDecoration$Mate({
    /// param: {Color? color}
    Color? color,

    /// param: {DecorationImage? image}
    DecorationImage? image,

    /// param: {BoxBorder? border}
    BoxBorder? border,

    /// param: {BorderRadiusGeometry? borderRadius}
    BorderRadiusGeometry? borderRadius,

    /// param: {List<BoxShadow>? boxShadow}
    List<BoxShadow>? boxShadow,

    /// param: {Gradient? gradient}
    Gradient? gradient,

    /// param: {BlendMode? backgroundBlendMode}
    BlendMode? backgroundBlendMode,

    /// param: {BoxShape shape = BoxShape.rectangle}
    required BoxShape shape,
  }) : super(
          color: color,
          image: image,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          gradient: gradient,
          backgroundBlendMode: backgroundBlendMode,
          shape: shape,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BoxDecoration$Mate(
        color: p.getValue('color'),
        image: p.getValue('image'),
        border: p.getValue('border'),
        borderRadius: p.getValue('borderRadius'),
        boxShadow: p.getValue('boxShadow'),
        gradient: p.getValue('gradient'),
        backgroundBlendMode: p.getValue('backgroundBlendMode'),
        shape: p.getValue('shape'),
      ),
    );
    mateParams.set(name: 'color', init: color);
    mateParams.set(name: 'image', init: image);
    mateParams.set(name: 'border', init: border);
    mateParams.set(name: 'borderRadius', init: borderRadius);
    mateParams.set(name: 'boxShadow', init: boxShadow);
    mateParams.set(name: 'gradient', init: gradient);
    mateParams.set(name: 'backgroundBlendMode', init: backgroundBlendMode);
    mateParams.set(name: 'shape', init: shape);
  }
}