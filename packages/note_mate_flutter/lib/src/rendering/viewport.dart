// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/viewport.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/painting/basic_types.dart';
import 'package:flutter/src/rendering/viewport_offset.dart';
import 'package:flutter/src/rendering/sliver.dart';

/// class RevealedOffset
class RevealedOffset$Mate extends RevealedOffset with Mate {
  /// RevealedOffset RevealedOffset({required double offset, required Rect rect})
  RevealedOffset$Mate({
    /// optionalParameters: {required double offset} , defaultValue:none
    required double offset,

    /// optionalParameters: {required Rect rect} , defaultValue:none
    required Rect rect,
  }) : super(
          offset: offset,
          rect: rect,
        ) {
    mateCreateName = 'RevealedOffset';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => RevealedOffset$Mate(
          offset: p.get('offset').build(),
          rect: p.get('rect').build(),
        );
    mateUse('offset', offset, isNamed: true);
    mateUse('rect', rect, isNamed: true);
  }
}

/// class RenderViewport extends RenderViewportBase<SliverPhysicalContainerParentData>
class RenderViewport$Mate extends RenderViewport with Mate {
  /// RenderViewport RenderViewport({AxisDirection axisDirection = AxisDirection.down, required AxisDirection crossAxisDirection, required ViewportOffset offset, double anchor = 0.0, List<RenderSliver>? children, RenderSliver? center, double? cacheExtent, CacheExtentStyle cacheExtentStyle = CacheExtentStyle.pixel, Clip clipBehavior = Clip.hardEdge})
  RenderViewport$Mate({
    /// optionalParameters: {AxisDirection axisDirection = AxisDirection.down} , defaultValue:is!ConstVariableElement
    required AxisDirection axisDirection,

    /// optionalParameters: {required AxisDirection crossAxisDirection} , defaultValue:none
    required AxisDirection crossAxisDirection,

    /// optionalParameters: {required ViewportOffset offset} , defaultValue:none
    required ViewportOffset offset,

    /// optionalParameters: {double anchor = 0.0} , defaultValue:Literal
    double anchor = 0.0,

    /// optionalParameters: {List<RenderSliver>? children} , defaultValue:none
    List<RenderSliver>? children,

    /// optionalParameters: {RenderSliver? center} , defaultValue:none
    RenderSliver? center,

    /// optionalParameters: {double? cacheExtent} , defaultValue:none
    double? cacheExtent,

    /// optionalParameters: {CacheExtentStyle cacheExtentStyle = CacheExtentStyle.pixel} , defaultValue:is!ConstVariableElement
    required CacheExtentStyle cacheExtentStyle,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , defaultValue:is!ConstVariableElement
    required Clip clipBehavior,
  }) : super(
          axisDirection: axisDirection,
          crossAxisDirection: crossAxisDirection,
          offset: offset,
          anchor: anchor,
          children: children,
          center: center,
          cacheExtent: cacheExtent,
          cacheExtentStyle: cacheExtentStyle,
          clipBehavior: clipBehavior,
        ) {
    mateCreateName = 'RenderViewport';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => RenderViewport$Mate(
          axisDirection: p.get('axisDirection').build(),
          crossAxisDirection: p.get('crossAxisDirection').build(),
          offset: p.get('offset').build(),
          anchor: p.get('anchor').build(),
          children: p.get('children').build(),
          center: p.get('center').build(),
          cacheExtent: p.get('cacheExtent').build(),
          cacheExtentStyle: p.get('cacheExtentStyle').build(),
          clipBehavior: p.get('clipBehavior').build(),
        );
    mateUse('axisDirection', axisDirection, isNamed: true);
    mateUse('crossAxisDirection', crossAxisDirection, isNamed: true);
    mateUse('offset', offset, isNamed: true);
    mateUse('anchor', anchor, isNamed: true);
    mateUseList('children', children, isNamed: true);
    mateUse('center', center, isNamed: true);
    mateUse('cacheExtent', cacheExtent, isNamed: true);
    mateUse('cacheExtentStyle', cacheExtentStyle, isNamed: true);
    mateUse('clipBehavior', clipBehavior, isNamed: true);
  }
}

/// class RenderShrinkWrappingViewport extends RenderViewportBase<SliverLogicalContainerParentData>
class RenderShrinkWrappingViewport$Mate extends RenderShrinkWrappingViewport with Mate {
  /// RenderShrinkWrappingViewport RenderShrinkWrappingViewport({AxisDirection axisDirection = AxisDirection.down, required AxisDirection crossAxisDirection, required ViewportOffset offset, Clip clipBehavior = Clip.hardEdge, List<RenderSliver>? children})
  RenderShrinkWrappingViewport$Mate({
    /// optionalParameters: {AxisDirection axisDirection = AxisDirection.down} , defaultValue:is!ConstVariableElement
    required AxisDirection axisDirection,

    /// optionalParameters: {required AxisDirection crossAxisDirection} , defaultValue:none
    required AxisDirection crossAxisDirection,

    /// optionalParameters: {required ViewportOffset offset} , defaultValue:none
    required ViewportOffset offset,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , defaultValue:is!ConstVariableElement
    required Clip clipBehavior,

    /// optionalParameters: {List<RenderSliver>? children} , defaultValue:none
    List<RenderSliver>? children,
  }) : super(
          axisDirection: axisDirection,
          crossAxisDirection: crossAxisDirection,
          offset: offset,
          clipBehavior: clipBehavior,
          children: children,
        ) {
    mateCreateName = 'RenderShrinkWrappingViewport';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => RenderShrinkWrappingViewport$Mate(
          axisDirection: p.get('axisDirection').build(),
          crossAxisDirection: p.get('crossAxisDirection').build(),
          offset: p.get('offset').build(),
          clipBehavior: p.get('clipBehavior').build(),
          children: p.get('children').build(),
        );
    mateUse('axisDirection', axisDirection, isNamed: true);
    mateUse('crossAxisDirection', crossAxisDirection, isNamed: true);
    mateUse('offset', offset, isNamed: true);
    mateUse('clipBehavior', clipBehavior, isNamed: true);
    mateUseList('children', children, isNamed: true);
  }
}
