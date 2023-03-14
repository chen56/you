// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/scroll_metrics.dart';
import 'dart:core';
import 'package:flutter/src/painting/basic_types.dart';
import 'package:note/mate.dart';

/// class FixedScrollMetrics with ScrollMetrics
class FixedScrollMetrics$Mate extends FixedScrollMetrics with Mate<FixedScrollMetrics$Mate> {
  /// FixedScrollMetrics FixedScrollMetrics({required double? minScrollExtent, required double? maxScrollExtent, required double? pixels, required double? viewportDimension, required AxisDirection axisDirection, required double devicePixelRatio})
  FixedScrollMetrics$Mate({
    /// optionalParameters: {required double? minScrollExtent} , hasDefaultValue:false, defaultValueCode:null
    required double? minScrollExtent,

    /// optionalParameters: {required double? maxScrollExtent} , hasDefaultValue:false, defaultValueCode:null
    required double? maxScrollExtent,

    /// optionalParameters: {required double? pixels} , hasDefaultValue:false, defaultValueCode:null
    required double? pixels,

    /// optionalParameters: {required double? viewportDimension} , hasDefaultValue:false, defaultValueCode:null
    required double? viewportDimension,

    /// optionalParameters: {required AxisDirection axisDirection} , hasDefaultValue:false, defaultValueCode:null
    required AxisDirection axisDirection,

    /// optionalParameters: {required double devicePixelRatio} , hasDefaultValue:false, defaultValueCode:null
    required double devicePixelRatio,
  }) : super(
          minScrollExtent: minScrollExtent,
          maxScrollExtent: maxScrollExtent,
          pixels: pixels,
          viewportDimension: viewportDimension,
          axisDirection: axisDirection,
          devicePixelRatio: devicePixelRatio,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => FixedScrollMetrics$Mate(
        minScrollExtent: p.getValue('minScrollExtent'),
        maxScrollExtent: p.getValue('maxScrollExtent'),
        pixels: p.getValue('pixels'),
        viewportDimension: p.getValue('viewportDimension'),
        axisDirection: p.getValue('axisDirection'),
        devicePixelRatio: p.getValue('devicePixelRatio'),
      ),
    );
    mateParams.set(name: 'minScrollExtent', init: minScrollExtent);
    mateParams.set(name: 'maxScrollExtent', init: maxScrollExtent);
    mateParams.set(name: 'pixels', init: pixels);
    mateParams.set(name: 'viewportDimension', init: viewportDimension);
    mateParams.set(name: 'axisDirection', init: axisDirection);
    mateParams.set(name: 'devicePixelRatio', init: devicePixelRatio);
  }
}
