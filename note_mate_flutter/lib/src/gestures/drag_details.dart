// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/gestures/drag_details.dart';
import 'dart:ui';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/gestures/velocity_tracker.dart';
export 'dart:ui' show Offset, PointerDeviceKind;
export 'velocity_tracker.dart' show Velocity;

/// class DragDownDetails
class DragDownDetails$Mate extends DragDownDetails with Mate<DragDownDetails$Mate> {
  /// DragDownDetails DragDownDetails({Offset globalPosition = Offset.zero, Offset? localPosition})
  DragDownDetails$Mate({
    /// param: {Offset globalPosition = Offset.zero}
    required Offset globalPosition,

    /// param: {Offset? localPosition}
    Offset? localPosition,
  }) : super(
          globalPosition: globalPosition,
          localPosition: localPosition,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DragDownDetails$Mate(
        globalPosition: p.getValue('globalPosition'),
        localPosition: p.getValue('localPosition'),
      ),
    );
    mateParams.set(name: 'globalPosition', init: globalPosition);
    mateParams.set(name: 'localPosition', init: localPosition);
  }
}

/// class DragStartDetails
class DragStartDetails$Mate extends DragStartDetails with Mate<DragStartDetails$Mate> {
  /// DragStartDetails DragStartDetails({Duration? sourceTimeStamp, Offset globalPosition = Offset.zero, Offset? localPosition, PointerDeviceKind? kind})
  DragStartDetails$Mate({
    /// param: {Duration? sourceTimeStamp}
    Duration? sourceTimeStamp,

    /// param: {Offset globalPosition = Offset.zero}
    required Offset globalPosition,

    /// param: {Offset? localPosition}
    Offset? localPosition,

    /// param: {PointerDeviceKind? kind}
    PointerDeviceKind? kind,
  }) : super(
          sourceTimeStamp: sourceTimeStamp,
          globalPosition: globalPosition,
          localPosition: localPosition,
          kind: kind,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DragStartDetails$Mate(
        sourceTimeStamp: p.getValue('sourceTimeStamp'),
        globalPosition: p.getValue('globalPosition'),
        localPosition: p.getValue('localPosition'),
        kind: p.getValue('kind'),
      ),
    );
    mateParams.set(name: 'sourceTimeStamp', init: sourceTimeStamp);
    mateParams.set(name: 'globalPosition', init: globalPosition);
    mateParams.set(name: 'localPosition', init: localPosition);
    mateParams.set(name: 'kind', init: kind);
  }
}

/// class DragUpdateDetails
class DragUpdateDetails$Mate extends DragUpdateDetails with Mate<DragUpdateDetails$Mate> {
  /// DragUpdateDetails DragUpdateDetails({Duration? sourceTimeStamp, Offset delta = Offset.zero, double? primaryDelta, required Offset globalPosition, Offset? localPosition})
  DragUpdateDetails$Mate({
    /// param: {Duration? sourceTimeStamp}
    Duration? sourceTimeStamp,

    /// param: {Offset delta = Offset.zero}
    required Offset delta,

    /// param: {double? primaryDelta}
    double? primaryDelta,

    /// param: {required Offset globalPosition}
    required Offset globalPosition,

    /// param: {Offset? localPosition}
    Offset? localPosition,
  }) : super(
          sourceTimeStamp: sourceTimeStamp,
          delta: delta,
          primaryDelta: primaryDelta,
          globalPosition: globalPosition,
          localPosition: localPosition,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DragUpdateDetails$Mate(
        sourceTimeStamp: p.getValue('sourceTimeStamp'),
        delta: p.getValue('delta'),
        primaryDelta: p.getValue('primaryDelta'),
        globalPosition: p.getValue('globalPosition'),
        localPosition: p.getValue('localPosition'),
      ),
    );
    mateParams.set(name: 'sourceTimeStamp', init: sourceTimeStamp);
    mateParams.set(name: 'delta', init: delta);
    mateParams.set(name: 'primaryDelta', init: primaryDelta);
    mateParams.set(name: 'globalPosition', init: globalPosition);
    mateParams.set(name: 'localPosition', init: localPosition);
  }
}

/// class DragEndDetails
class DragEndDetails$Mate extends DragEndDetails with Mate<DragEndDetails$Mate> {
  /// DragEndDetails DragEndDetails({Velocity velocity = Velocity.zero, double? primaryVelocity})
  DragEndDetails$Mate({
    /// param: {Velocity velocity = Velocity.zero}
    required Velocity velocity,

    /// param: {double? primaryVelocity}
    double? primaryVelocity,
  }) : super(
          velocity: velocity,
          primaryVelocity: primaryVelocity,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DragEndDetails$Mate(
        velocity: p.getValue('velocity'),
        primaryVelocity: p.getValue('primaryVelocity'),
      ),
    );
    mateParams.set(name: 'velocity', init: velocity);
    mateParams.set(name: 'primaryVelocity', init: primaryVelocity);
  }
}
