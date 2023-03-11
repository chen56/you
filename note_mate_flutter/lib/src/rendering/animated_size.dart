// /// Generated by mate_flutter, please don't edit!

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
    /// param: {required TickerProvider vsync}
    required TickerProvider vsync,

    /// param: {required Duration duration}
    required Duration duration,

    /// param: {Duration? reverseDuration}
    Duration? reverseDuration,

    /// param: {Curve curve = Curves.linear}
    required Curve curve,

    /// param: {AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,

    /// param: {TextDirection? textDirection}
    TextDirection? textDirection,

    /// param: {RenderBox? child}
    RenderBox? child,

    /// param: {Clip clipBehavior = Clip.hardEdge}
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
    mateParams = Params(
      init: this,
      builder: (p) => RenderAnimatedSize$Mate(
        vsync: p.getValue('vsync'),
        duration: p.getValue('duration'),
        reverseDuration: p.getValue('reverseDuration'),
        curve: p.getValue('curve'),
        alignment: p.getValue('alignment'),
        textDirection: p.getValue('textDirection'),
        child: p.getValue('child'),
        clipBehavior: p.getValue('clipBehavior'),
      ),
    );
    mateParams.set(name: 'vsync', init: vsync);
    mateParams.set(name: 'duration', init: duration);
    mateParams.set(name: 'reverseDuration', init: reverseDuration);
    mateParams.set(name: 'curve', init: curve);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'textDirection', init: textDirection);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
  }
}
