// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/sliver_list.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/rendering/sliver_multi_box_adaptor.dart';

/// class RenderSliverList extends RenderSliverMultiBoxAdaptor
class RenderSliverList$Mate extends RenderSliverList with Mate {
  /// RenderSliverList RenderSliverList({required RenderSliverBoxChildManager childManager})
  RenderSliverList$Mate(
      {
      /// optionalParameters: {required RenderSliverBoxChildManager childManager} , defaultValue:none
      required RenderSliverBoxChildManager childManager})
      : super(childManager: childManager) {
    mateCreateName = 'RenderSliverList';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => RenderSliverList$Mate(childManager: p.get('childManager').build());
    mateUse('childManager', childManager);
  }
}
