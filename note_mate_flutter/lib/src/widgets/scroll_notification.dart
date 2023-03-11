// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/widgets/scroll_notification.dart';
import 'package:flutter/src/widgets/scroll_metrics.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/gestures/drag_details.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/rendering/viewport_offset.dart';

/// class ScrollStartNotification extends ScrollNotification
class ScrollStartNotification$Mate extends ScrollStartNotification with Mate<ScrollStartNotification$Mate> {
  /// ScrollStartNotification ScrollStartNotification({required ScrollMetrics metrics, required BuildContext? context, DragStartDetails? dragDetails})
  ScrollStartNotification$Mate({
    /// param: {required ScrollMetrics metrics}
    required ScrollMetrics metrics,

    /// param: {required BuildContext? context}
    required BuildContext? context,

    /// param: {DragStartDetails? dragDetails}
    DragStartDetails? dragDetails,
  }) : super(
          metrics: metrics,
          context: context,
          dragDetails: dragDetails,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ScrollStartNotification$Mate(
        metrics: p.getValue('metrics'),
        context: p.getValue('context'),
        dragDetails: p.getValue('dragDetails'),
      ),
    );
    mateParams.set(name: 'metrics', init: metrics);
    mateParams.set(name: 'context', init: context);
    mateParams.set(name: 'dragDetails', init: dragDetails);
  }
}

/// class ScrollUpdateNotification extends ScrollNotification
class ScrollUpdateNotification$Mate extends ScrollUpdateNotification with Mate<ScrollUpdateNotification$Mate> {
  /// ScrollUpdateNotification ScrollUpdateNotification({required ScrollMetrics metrics, required BuildContext context, DragUpdateDetails? dragDetails, double? scrollDelta, int? depth})
  ScrollUpdateNotification$Mate({
    /// param: {required ScrollMetrics metrics}
    required ScrollMetrics metrics,

    /// param: {required BuildContext context}
    required BuildContext context,

    /// param: {DragUpdateDetails? dragDetails}
    DragUpdateDetails? dragDetails,

    /// param: {double? scrollDelta}
    double? scrollDelta,

    /// param: {int? depth}
    int? depth,
  }) : super(
          metrics: metrics,
          context: context,
          dragDetails: dragDetails,
          scrollDelta: scrollDelta,
          depth: depth,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ScrollUpdateNotification$Mate(
        metrics: p.getValue('metrics'),
        context: p.getValue('context'),
        dragDetails: p.getValue('dragDetails'),
        scrollDelta: p.getValue('scrollDelta'),
        depth: p.getValue('depth'),
      ),
    );
    mateParams.set(name: 'metrics', init: metrics);
    mateParams.set(name: 'context', init: context);
    mateParams.set(name: 'dragDetails', init: dragDetails);
    mateParams.set(name: 'scrollDelta', init: scrollDelta);
    mateParams.set(name: 'depth', init: depth);
  }
}

/// class OverscrollNotification extends ScrollNotification
class OverscrollNotification$Mate extends OverscrollNotification with Mate<OverscrollNotification$Mate> {
  /// OverscrollNotification OverscrollNotification({required ScrollMetrics metrics, required BuildContext context, DragUpdateDetails? dragDetails, required double overscroll, double velocity = 0.0})
  OverscrollNotification$Mate({
    /// param: {required ScrollMetrics metrics}
    required ScrollMetrics metrics,

    /// param: {required BuildContext context}
    required BuildContext context,

    /// param: {DragUpdateDetails? dragDetails}
    DragUpdateDetails? dragDetails,

    /// param: {required double overscroll}
    required double overscroll,

    /// param: {double velocity = 0.0}
    required double velocity,
  }) : super(
          metrics: metrics,
          context: context,
          dragDetails: dragDetails,
          overscroll: overscroll,
          velocity: velocity,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => OverscrollNotification$Mate(
        metrics: p.getValue('metrics'),
        context: p.getValue('context'),
        dragDetails: p.getValue('dragDetails'),
        overscroll: p.getValue('overscroll'),
        velocity: p.getValue('velocity'),
      ),
    );
    mateParams.set(name: 'metrics', init: metrics);
    mateParams.set(name: 'context', init: context);
    mateParams.set(name: 'dragDetails', init: dragDetails);
    mateParams.set(name: 'overscroll', init: overscroll);
    mateParams.set(name: 'velocity', init: velocity);
  }
}

/// class ScrollEndNotification extends ScrollNotification
class ScrollEndNotification$Mate extends ScrollEndNotification with Mate<ScrollEndNotification$Mate> {
  /// ScrollEndNotification ScrollEndNotification({required ScrollMetrics metrics, required BuildContext context, DragEndDetails? dragDetails})
  ScrollEndNotification$Mate({
    /// param: {required ScrollMetrics metrics}
    required ScrollMetrics metrics,

    /// param: {required BuildContext context}
    required BuildContext context,

    /// param: {DragEndDetails? dragDetails}
    DragEndDetails? dragDetails,
  }) : super(
          metrics: metrics,
          context: context,
          dragDetails: dragDetails,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ScrollEndNotification$Mate(
        metrics: p.getValue('metrics'),
        context: p.getValue('context'),
        dragDetails: p.getValue('dragDetails'),
      ),
    );
    mateParams.set(name: 'metrics', init: metrics);
    mateParams.set(name: 'context', init: context);
    mateParams.set(name: 'dragDetails', init: dragDetails);
  }
}

/// class UserScrollNotification extends ScrollNotification
class UserScrollNotification$Mate extends UserScrollNotification with Mate<UserScrollNotification$Mate> {
  /// UserScrollNotification UserScrollNotification({required ScrollMetrics metrics, required BuildContext context, required ScrollDirection direction})
  UserScrollNotification$Mate({
    /// param: {required ScrollMetrics metrics}
    required ScrollMetrics metrics,

    /// param: {required BuildContext context}
    required BuildContext context,

    /// param: {required ScrollDirection direction}
    required ScrollDirection direction,
  }) : super(
          metrics: metrics,
          context: context,
          direction: direction,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => UserScrollNotification$Mate(
        metrics: p.getValue('metrics'),
        context: p.getValue('context'),
        direction: p.getValue('direction'),
      ),
    );
    mateParams.set(name: 'metrics', init: metrics);
    mateParams.set(name: 'context', init: context);
    mateParams.set(name: 'direction', init: direction);
  }
}
