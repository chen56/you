// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/gestures/velocity_tracker.dart';
import 'package:note/mate.dart';
import 'dart:ui';
import 'dart:core';

/// class Velocity
class Velocity$Mate extends Velocity with Mate {
  /// Velocity Velocity({required Offset pixelsPerSecond})
  Velocity$Mate(
      {
      /// optionalParameters: {required Offset pixelsPerSecond} , defaultValue:none
      required Offset pixelsPerSecond})
      : super(pixelsPerSecond: pixelsPerSecond) {
    mateCreateName = 'Velocity';
    matePackageUrl = 'package:flutter/gestures.dart';
    mateBuilder = (p) => Velocity$Mate(pixelsPerSecond: p.get('pixelsPerSecond').build());
    mateUse('pixelsPerSecond', pixelsPerSecond, isNamed: true);
  }
}

/// class VelocityEstimate
class VelocityEstimate$Mate extends VelocityEstimate with Mate {
  /// VelocityEstimate VelocityEstimate({required Offset pixelsPerSecond, required double confidence, required Duration duration, required Offset offset})
  VelocityEstimate$Mate({
    /// optionalParameters: {required Offset pixelsPerSecond} , defaultValue:none
    required Offset pixelsPerSecond,

    /// optionalParameters: {required double confidence} , defaultValue:none
    required double confidence,

    /// optionalParameters: {required Duration duration} , defaultValue:none
    required Duration duration,

    /// optionalParameters: {required Offset offset} , defaultValue:none
    required Offset offset,
  }) : super(
          pixelsPerSecond: pixelsPerSecond,
          confidence: confidence,
          duration: duration,
          offset: offset,
        ) {
    mateCreateName = 'VelocityEstimate';
    matePackageUrl = 'package:flutter/gestures.dart';
    mateBuilder = (p) => VelocityEstimate$Mate(
          pixelsPerSecond: p.get('pixelsPerSecond').build(),
          confidence: p.get('confidence').build(),
          duration: p.get('duration').build(),
          offset: p.get('offset').build(),
        );
    mateUse('pixelsPerSecond', pixelsPerSecond, isNamed: true);
    mateUse('confidence', confidence, isNamed: true);
    mateUse('duration', duration, isNamed: true);
    mateUse('offset', offset, isNamed: true);
  }
}

/// class VelocityTracker
class VelocityTracker$Mate extends VelocityTracker with Mate {
  /// VelocityTracker VelocityTracker.withKind(PointerDeviceKind kind)
  VelocityTracker$Mate.withKind(

      /// requiredParameters: PointerDeviceKind kind
      PointerDeviceKind kind)
      : super.withKind(kind) {
    mateCreateName = 'VelocityTracker.withKind';
    matePackageUrl = 'package:flutter/gestures.dart';
    mateBuilder = (p) => VelocityTracker$Mate.withKind(p.get('kind').value);
    mateUse('kind', kind, isNamed: false);
  }
}

/// class IOSScrollViewFlingVelocityTracker extends VelocityTracker
class IOSScrollViewFlingVelocityTracker$Mate extends IOSScrollViewFlingVelocityTracker with Mate {
  /// IOSScrollViewFlingVelocityTracker IOSScrollViewFlingVelocityTracker(PointerDeviceKind kind)
  IOSScrollViewFlingVelocityTracker$Mate(

      /// requiredParameters: PointerDeviceKind kind
      PointerDeviceKind kind)
      : super(kind) {
    mateCreateName = 'IOSScrollViewFlingVelocityTracker';
    matePackageUrl = 'package:flutter/gestures.dart';
    mateBuilder = (p) => IOSScrollViewFlingVelocityTracker$Mate(p.get('kind').value);
    mateUse('kind', kind, isNamed: false);
  }
}

/// class MacOSScrollViewFlingVelocityTracker extends IOSScrollViewFlingVelocityTracker
class MacOSScrollViewFlingVelocityTracker$Mate extends MacOSScrollViewFlingVelocityTracker with Mate {
  /// MacOSScrollViewFlingVelocityTracker MacOSScrollViewFlingVelocityTracker(PointerDeviceKind kind)
  MacOSScrollViewFlingVelocityTracker$Mate(

      /// requiredParameters: PointerDeviceKind kind
      PointerDeviceKind kind)
      : super(kind) {
    mateCreateName = 'MacOSScrollViewFlingVelocityTracker';
    matePackageUrl = 'package:flutter/gestures.dart';
    mateBuilder = (p) => MacOSScrollViewFlingVelocityTracker$Mate(p.get('kind').value);
    mateUse('kind', kind, isNamed: false);
  }
}
