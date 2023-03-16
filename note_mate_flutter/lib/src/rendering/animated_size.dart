// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/animated_size.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'dart:core';
import 'package:flutter/src/animation/curves.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'dart:ui';
import 'package:flutter/src/rendering/box.dart';
import 'package:note/mate.dart';

/// class RenderAnimatedSize extends RenderAligningShiftedBox
class RenderAnimatedSize$Mate extends RenderAnimatedSize with Mate<RenderAnimatedSize$Mate> {
  /// RenderAnimatedSize RenderAnimatedSize({required TickerProvider vsync, required Duration duration, Duration? reverseDuration, Curve curve = Curves.linear, AlignmentGeometry alignment = Alignment.center, TextDirection? textDirection, RenderBox? child, Clip clipBehavior = Clip.hardEdge})
  RenderAnimatedSize$Mate({
    /// optionalParameters: {required TickerProvider vsync} , hasDefaultValue:false, defaultValueCode:null
    required TickerProvider vsync,

    /// optionalParameters: {required Duration duration} , hasDefaultValue:false, defaultValueCode:null
    required Duration duration,

    /// optionalParameters: {Duration? reverseDuration} , hasDefaultValue:false, defaultValueCode:null
    Duration? reverseDuration,

    /// optionalParameters: {Curve curve = Curves.linear} , hasDefaultValue:true, defaultValueCode:Curves.linear
    required Curve curve,

    /// optionalParameters: {AlignmentGeometry alignment = Alignment.center} , hasDefaultValue:true, defaultValueCode:Alignment.center
    required AlignmentGeometry alignment,

    /// optionalParameters: {TextDirection? textDirection} , hasDefaultValue:false, defaultValueCode:null
    TextDirection? textDirection,

    /// optionalParameters: {RenderBox? child} , hasDefaultValue:false, defaultValueCode:null
    RenderBox? child,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , hasDefaultValue:true, defaultValueCode:Clip.hardEdge
    required Clip clipBehavior,
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
    mateParams = ObjectParam(
      init: this,
      builder: (p) => RenderAnimatedSize$Mate(
        vsync: p.get('vsync').value,
        duration: p.get('duration').value,
        reverseDuration: p.get('reverseDuration').value,
        curve: p.get('curve').value,
        alignment: p.get('alignment').value,
        textDirection: p.get('textDirection').value,
        child: p.get('child').value,
        clipBehavior: p.get('clipBehavior').value,
      ),
    );
    mateParams.put('vsync', vsync);
    mateParams.put('duration', duration);
    mateParams.put('reverseDuration', reverseDuration);
    mateParams.put('curve', curve);
    mateParams.put('alignment', alignment);
    mateParams.put('textDirection', textDirection);
    mateParams.put('child', child);
    mateParams.put('clipBehavior', clipBehavior);
  }
}
