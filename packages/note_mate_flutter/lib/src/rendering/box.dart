// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/box.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/gestures/hit_test.dart';

/// class BoxConstraints extends Constraints
class BoxConstraints$Mate extends BoxConstraints with Mate {
  /// BoxConstraints BoxConstraints({double minWidth = 0.0, double maxWidth = double.infinity, double minHeight = 0.0, double maxHeight = double.infinity})
  BoxConstraints$Mate({
    /// optionalParameters: {double minWidth = 0.0} , defaultValue:Literal
    double minWidth = 0.0,

    /// optionalParameters: {double maxWidth = double.infinity} , defaultValue:PrefixedIdentifier
    double maxWidth = double.infinity,

    /// optionalParameters: {double minHeight = 0.0} , defaultValue:Literal
    double minHeight = 0.0,

    /// optionalParameters: {double maxHeight = double.infinity} , defaultValue:PrefixedIdentifier
    double maxHeight = double.infinity,
  }) : super(
          minWidth: minWidth,
          maxWidth: maxWidth,
          minHeight: minHeight,
          maxHeight: maxHeight,
        ) {
    mateCreateName = 'BoxConstraints';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => BoxConstraints$Mate(
          minWidth: p.get('minWidth').build(),
          maxWidth: p.get('maxWidth').build(),
          minHeight: p.get('minHeight').build(),
          maxHeight: p.get('maxHeight').build(),
        );
    mateUse('minWidth', minWidth, isNamed: true);
    mateUse('maxWidth', maxWidth, isNamed: true);
    mateUse('minHeight', minHeight, isNamed: true);
    mateUse('maxHeight', maxHeight, isNamed: true);
  }

  /// BoxConstraints BoxConstraints.tight(Size size)
  BoxConstraints$Mate.tight(

      /// requiredParameters: Size size
      Size size)
      : super.tight(size) {
    mateCreateName = 'BoxConstraints.tight';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => BoxConstraints$Mate.tight(p.get('size').value);
    mateUse('size', size, isNamed: false);
  }

  /// BoxConstraints BoxConstraints.tightFor({double? width, double? height})
  BoxConstraints$Mate.tightFor({
    /// optionalParameters: {double? width} , defaultValue:none
    double? width,

    /// optionalParameters: {double? height} , defaultValue:none
    double? height,
  }) : super.tightFor(
          width: width,
          height: height,
        ) {
    mateCreateName = 'BoxConstraints.tightFor';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => BoxConstraints$Mate.tightFor(
          width: p.get('width').build(),
          height: p.get('height').build(),
        );
    mateUse('width', width, isNamed: true);
    mateUse('height', height, isNamed: true);
  }

  /// BoxConstraints BoxConstraints.tightForFinite({double width = double.infinity, double height = double.infinity})
  BoxConstraints$Mate.tightForFinite({
    /// optionalParameters: {double width = double.infinity} , defaultValue:PrefixedIdentifier
    double width = double.infinity,

    /// optionalParameters: {double height = double.infinity} , defaultValue:PrefixedIdentifier
    double height = double.infinity,
  }) : super.tightForFinite(
          width: width,
          height: height,
        ) {
    mateCreateName = 'BoxConstraints.tightForFinite';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => BoxConstraints$Mate.tightForFinite(
          width: p.get('width').build(),
          height: p.get('height').build(),
        );
    mateUse('width', width, isNamed: true);
    mateUse('height', height, isNamed: true);
  }

  /// BoxConstraints BoxConstraints.loose(Size size)
  BoxConstraints$Mate.loose(

      /// requiredParameters: Size size
      Size size)
      : super.loose(size) {
    mateCreateName = 'BoxConstraints.loose';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => BoxConstraints$Mate.loose(p.get('size').value);
    mateUse('size', size, isNamed: false);
  }

  /// BoxConstraints BoxConstraints.expand({double? width, double? height})
  BoxConstraints$Mate.expand({
    /// optionalParameters: {double? width} , defaultValue:none
    double? width,

    /// optionalParameters: {double? height} , defaultValue:none
    double? height,
  }) : super.expand(
          width: width,
          height: height,
        ) {
    mateCreateName = 'BoxConstraints.expand';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => BoxConstraints$Mate.expand(
          width: p.get('width').build(),
          height: p.get('height').build(),
        );
    mateUse('width', width, isNamed: true);
    mateUse('height', height, isNamed: true);
  }
}

/// class BoxHitTestResult extends HitTestResult
class BoxHitTestResult$Mate extends BoxHitTestResult with Mate {
  /// BoxHitTestResult BoxHitTestResult.wrap(HitTestResult result)
  BoxHitTestResult$Mate.wrap(

      /// requiredParameters: HitTestResult result
      HitTestResult result)
      : super.wrap(result) {
    mateCreateName = 'BoxHitTestResult.wrap';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => BoxHitTestResult$Mate.wrap(p.get('result').value);
    mateUse('result', result, isNamed: false);
  }
}

/// class BoxHitTestEntry extends HitTestEntry<RenderBox>
class BoxHitTestEntry$Mate extends BoxHitTestEntry with Mate {
  /// BoxHitTestEntry BoxHitTestEntry(RenderBox target, Offset localPosition)
  BoxHitTestEntry$Mate(
    /// requiredParameters: RenderBox target
    RenderBox target,

    /// requiredParameters: Offset localPosition
    Offset localPosition,
  ) : super(
          target,
          localPosition,
        ) {
    mateCreateName = 'BoxHitTestEntry';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => BoxHitTestEntry$Mate(
          p.get('target').value,
          p.get('localPosition').value,
        );
    mateUse('target', target, isNamed: false);
    mateUse('localPosition', localPosition, isNamed: false);
  }
}
