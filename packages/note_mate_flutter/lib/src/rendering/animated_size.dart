// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/animated_size.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'dart:core';
import 'package:flutter/src/animation/curves.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter/painting.dart';
import 'dart:ui';
import 'package:flutter/src/rendering/box.dart';

/// class RenderAnimatedSize extends RenderAligningShiftedBox
class RenderAnimatedSize$Mate extends RenderAnimatedSize with Mate {
  /// RenderAnimatedSize RenderAnimatedSize({required TickerProvider vsync, required Duration duration, Duration? reverseDuration, Curve curve = Curves.linear, AlignmentGeometry alignment = Alignment.center, TextDirection? textDirection, RenderBox? child, Clip clipBehavior = Clip.hardEdge})
  RenderAnimatedSize$Mate({
    /// optionalParameters: {required TickerProvider vsync} , defaultValue:none
    required TickerProvider vsync,

    /// optionalParameters: {required Duration duration} , defaultValue:none
    required Duration duration,

    /// optionalParameters: {Duration? reverseDuration} , defaultValue:none
    Duration? reverseDuration,

    /// optionalParameters: {Curve curve = Curves.linear} , defaultValue:PrefixedIdentifier
    Curve curve = Curves.linear,

    /// optionalParameters: {AlignmentGeometry alignment = Alignment.center} , defaultValue:PrefixedIdentifier
    AlignmentGeometry alignment = Alignment.center,

    /// optionalParameters: {TextDirection? textDirection} , defaultValue:none
    TextDirection? textDirection,

    /// optionalParameters: {RenderBox? child} , defaultValue:none
    RenderBox? child,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , defaultValue:PrefixedIdentifier
    Clip clipBehavior = Clip.hardEdge,
  }) : super(
          vsync: vsync,
          duration: duration,
          reverseDuration: reverseDuration,
          curve: curve,
          alignment: alignment,
          textDirection: textDirection,
          child: child,
          clipBehavior: clipBehavior,
        ) {
    mateCreateName = 'RenderAnimatedSize';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => RenderAnimatedSize$Mate(
          vsync: p.get('vsync').build(),
          duration: p.get('duration').build(),
          reverseDuration: p.get('reverseDuration').build(),
          curve: p.get('curve').build(),
          alignment: p.get('alignment').build(),
          textDirection: p.get('textDirection').build(),
          child: p.get('child').build(),
          clipBehavior: p.get('clipBehavior').build(),
        );
    mateUse('vsync', vsync, isNamed: true);
    mateUse('duration', duration, isNamed: true);
    mateUse('reverseDuration', reverseDuration, isNamed: true);
    mateUse('curve', curve, isNamed: true);
    mateUse('alignment', alignment, isNamed: true);
    mateUse('textDirection', textDirection, isNamed: true);
    mateUse('child', child, isNamed: true);
    mateUse('clipBehavior', clipBehavior, isNamed: true);
  }
}
