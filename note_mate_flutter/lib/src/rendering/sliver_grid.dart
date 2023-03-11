// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/rendering/sliver_grid.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/rendering/sliver_multi_box_adaptor.dart';

/// class SliverGridGeometry
class SliverGridGeometry$Mate extends SliverGridGeometry with Mate<SliverGridGeometry$Mate> {
  /// SliverGridGeometry SliverGridGeometry({required double scrollOffset, required double crossAxisOffset, required double mainAxisExtent, required double crossAxisExtent})
  SliverGridGeometry$Mate({
    /// param: {required double scrollOffset}
    required double scrollOffset,

    /// param: {required double crossAxisOffset}
    required double crossAxisOffset,

    /// param: {required double mainAxisExtent}
    required double mainAxisExtent,

    /// param: {required double crossAxisExtent}
    required double crossAxisExtent,
  }) : super(
          scrollOffset: scrollOffset,
          crossAxisOffset: crossAxisOffset,
          mainAxisExtent: mainAxisExtent,
          crossAxisExtent: crossAxisExtent,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SliverGridGeometry$Mate(
        scrollOffset: p.getValue('scrollOffset'),
        crossAxisOffset: p.getValue('crossAxisOffset'),
        mainAxisExtent: p.getValue('mainAxisExtent'),
        crossAxisExtent: p.getValue('crossAxisExtent'),
      ),
    );
    mateParams.set(name: 'scrollOffset', init: scrollOffset);
    mateParams.set(name: 'crossAxisOffset', init: crossAxisOffset);
    mateParams.set(name: 'mainAxisExtent', init: mainAxisExtent);
    mateParams.set(name: 'crossAxisExtent', init: crossAxisExtent);
  }
}

/// class SliverGridRegularTileLayout extends SliverGridLayout
class SliverGridRegularTileLayout$Mate extends SliverGridRegularTileLayout with Mate<SliverGridRegularTileLayout$Mate> {
  /// SliverGridRegularTileLayout SliverGridRegularTileLayout({required int crossAxisCount, required double mainAxisStride, required double crossAxisStride, required double childMainAxisExtent, required double childCrossAxisExtent, required bool reverseCrossAxis})
  SliverGridRegularTileLayout$Mate({
    /// param: {required int crossAxisCount}
    required int crossAxisCount,

    /// param: {required double mainAxisStride}
    required double mainAxisStride,

    /// param: {required double crossAxisStride}
    required double crossAxisStride,

    /// param: {required double childMainAxisExtent}
    required double childMainAxisExtent,

    /// param: {required double childCrossAxisExtent}
    required double childCrossAxisExtent,

    /// param: {required bool reverseCrossAxis}
    required bool reverseCrossAxis,
  }) : super(
          crossAxisCount: crossAxisCount,
          mainAxisStride: mainAxisStride,
          crossAxisStride: crossAxisStride,
          childMainAxisExtent: childMainAxisExtent,
          childCrossAxisExtent: childCrossAxisExtent,
          reverseCrossAxis: reverseCrossAxis,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SliverGridRegularTileLayout$Mate(
        crossAxisCount: p.getValue('crossAxisCount'),
        mainAxisStride: p.getValue('mainAxisStride'),
        crossAxisStride: p.getValue('crossAxisStride'),
        childMainAxisExtent: p.getValue('childMainAxisExtent'),
        childCrossAxisExtent: p.getValue('childCrossAxisExtent'),
        reverseCrossAxis: p.getValue('reverseCrossAxis'),
      ),
    );
    mateParams.set(name: 'crossAxisCount', init: crossAxisCount);
    mateParams.set(name: 'mainAxisStride', init: mainAxisStride);
    mateParams.set(name: 'crossAxisStride', init: crossAxisStride);
    mateParams.set(name: 'childMainAxisExtent', init: childMainAxisExtent);
    mateParams.set(name: 'childCrossAxisExtent', init: childCrossAxisExtent);
    mateParams.set(name: 'reverseCrossAxis', init: reverseCrossAxis);
  }
}

/// class SliverGridDelegateWithFixedCrossAxisCount extends SliverGridDelegate
class SliverGridDelegateWithFixedCrossAxisCount$Mate extends SliverGridDelegateWithFixedCrossAxisCount
    with Mate<SliverGridDelegateWithFixedCrossAxisCount$Mate> {
  /// SliverGridDelegateWithFixedCrossAxisCount SliverGridDelegateWithFixedCrossAxisCount({required int crossAxisCount, double mainAxisSpacing = 0.0, double crossAxisSpacing = 0.0, double childAspectRatio = 1.0, double? mainAxisExtent})
  SliverGridDelegateWithFixedCrossAxisCount$Mate({
    /// param: {required int crossAxisCount}
    required int crossAxisCount,

    /// param: {double mainAxisSpacing = 0.0}
    required double mainAxisSpacing,

    /// param: {double crossAxisSpacing = 0.0}
    required double crossAxisSpacing,

    /// param: {double childAspectRatio = 1.0}
    required double childAspectRatio,

    /// param: {double? mainAxisExtent}
    double? mainAxisExtent,
  }) : super(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          mainAxisExtent: mainAxisExtent,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SliverGridDelegateWithFixedCrossAxisCount$Mate(
        crossAxisCount: p.getValue('crossAxisCount'),
        mainAxisSpacing: p.getValue('mainAxisSpacing'),
        crossAxisSpacing: p.getValue('crossAxisSpacing'),
        childAspectRatio: p.getValue('childAspectRatio'),
        mainAxisExtent: p.getValue('mainAxisExtent'),
      ),
    );
    mateParams.set(name: 'crossAxisCount', init: crossAxisCount);
    mateParams.set(name: 'mainAxisSpacing', init: mainAxisSpacing);
    mateParams.set(name: 'crossAxisSpacing', init: crossAxisSpacing);
    mateParams.set(name: 'childAspectRatio', init: childAspectRatio);
    mateParams.set(name: 'mainAxisExtent', init: mainAxisExtent);
  }
}

/// class SliverGridDelegateWithMaxCrossAxisExtent extends SliverGridDelegate
class SliverGridDelegateWithMaxCrossAxisExtent$Mate extends SliverGridDelegateWithMaxCrossAxisExtent
    with Mate<SliverGridDelegateWithMaxCrossAxisExtent$Mate> {
  /// SliverGridDelegateWithMaxCrossAxisExtent SliverGridDelegateWithMaxCrossAxisExtent({required double maxCrossAxisExtent, double mainAxisSpacing = 0.0, double crossAxisSpacing = 0.0, double childAspectRatio = 1.0, double? mainAxisExtent})
  SliverGridDelegateWithMaxCrossAxisExtent$Mate({
    /// param: {required double maxCrossAxisExtent}
    required double maxCrossAxisExtent,

    /// param: {double mainAxisSpacing = 0.0}
    required double mainAxisSpacing,

    /// param: {double crossAxisSpacing = 0.0}
    required double crossAxisSpacing,

    /// param: {double childAspectRatio = 1.0}
    required double childAspectRatio,

    /// param: {double? mainAxisExtent}
    double? mainAxisExtent,
  }) : super(
          maxCrossAxisExtent: maxCrossAxisExtent,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          mainAxisExtent: mainAxisExtent,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SliverGridDelegateWithMaxCrossAxisExtent$Mate(
        maxCrossAxisExtent: p.getValue('maxCrossAxisExtent'),
        mainAxisSpacing: p.getValue('mainAxisSpacing'),
        crossAxisSpacing: p.getValue('crossAxisSpacing'),
        childAspectRatio: p.getValue('childAspectRatio'),
        mainAxisExtent: p.getValue('mainAxisExtent'),
      ),
    );
    mateParams.set(name: 'maxCrossAxisExtent', init: maxCrossAxisExtent);
    mateParams.set(name: 'mainAxisSpacing', init: mainAxisSpacing);
    mateParams.set(name: 'crossAxisSpacing', init: crossAxisSpacing);
    mateParams.set(name: 'childAspectRatio', init: childAspectRatio);
    mateParams.set(name: 'mainAxisExtent', init: mainAxisExtent);
  }
}

/// class RenderSliverGrid extends RenderSliverMultiBoxAdaptor
class RenderSliverGrid$Mate extends RenderSliverGrid with Mate<RenderSliverGrid$Mate> {
  /// RenderSliverGrid RenderSliverGrid({required RenderSliverBoxChildManager childManager, required SliverGridDelegate gridDelegate})
  RenderSliverGrid$Mate({
    /// param: {required RenderSliverBoxChildManager childManager}
    required RenderSliverBoxChildManager childManager,

    /// param: {required SliverGridDelegate gridDelegate}
    required SliverGridDelegate gridDelegate,
  }) : super(
          childManager: childManager,
          gridDelegate: gridDelegate,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RenderSliverGrid$Mate(
        childManager: p.getValue('childManager'),
        gridDelegate: p.getValue('gridDelegate'),
      ),
    );
    mateParams.set(name: 'childManager', init: childManager);
    mateParams.set(name: 'gridDelegate', init: gridDelegate);
  }
}
