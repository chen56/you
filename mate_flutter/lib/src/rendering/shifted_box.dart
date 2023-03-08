// /// Generated by mat_flutter, please don't edit! Created time: 2023-03-09 00:16:01.226620

library;

import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'dart:ui';
import 'package:flutter/src/painting/alignment.dart';
import 'dart:core';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/src/rendering/shifted_box.dart';

/// abstract class RenderShiftedBox extends RenderBox with RenderObjectWithChildMixin<RenderBox>
abstract class RenderShiftedBoxMate {
  /// RenderShiftedBox RenderShiftedBox(RenderBox? child)
  RenderShiftedBoxMate(
// param: RenderBox? child
      RenderBox? child) {}
}

/// class RenderPadding extends RenderShiftedBox
class RenderPaddingMate {
  /// RenderPadding RenderPadding({required EdgeInsetsGeometry padding, TextDirection? textDirection, RenderBox? child})
  RenderPaddingMate({
// param: {required EdgeInsetsGeometry padding}
    required EdgeInsetsGeometry padding,
// param: {TextDirection? textDirection}
    TextDirection? textDirection,
// param: {RenderBox? child}
    RenderBox? child,
  }) {}
}

/// abstract class RenderAligningShiftedBox extends RenderShiftedBox
abstract class RenderAligningShiftedBoxMate {
  /// RenderAligningShiftedBox RenderAligningShiftedBox({AlignmentGeometry alignment = Alignment.center, required TextDirection? textDirection, RenderBox? child})
  RenderAligningShiftedBoxMate({
// param: {AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,
// param: {required TextDirection? textDirection}
    required TextDirection? textDirection,
// param: {RenderBox? child}
    RenderBox? child,
  }) {}
}

/// class RenderPositionedBox extends RenderAligningShiftedBox
class RenderPositionedBoxMate {
  /// RenderPositionedBox RenderPositionedBox({RenderBox? child, double? widthFactor, double? heightFactor, AlignmentGeometry alignment = Alignment.center, TextDirection? textDirection})
  RenderPositionedBoxMate({
// param: {RenderBox? child}
    RenderBox? child,
// param: {double? widthFactor}
    double? widthFactor,
// param: {double? heightFactor}
    double? heightFactor,
// param: {AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,
// param: {TextDirection? textDirection}
    TextDirection? textDirection,
  }) {}
}

/// class RenderConstrainedOverflowBox extends RenderAligningShiftedBox
class RenderConstrainedOverflowBoxMate {
  /// RenderConstrainedOverflowBox RenderConstrainedOverflowBox({RenderBox? child, double? minWidth, double? maxWidth, double? minHeight, double? maxHeight, AlignmentGeometry alignment = Alignment.center, TextDirection? textDirection})
  RenderConstrainedOverflowBoxMate({
// param: {RenderBox? child}
    RenderBox? child,
// param: {double? minWidth}
    double? minWidth,
// param: {double? maxWidth}
    double? maxWidth,
// param: {double? minHeight}
    double? minHeight,
// param: {double? maxHeight}
    double? maxHeight,
// param: {AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,
// param: {TextDirection? textDirection}
    TextDirection? textDirection,
  }) {}
}

/// class RenderConstraintsTransformBox extends RenderAligningShiftedBox with DebugOverflowIndicatorMixin
class RenderConstraintsTransformBoxMate {
  /// RenderConstraintsTransformBox RenderConstraintsTransformBox({required AlignmentGeometry alignment = Alignment.center, required TextDirection? textDirection, required BoxConstraints Function(BoxConstraints) constraintsTransform, RenderBox? child, Clip clipBehavior = Clip.none})
  RenderConstraintsTransformBoxMate({
// param: {required AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,
// param: {required TextDirection? textDirection}
    required TextDirection? textDirection,
// param: {required BoxConstraints Function(BoxConstraints) constraintsTransform}
    required BoxConstraints Function(
      BoxConstraints, [
      BoxConstraints,
    ])
        constraintsTransform,
// param: {RenderBox? child}
    RenderBox? child,
// param: {Clip clipBehavior = Clip.none}
    required Clip clipBehavior,
  }) {}
}

/// class RenderSizedOverflowBox extends RenderAligningShiftedBox
class RenderSizedOverflowBoxMate {
  /// RenderSizedOverflowBox RenderSizedOverflowBox({RenderBox? child, required Size requestedSize, AlignmentGeometry alignment = Alignment.center, TextDirection? textDirection})
  RenderSizedOverflowBoxMate({
// param: {RenderBox? child}
    RenderBox? child,
// param: {required Size requestedSize}
    required Size requestedSize,
// param: {AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,
// param: {TextDirection? textDirection}
    TextDirection? textDirection,
  }) {}
}

/// class RenderFractionallySizedOverflowBox extends RenderAligningShiftedBox
class RenderFractionallySizedOverflowBoxMate {
  /// RenderFractionallySizedOverflowBox RenderFractionallySizedOverflowBox({RenderBox? child, double? widthFactor, double? heightFactor, AlignmentGeometry alignment = Alignment.center, TextDirection? textDirection})
  RenderFractionallySizedOverflowBoxMate({
// param: {RenderBox? child}
    RenderBox? child,
// param: {double? widthFactor}
    double? widthFactor,
// param: {double? heightFactor}
    double? heightFactor,
// param: {AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,
// param: {TextDirection? textDirection}
    TextDirection? textDirection,
  }) {}
}

/// abstract class SingleChildLayoutDelegate
abstract class SingleChildLayoutDelegateMate {
  /// SingleChildLayoutDelegate SingleChildLayoutDelegate({Listenable? relayout})
  SingleChildLayoutDelegateMate(
      {
// param: {Listenable? relayout}
      Listenable? relayout}) {}
}

/// class RenderCustomSingleChildLayoutBox extends RenderShiftedBox
class RenderCustomSingleChildLayoutBoxMate {
  /// RenderCustomSingleChildLayoutBox RenderCustomSingleChildLayoutBox({RenderBox? child, required SingleChildLayoutDelegate delegate})
  RenderCustomSingleChildLayoutBoxMate({
// param: {RenderBox? child}
    RenderBox? child,
// param: {required SingleChildLayoutDelegate delegate}
    required SingleChildLayoutDelegate delegate,
  }) {}
}

/// class RenderBaseline extends RenderShiftedBox
class RenderBaselineMate {
  /// RenderBaseline RenderBaseline({RenderBox? child, required double baseline, required TextBaseline baselineType})
  RenderBaselineMate({
// param: {RenderBox? child}
    RenderBox? child,
// param: {required double baseline}
    required double baseline,
// param: {required TextBaseline baselineType}
    required TextBaseline baselineType,
  }) {}
}
