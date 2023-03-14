// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/icon_theme_data.dart';
import 'dart:core';
import 'dart:ui';
import 'package:note/mate.dart';

/// class IconThemeData with Diagnosticable
class IconThemeData$Mate extends IconThemeData with Mate<IconThemeData$Mate> {
  /// IconThemeData IconThemeData({double? size, double? fill, double? weight, double? grade, double? opticalSize, Color? color, double? opacity, List<Shadow>? shadows})
  IconThemeData$Mate({
    /// optionalParameters: {double? size} , hasDefaultValue:false, defaultValueCode:null
    double? size,

    /// optionalParameters: {double? fill} , hasDefaultValue:false, defaultValueCode:null
    double? fill,

    /// optionalParameters: {double? weight} , hasDefaultValue:false, defaultValueCode:null
    double? weight,

    /// optionalParameters: {double? grade} , hasDefaultValue:false, defaultValueCode:null
    double? grade,

    /// optionalParameters: {double? opticalSize} , hasDefaultValue:false, defaultValueCode:null
    double? opticalSize,

    /// optionalParameters: {Color? color} , hasDefaultValue:false, defaultValueCode:null
    Color? color,

    /// optionalParameters: {double? opacity} , hasDefaultValue:false, defaultValueCode:null
    double? opacity,

    /// optionalParameters: {List<Shadow>? shadows} , hasDefaultValue:false, defaultValueCode:null
    List<Shadow>? shadows,
  }) : super(
          size: size,
          fill: fill,
          weight: weight,
          grade: grade,
          opticalSize: opticalSize,
          color: color,
          opacity: opacity,
          shadows: shadows,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => IconThemeData$Mate(
        size: p.getValue('size'),
        fill: p.getValue('fill'),
        weight: p.getValue('weight'),
        grade: p.getValue('grade'),
        opticalSize: p.getValue('opticalSize'),
        color: p.getValue('color'),
        opacity: p.getValue('opacity'),
        shadows: p.getValue('shadows'),
      ),
    );
    mateParams.set(name: 'size', init: size);
    mateParams.set(name: 'fill', init: fill);
    mateParams.set(name: 'weight', init: weight);
    mateParams.set(name: 'grade', init: grade);
    mateParams.set(name: 'opticalSize', init: opticalSize);
    mateParams.set(name: 'color', init: color);
    mateParams.set(name: 'opacity', init: opacity);
    mateParams.set(name: 'shadows', init: shadows);
  }
}
