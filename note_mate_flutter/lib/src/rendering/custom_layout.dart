// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/custom_layout.dart';
import 'dart:core';
import 'package:flutter/src/rendering/box.dart';
import 'package:note/mate.dart';

/// class RenderCustomMultiChildLayoutBox extends RenderBox with ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>, RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData>
class RenderCustomMultiChildLayoutBox$Mate extends RenderCustomMultiChildLayoutBox
    with Mate<RenderCustomMultiChildLayoutBox$Mate> {
  /// RenderCustomMultiChildLayoutBox RenderCustomMultiChildLayoutBox({List<RenderBox>? children, required MultiChildLayoutDelegate delegate})
  RenderCustomMultiChildLayoutBox$Mate({
    /// optionalParameters: {List<RenderBox>? children} , hasDefaultValue:false, defaultValueCode:null
    List<RenderBox>? children,

    /// optionalParameters: {required MultiChildLayoutDelegate delegate} , hasDefaultValue:false, defaultValueCode:null
    required MultiChildLayoutDelegate delegate,
  }) : super(
          children: children,
          delegate: delegate,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderCustomMultiChildLayoutBox$Mate(
        children: p.getValue('children'),
        delegate: p.getValue('delegate'),
      ),
    );
    mateParams.set(name: 'children', init: children);
    mateParams.set(name: 'delegate', init: delegate);
  }
}
