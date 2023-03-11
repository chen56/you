// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/rendering/shifted_box.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'dart:ui';
import 'package:flutter/src/rendering/box.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/painting/alignment.dart';

/// class RenderPadding extends RenderShiftedBox
class RenderPadding$Mate extends RenderPadding with Mate<RenderPadding$Mate> {
  /// RenderPadding RenderPadding({required EdgeInsetsGeometry padding, TextDirection? textDirection, RenderBox? child})
  RenderPadding$Mate({
    /// param: {required EdgeInsetsGeometry padding}
    required EdgeInsetsGeometry padding,

    /// param: {TextDirection? textDirection}
    TextDirection? textDirection,

    /// param: {RenderBox? child}
    RenderBox? child,
  }) : super(
          padding: padding,
          textDirection: textDirection,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderPadding$Mate(
        padding: p.getValue('padding'),
        textDirection: p.getValue('textDirection'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'padding', init: padding);
    mateParams.set(name: 'textDirection', init: textDirection);
    mateParams.set(name: 'child', init: child);
  }
}

/// class RenderPositionedBox extends RenderAligningShiftedBox
class RenderPositionedBox$Mate extends RenderPositionedBox with Mate<RenderPositionedBox$Mate> {
  /// RenderPositionedBox RenderPositionedBox({RenderBox? child, double? widthFactor, double? heightFactor, AlignmentGeometry alignment = Alignment.center, TextDirection? textDirection})
  RenderPositionedBox$Mate({
    /// param: {RenderBox? child}
    RenderBox? child,

    /// param: {double? widthFactor}
    double? widthFactor,

    /// param: {double? heightFactor}
    double? heightFactor,

    /// param: {AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,

    /// param: {TextDirection? textDirection}
    TextDirection? textDirection,
  }) : super(
          child: child,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          alignment: alignment,
          textDirection: textDirection,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderPositionedBox$Mate(
        child: p.getValue('child'),
        widthFactor: p.getValue('widthFactor'),
        heightFactor: p.getValue('heightFactor'),
        alignment: p.getValue('alignment'),
        textDirection: p.getValue('textDirection'),
      ),
    );
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'widthFactor', init: widthFactor);
    mateParams.set(name: 'heightFactor', init: heightFactor);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'textDirection', init: textDirection);
  }
}

/// class RenderConstrainedOverflowBox extends RenderAligningShiftedBox
class RenderConstrainedOverflowBox$Mate extends RenderConstrainedOverflowBox
    with Mate<RenderConstrainedOverflowBox$Mate> {
  /// RenderConstrainedOverflowBox RenderConstrainedOverflowBox({RenderBox? child, double? minWidth, double? maxWidth, double? minHeight, double? maxHeight, AlignmentGeometry alignment = Alignment.center, TextDirection? textDirection})
  RenderConstrainedOverflowBox$Mate({
    /// param: {RenderBox? child}
    RenderBox? child,

    /// param: {double? minWidth}
    double? minWidth,

    /// param: {double? maxWidth}
    double? maxWidth,

    /// param: {double? minHeight}
    double? minHeight,

    /// param: {double? maxHeight}
    double? maxHeight,

    /// param: {AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,

    /// param: {TextDirection? textDirection}
    TextDirection? textDirection,
  }) : super(
          child: child,
          minWidth: minWidth,
          maxWidth: maxWidth,
          minHeight: minHeight,
          maxHeight: maxHeight,
          alignment: alignment,
          textDirection: textDirection,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderConstrainedOverflowBox$Mate(
        child: p.getValue('child'),
        minWidth: p.getValue('minWidth'),
        maxWidth: p.getValue('maxWidth'),
        minHeight: p.getValue('minHeight'),
        maxHeight: p.getValue('maxHeight'),
        alignment: p.getValue('alignment'),
        textDirection: p.getValue('textDirection'),
      ),
    );
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'minWidth', init: minWidth);
    mateParams.set(name: 'maxWidth', init: maxWidth);
    mateParams.set(name: 'minHeight', init: minHeight);
    mateParams.set(name: 'maxHeight', init: maxHeight);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'textDirection', init: textDirection);
  }
}

/// class RenderConstraintsTransformBox extends RenderAligningShiftedBox with DebugOverflowIndicatorMixin
class RenderConstraintsTransformBox$Mate extends RenderConstraintsTransformBox
    with Mate<RenderConstraintsTransformBox$Mate> {
  /// RenderConstraintsTransformBox RenderConstraintsTransformBox({required AlignmentGeometry alignment = Alignment.center, required TextDirection? textDirection, required BoxConstraints Function(BoxConstraints) constraintsTransform, RenderBox? child, Clip clipBehavior = Clip.none})
  RenderConstraintsTransformBox$Mate({
    /// param: {required AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,

    /// param: {required TextDirection? textDirection}
    required TextDirection? textDirection,

    /// param: {required BoxConstraints Function(BoxConstraints) constraintsTransform}
    required BoxConstraintsTransform constraintsTransform,

    /// param: {RenderBox? child}
    RenderBox? child,

    /// param: {Clip clipBehavior = Clip.none}
    required Clip clipBehavior,
  }) : super(
          alignment: alignment,
          textDirection: textDirection,
          constraintsTransform: constraintsTransform,
          child: child,
          clipBehavior: clipBehavior,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderConstraintsTransformBox$Mate(
        alignment: p.getValue('alignment'),
        textDirection: p.getValue('textDirection'),
        constraintsTransform: p.getValue('constraintsTransform'),
        child: p.getValue('child'),
        clipBehavior: p.getValue('clipBehavior'),
      ),
    );
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'textDirection', init: textDirection);
    mateParams.set(name: 'constraintsTransform', init: constraintsTransform);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
  }
}

/// class RenderSizedOverflowBox extends RenderAligningShiftedBox
class RenderSizedOverflowBox$Mate extends RenderSizedOverflowBox with Mate<RenderSizedOverflowBox$Mate> {
  /// RenderSizedOverflowBox RenderSizedOverflowBox({RenderBox? child, required Size requestedSize, AlignmentGeometry alignment = Alignment.center, TextDirection? textDirection})
  RenderSizedOverflowBox$Mate({
    /// param: {RenderBox? child}
    RenderBox? child,

    /// param: {required Size requestedSize}
    required Size requestedSize,

    /// param: {AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,

    /// param: {TextDirection? textDirection}
    TextDirection? textDirection,
  }) : super(
          child: child,
          requestedSize: requestedSize,
          alignment: alignment,
          textDirection: textDirection,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderSizedOverflowBox$Mate(
        child: p.getValue('child'),
        requestedSize: p.getValue('requestedSize'),
        alignment: p.getValue('alignment'),
        textDirection: p.getValue('textDirection'),
      ),
    );
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'requestedSize', init: requestedSize);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'textDirection', init: textDirection);
  }
}

/// class RenderFractionallySizedOverflowBox extends RenderAligningShiftedBox
class RenderFractionallySizedOverflowBox$Mate extends RenderFractionallySizedOverflowBox
    with Mate<RenderFractionallySizedOverflowBox$Mate> {
  /// RenderFractionallySizedOverflowBox RenderFractionallySizedOverflowBox({RenderBox? child, double? widthFactor, double? heightFactor, AlignmentGeometry alignment = Alignment.center, TextDirection? textDirection})
  RenderFractionallySizedOverflowBox$Mate({
    /// param: {RenderBox? child}
    RenderBox? child,

    /// param: {double? widthFactor}
    double? widthFactor,

    /// param: {double? heightFactor}
    double? heightFactor,

    /// param: {AlignmentGeometry alignment = Alignment.center}
    required AlignmentGeometry alignment,

    /// param: {TextDirection? textDirection}
    TextDirection? textDirection,
  }) : super(
          child: child,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          alignment: alignment,
          textDirection: textDirection,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderFractionallySizedOverflowBox$Mate(
        child: p.getValue('child'),
        widthFactor: p.getValue('widthFactor'),
        heightFactor: p.getValue('heightFactor'),
        alignment: p.getValue('alignment'),
        textDirection: p.getValue('textDirection'),
      ),
    );
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'widthFactor', init: widthFactor);
    mateParams.set(name: 'heightFactor', init: heightFactor);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'textDirection', init: textDirection);
  }
}

/// class RenderCustomSingleChildLayoutBox extends RenderShiftedBox
class RenderCustomSingleChildLayoutBox$Mate extends RenderCustomSingleChildLayoutBox
    with Mate<RenderCustomSingleChildLayoutBox$Mate> {
  /// RenderCustomSingleChildLayoutBox RenderCustomSingleChildLayoutBox({RenderBox? child, required SingleChildLayoutDelegate delegate})
  RenderCustomSingleChildLayoutBox$Mate({
    /// param: {RenderBox? child}
    RenderBox? child,

    /// param: {required SingleChildLayoutDelegate delegate}
    required SingleChildLayoutDelegate delegate,
  }) : super(
          child: child,
          delegate: delegate,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderCustomSingleChildLayoutBox$Mate(
        child: p.getValue('child'),
        delegate: p.getValue('delegate'),
      ),
    );
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'delegate', init: delegate);
  }
}

/// class RenderBaseline extends RenderShiftedBox
class RenderBaseline$Mate extends RenderBaseline with Mate<RenderBaseline$Mate> {
  /// RenderBaseline RenderBaseline({RenderBox? child, required double baseline, required TextBaseline baselineType})
  RenderBaseline$Mate({
    /// param: {RenderBox? child}
    RenderBox? child,

    /// param: {required double baseline}
    required double baseline,

    /// param: {required TextBaseline baselineType}
    required TextBaseline baselineType,
  }) : super(
          child: child,
          baseline: baseline,
          baselineType: baselineType,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderBaseline$Mate(
        child: p.getValue('child'),
        baseline: p.getValue('baseline'),
        baselineType: p.getValue('baselineType'),
      ),
    );
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'baseline', init: baseline);
    mateParams.set(name: 'baselineType', init: baselineType);
  }
}
