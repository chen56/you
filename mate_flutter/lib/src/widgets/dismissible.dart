// /// Generated by mat_flutter, please don't edit! Created time: 2023-03-09 00:16:01.554596

library;

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';
import 'dart:core';
import 'package:flutter/src/widgets/dismissible.dart';
import 'package:flutter/src/gestures/recognizer.dart';
import 'package:flutter/src/rendering/proxy_box.dart';

/// class Dismissible extends StatefulWidget
class DismissibleMate {
  /// Dismissible Dismissible({required Key key, required Widget child, Widget? background, Widget? secondaryBackground, Future<bool?> Function(DismissDirection)? confirmDismiss, void Function()? onResize, void Function(DismissUpdateDetails)? onUpdate, void Function(DismissDirection)? onDismissed, DismissDirection direction = DismissDirection.horizontal, Duration? resizeDuration = const Duration(milliseconds: 300), Map<DismissDirection, double> dismissThresholds = const <DismissDirection, double>{}, Duration movementDuration = const Duration(milliseconds: 200), double crossAxisEndOffset = 0.0, DragStartBehavior dragStartBehavior = DragStartBehavior.start, HitTestBehavior behavior = HitTestBehavior.opaque})
  DismissibleMate({
// param: {required Key key}
    required Key key,
// param: {required Widget child}
    required Widget child,
// param: {Widget? background}
    Widget? background,
// param: {Widget? secondaryBackground}
    Widget? secondaryBackground,
// param: {Future<bool?> Function(DismissDirection)? confirmDismiss}
    Future<bool?> Function(
      DismissDirection, [
      DismissDirection,
    ])?
        confirmDismiss,
// param: {void Function()? onResize}
    void Function()? onResize,
// param: {void Function(DismissUpdateDetails)? onUpdate}
    void Function(
      DismissUpdateDetails, [
      DismissUpdateDetails,
    ])?
        onUpdate,
// param: {void Function(DismissDirection)? onDismissed}
    void Function(
      DismissDirection, [
      DismissDirection,
    ])?
        onDismissed,
// param: {DismissDirection direction = DismissDirection.horizontal}
    required DismissDirection direction,
// param: {Duration? resizeDuration = const Duration(milliseconds: 300)}
    Duration? resizeDuration,
// param: {Map<DismissDirection, double> dismissThresholds = const <DismissDirection, double>{}}
    required Map<DismissDirection, double> dismissThresholds,
// param: {Duration movementDuration = const Duration(milliseconds: 200)}
    required Duration movementDuration,
// param: {double crossAxisEndOffset = 0.0}
    required double crossAxisEndOffset,
// param: {DragStartBehavior dragStartBehavior = DragStartBehavior.start}
    required DragStartBehavior dragStartBehavior,
// param: {HitTestBehavior behavior = HitTestBehavior.opaque}
    required HitTestBehavior behavior,
  }) {}
}

/// class DismissUpdateDetails
class DismissUpdateDetailsMate {
  /// DismissUpdateDetails DismissUpdateDetails({DismissDirection direction = DismissDirection.horizontal, bool reached = false, bool previousReached = false, double progress = 0.0})
  DismissUpdateDetailsMate({
// param: {DismissDirection direction = DismissDirection.horizontal}
    required DismissDirection direction,
// param: {bool reached = false}
    required bool reached,
// param: {bool previousReached = false}
    required bool previousReached,
// param: {double progress = 0.0}
    required double progress,
  }) {}
}
