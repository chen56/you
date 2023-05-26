// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/rendering/sliver_grid.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/rendering/sliver_multi_box_adaptor.dart' as _i3;

/// class SliverGridGeometry
class SliverGridGeometry$Mate extends _i1.SliverGridGeometry with _i2.Mate {
  /// SliverGridGeometry SliverGridGeometry({required double scrollOffset, required double crossAxisOffset, required double mainAxisExtent, required double crossAxisExtent})
  SliverGridGeometry$Mate({
    /// optionalParameters: {required double scrollOffset} , default:none
    required super.scrollOffset,

    /// optionalParameters: {required double crossAxisOffset} , default:none
    required super.crossAxisOffset,

    /// optionalParameters: {required double mainAxisExtent} , default:none
    required super.mainAxisExtent,

    /// optionalParameters: {required double crossAxisExtent} , default:none
    required super.crossAxisExtent,
  })  : mateParams = {
          'scrollOffset': _i2.BuilderArg<double>(
            name: 'scrollOffset',
            init: scrollOffset,
            isNamed: true,
          ),
          'crossAxisOffset': _i2.BuilderArg<double>(
            name: 'crossAxisOffset',
            init: crossAxisOffset,
            isNamed: true,
          ),
          'mainAxisExtent': _i2.BuilderArg<double>(
            name: 'mainAxisExtent',
            init: mainAxisExtent,
            isNamed: true,
          ),
          'crossAxisExtent': _i2.BuilderArg<double>(
            name: 'crossAxisExtent',
            init: crossAxisExtent,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'SliverGridGeometry';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => SliverGridGeometry$Mate(
          scrollOffset: p.get('scrollOffset').build(),
          crossAxisOffset: p.get('crossAxisOffset').build(),
          mainAxisExtent: p.get('mainAxisExtent').build(),
          crossAxisExtent: p.get('crossAxisExtent').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class SliverGridRegularTileLayout extends SliverGridLayout
class SliverGridRegularTileLayout$Mate extends _i1.SliverGridRegularTileLayout
    with _i2.Mate {
  /// SliverGridRegularTileLayout SliverGridRegularTileLayout({required int crossAxisCount, required double mainAxisStride, required double crossAxisStride, required double childMainAxisExtent, required double childCrossAxisExtent, required bool reverseCrossAxis})
  SliverGridRegularTileLayout$Mate({
    /// optionalParameters: {required int crossAxisCount} , default:none
    required super.crossAxisCount,

    /// optionalParameters: {required double mainAxisStride} , default:none
    required super.mainAxisStride,

    /// optionalParameters: {required double crossAxisStride} , default:none
    required super.crossAxisStride,

    /// optionalParameters: {required double childMainAxisExtent} , default:none
    required super.childMainAxisExtent,

    /// optionalParameters: {required double childCrossAxisExtent} , default:none
    required super.childCrossAxisExtent,

    /// optionalParameters: {required bool reverseCrossAxis} , default:none
    required super.reverseCrossAxis,
  })  : mateParams = {
          'crossAxisCount': _i2.BuilderArg<int>(
            name: 'crossAxisCount',
            init: crossAxisCount,
            isNamed: true,
          ),
          'mainAxisStride': _i2.BuilderArg<double>(
            name: 'mainAxisStride',
            init: mainAxisStride,
            isNamed: true,
          ),
          'crossAxisStride': _i2.BuilderArg<double>(
            name: 'crossAxisStride',
            init: crossAxisStride,
            isNamed: true,
          ),
          'childMainAxisExtent': _i2.BuilderArg<double>(
            name: 'childMainAxisExtent',
            init: childMainAxisExtent,
            isNamed: true,
          ),
          'childCrossAxisExtent': _i2.BuilderArg<double>(
            name: 'childCrossAxisExtent',
            init: childCrossAxisExtent,
            isNamed: true,
          ),
          'reverseCrossAxis': _i2.BuilderArg<bool>(
            name: 'reverseCrossAxis',
            init: reverseCrossAxis,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'SliverGridRegularTileLayout';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => SliverGridRegularTileLayout$Mate(
          crossAxisCount: p.get('crossAxisCount').build(),
          mainAxisStride: p.get('mainAxisStride').build(),
          crossAxisStride: p.get('crossAxisStride').build(),
          childMainAxisExtent: p.get('childMainAxisExtent').build(),
          childCrossAxisExtent: p.get('childCrossAxisExtent').build(),
          reverseCrossAxis: p.get('reverseCrossAxis').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class SliverGridDelegateWithFixedCrossAxisCount extends SliverGridDelegate
class SliverGridDelegateWithFixedCrossAxisCount$Mate
    extends _i1.SliverGridDelegateWithFixedCrossAxisCount with _i2.Mate {
  /// SliverGridDelegateWithFixedCrossAxisCount SliverGridDelegateWithFixedCrossAxisCount({required int crossAxisCount, double mainAxisSpacing = 0.0, double crossAxisSpacing = 0.0, double childAspectRatio = 1.0, double? mainAxisExtent})
  SliverGridDelegateWithFixedCrossAxisCount$Mate({
    /// optionalParameters: {required int crossAxisCount} , default:none
    required super.crossAxisCount,

    /// optionalParameters: {double mainAxisSpacing = 0.0} , default:processed=DoubleLiteralImpl
    super.mainAxisSpacing,

    /// optionalParameters: {double crossAxisSpacing = 0.0} , default:processed=DoubleLiteralImpl
    super.crossAxisSpacing,

    /// optionalParameters: {double childAspectRatio = 1.0} , default:processed=DoubleLiteralImpl
    super.childAspectRatio,

    /// optionalParameters: {double? mainAxisExtent} , default:none
    super.mainAxisExtent,
  })  : mateParams = {
          'crossAxisCount': _i2.BuilderArg<int>(
            name: 'crossAxisCount',
            init: crossAxisCount,
            isNamed: true,
          ),
          'mainAxisSpacing': _i2.BuilderArg<double>(
            name: 'mainAxisSpacing',
            init: mainAxisSpacing,
            isNamed: true,
            defaultValue: 0.0,
          ),
          'crossAxisSpacing': _i2.BuilderArg<double>(
            name: 'crossAxisSpacing',
            init: crossAxisSpacing,
            isNamed: true,
            defaultValue: 0.0,
          ),
          'childAspectRatio': _i2.BuilderArg<double>(
            name: 'childAspectRatio',
            init: childAspectRatio,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'mainAxisExtent': _i2.BuilderArg<double?>(
            name: 'mainAxisExtent',
            init: mainAxisExtent,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'SliverGridDelegateWithFixedCrossAxisCount';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => SliverGridDelegateWithFixedCrossAxisCount$Mate(
          crossAxisCount: p.get('crossAxisCount').build(),
          mainAxisSpacing: p.get('mainAxisSpacing').build(),
          crossAxisSpacing: p.get('crossAxisSpacing').build(),
          childAspectRatio: p.get('childAspectRatio').build(),
          mainAxisExtent: p.get('mainAxisExtent').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class SliverGridDelegateWithMaxCrossAxisExtent extends SliverGridDelegate
class SliverGridDelegateWithMaxCrossAxisExtent$Mate
    extends _i1.SliverGridDelegateWithMaxCrossAxisExtent with _i2.Mate {
  /// SliverGridDelegateWithMaxCrossAxisExtent SliverGridDelegateWithMaxCrossAxisExtent({required double maxCrossAxisExtent, double mainAxisSpacing = 0.0, double crossAxisSpacing = 0.0, double childAspectRatio = 1.0, double? mainAxisExtent})
  SliverGridDelegateWithMaxCrossAxisExtent$Mate({
    /// optionalParameters: {required double maxCrossAxisExtent} , default:none
    required super.maxCrossAxisExtent,

    /// optionalParameters: {double mainAxisSpacing = 0.0} , default:processed=DoubleLiteralImpl
    super.mainAxisSpacing,

    /// optionalParameters: {double crossAxisSpacing = 0.0} , default:processed=DoubleLiteralImpl
    super.crossAxisSpacing,

    /// optionalParameters: {double childAspectRatio = 1.0} , default:processed=DoubleLiteralImpl
    super.childAspectRatio,

    /// optionalParameters: {double? mainAxisExtent} , default:none
    super.mainAxisExtent,
  })  : mateParams = {
          'maxCrossAxisExtent': _i2.BuilderArg<double>(
            name: 'maxCrossAxisExtent',
            init: maxCrossAxisExtent,
            isNamed: true,
          ),
          'mainAxisSpacing': _i2.BuilderArg<double>(
            name: 'mainAxisSpacing',
            init: mainAxisSpacing,
            isNamed: true,
            defaultValue: 0.0,
          ),
          'crossAxisSpacing': _i2.BuilderArg<double>(
            name: 'crossAxisSpacing',
            init: crossAxisSpacing,
            isNamed: true,
            defaultValue: 0.0,
          ),
          'childAspectRatio': _i2.BuilderArg<double>(
            name: 'childAspectRatio',
            init: childAspectRatio,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'mainAxisExtent': _i2.BuilderArg<double?>(
            name: 'mainAxisExtent',
            init: mainAxisExtent,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'SliverGridDelegateWithMaxCrossAxisExtent';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => SliverGridDelegateWithMaxCrossAxisExtent$Mate(
          maxCrossAxisExtent: p.get('maxCrossAxisExtent').build(),
          mainAxisSpacing: p.get('mainAxisSpacing').build(),
          crossAxisSpacing: p.get('crossAxisSpacing').build(),
          childAspectRatio: p.get('childAspectRatio').build(),
          mainAxisExtent: p.get('mainAxisExtent').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class RenderSliverGrid extends RenderSliverMultiBoxAdaptor
class RenderSliverGrid$Mate extends _i1.RenderSliverGrid with _i2.Mate {
  /// RenderSliverGrid RenderSliverGrid({required RenderSliverBoxChildManager childManager, required SliverGridDelegate gridDelegate})
  RenderSliverGrid$Mate({
    /// optionalParameters: {required RenderSliverBoxChildManager childManager} , default:none
    required super.childManager,

    /// optionalParameters: {required SliverGridDelegate gridDelegate} , default:none
    required super.gridDelegate,
  })  : mateParams = {
          'childManager': _i2.BuilderArg<_i3.RenderSliverBoxChildManager>(
            name: 'childManager',
            init: childManager,
            isNamed: true,
          ),
          'gridDelegate': _i2.BuilderArg<_i1.SliverGridDelegate>(
            name: 'gridDelegate',
            init: gridDelegate,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'RenderSliverGrid';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => RenderSliverGrid$Mate(
          childManager: p.get('childManager').build(),
          gridDelegate: p.get('gridDelegate').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}