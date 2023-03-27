// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/custom_layout.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/rendering/box.dart';

/// class RenderCustomMultiChildLayoutBox extends RenderBox with ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>, RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData>
class RenderCustomMultiChildLayoutBox$Mate extends RenderCustomMultiChildLayoutBox with Mate {
  /// RenderCustomMultiChildLayoutBox RenderCustomMultiChildLayoutBox({List<RenderBox>? children, required MultiChildLayoutDelegate delegate})
  RenderCustomMultiChildLayoutBox$Mate({
    /// optionalParameters: {List<RenderBox>? children} , defaultValue:none
    List<RenderBox>? children,

    /// optionalParameters: {required MultiChildLayoutDelegate delegate} , defaultValue:none
    required MultiChildLayoutDelegate delegate,
  }) : super(
          children: children,
          delegate: delegate,
        ) {
    mateCreateName = 'RenderCustomMultiChildLayoutBox';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => RenderCustomMultiChildLayoutBox$Mate(
          children: p.get('children').build(),
          delegate: p.get('delegate').build(),
        );
    mateUseList('children', children, isNamed: true);
    mateUse('delegate', delegate, isNamed: true);
  }
}
