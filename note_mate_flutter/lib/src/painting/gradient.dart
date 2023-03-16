// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/painting/gradient.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'dart:ui';

/// class GradientRotation extends GradientTransform
class GradientRotation$Mate extends GradientRotation with Mate<GradientRotation$Mate> {
  /// GradientRotation GradientRotation(double radians)
  GradientRotation$Mate(

      /// requiredParameters: double radians
      double radians)
      : super(radians) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => GradientRotation$Mate(p.get('radians').value),
    );
    mateParams.put('radians', radians);
  }
}

/// class LinearGradient extends Gradient
class LinearGradient$Mate extends LinearGradient with Mate<LinearGradient$Mate> {
  /// LinearGradient LinearGradient({AlignmentGeometry begin = Alignment.centerLeft, AlignmentGeometry end = Alignment.centerRight, required List<Color> colors, List<double>? stops, TileMode tileMode = TileMode.clamp, GradientTransform? transform})
  LinearGradient$Mate({
    /// optionalParameters: {AlignmentGeometry begin = Alignment.centerLeft} , hasDefaultValue:true, defaultValueCode:Alignment.centerLeft
    required AlignmentGeometry begin,

    /// optionalParameters: {AlignmentGeometry end = Alignment.centerRight} , hasDefaultValue:true, defaultValueCode:Alignment.centerRight
    required AlignmentGeometry end,

    /// optionalParameters: {required List<Color> colors} , hasDefaultValue:false, defaultValueCode:null
    required List<Color> colors,

    /// optionalParameters: {List<double>? stops} , hasDefaultValue:false, defaultValueCode:null
    List<double>? stops,

    /// optionalParameters: {TileMode tileMode = TileMode.clamp} , hasDefaultValue:true, defaultValueCode:TileMode.clamp
    required TileMode tileMode,

    /// optionalParameters: {GradientTransform? transform} , hasDefaultValue:false, defaultValueCode:null
    GradientTransform? transform,
  }) : super(
          begin: begin,
          end: end,
          colors: colors,
          stops: stops,
          tileMode: tileMode,
          transform: transform,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => LinearGradient$Mate(
        begin: p.get('begin').value,
        end: p.get('end').value,
        colors: p.get('colors').value,
        stops: p.get('stops').value,
        tileMode: p.get('tileMode').value,
        transform: p.get('transform').value,
      ),
    );
    mateParams.put('begin', begin);
    mateParams.put('end', end);
    mateParams.putList('colors', colors);
    mateParams.putList('stops', stops);
    mateParams.put('tileMode', tileMode);
    mateParams.put('transform', transform);
  }
}

/// class RadialGradient extends Gradient
class RadialGradient$Mate extends RadialGradient with Mate<RadialGradient$Mate> {
  /// RadialGradient RadialGradient({AlignmentGeometry center = Alignment.center, double radius = 0.5, required List<Color> colors, List<double>? stops, TileMode tileMode = TileMode.clamp, AlignmentGeometry? focal, double focalRadius = 0.0, GradientTransform? transform})
  RadialGradient$Mate({
    /// optionalParameters: {AlignmentGeometry center = Alignment.center} , hasDefaultValue:true, defaultValueCode:Alignment.center
    required AlignmentGeometry center,

    /// optionalParameters: {double radius = 0.5} , hasDefaultValue:true, defaultValueCode:0.5
    required double radius,

    /// optionalParameters: {required List<Color> colors} , hasDefaultValue:false, defaultValueCode:null
    required List<Color> colors,

    /// optionalParameters: {List<double>? stops} , hasDefaultValue:false, defaultValueCode:null
    List<double>? stops,

    /// optionalParameters: {TileMode tileMode = TileMode.clamp} , hasDefaultValue:true, defaultValueCode:TileMode.clamp
    required TileMode tileMode,

    /// optionalParameters: {AlignmentGeometry? focal} , hasDefaultValue:false, defaultValueCode:null
    AlignmentGeometry? focal,

    /// optionalParameters: {double focalRadius = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double focalRadius,

    /// optionalParameters: {GradientTransform? transform} , hasDefaultValue:false, defaultValueCode:null
    GradientTransform? transform,
  }) : super(
          center: center,
          radius: radius,
          colors: colors,
          stops: stops,
          tileMode: tileMode,
          focal: focal,
          focalRadius: focalRadius,
          transform: transform,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => RadialGradient$Mate(
        center: p.get('center').value,
        radius: p.get('radius').value,
        colors: p.get('colors').value,
        stops: p.get('stops').value,
        tileMode: p.get('tileMode').value,
        focal: p.get('focal').value,
        focalRadius: p.get('focalRadius').value,
        transform: p.get('transform').value,
      ),
    );
    mateParams.put('center', center);
    mateParams.put('radius', radius);
    mateParams.putList('colors', colors);
    mateParams.putList('stops', stops);
    mateParams.put('tileMode', tileMode);
    mateParams.put('focal', focal);
    mateParams.put('focalRadius', focalRadius);
    mateParams.put('transform', transform);
  }
}

/// class SweepGradient extends Gradient
class SweepGradient$Mate extends SweepGradient with Mate<SweepGradient$Mate> {
  /// SweepGradient SweepGradient({AlignmentGeometry center = Alignment.center, double startAngle = 0.0, double endAngle = math.pi * 2, required List<Color> colors, List<double>? stops, TileMode tileMode = TileMode.clamp, GradientTransform? transform})
  SweepGradient$Mate({
    /// optionalParameters: {AlignmentGeometry center = Alignment.center} , hasDefaultValue:true, defaultValueCode:Alignment.center
    required AlignmentGeometry center,

    /// optionalParameters: {double startAngle = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double startAngle,

    /// optionalParameters: {double endAngle = math.pi * 2} , hasDefaultValue:true, defaultValueCode:math.pi * 2
    required double endAngle,

    /// optionalParameters: {required List<Color> colors} , hasDefaultValue:false, defaultValueCode:null
    required List<Color> colors,

    /// optionalParameters: {List<double>? stops} , hasDefaultValue:false, defaultValueCode:null
    List<double>? stops,

    /// optionalParameters: {TileMode tileMode = TileMode.clamp} , hasDefaultValue:true, defaultValueCode:TileMode.clamp
    required TileMode tileMode,

    /// optionalParameters: {GradientTransform? transform} , hasDefaultValue:false, defaultValueCode:null
    GradientTransform? transform,
  }) : super(
          center: center,
          startAngle: startAngle,
          endAngle: endAngle,
          colors: colors,
          stops: stops,
          tileMode: tileMode,
          transform: transform,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => SweepGradient$Mate(
        center: p.get('center').value,
        startAngle: p.get('startAngle').value,
        endAngle: p.get('endAngle').value,
        colors: p.get('colors').value,
        stops: p.get('stops').value,
        tileMode: p.get('tileMode').value,
        transform: p.get('transform').value,
      ),
    );
    mateParams.put('center', center);
    mateParams.put('startAngle', startAngle);
    mateParams.put('endAngle', endAngle);
    mateParams.putList('colors', colors);
    mateParams.putList('stops', stops);
    mateParams.put('tileMode', tileMode);
    mateParams.put('transform', transform);
  }
}
