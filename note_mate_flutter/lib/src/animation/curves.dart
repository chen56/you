// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/animation/curves.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'dart:ui';

/// class SawTooth extends Curve
class SawTooth$Mate extends SawTooth with Mate<SawTooth$Mate> {
  /// SawTooth SawTooth(int count)
  SawTooth$Mate(

      /// requiredParameters: int count
      int count)
      : super(count) {
    mateParams = Params(
      init: this,
      builder: (p) => SawTooth$Mate(p.getValue('count')),
    );
    mateParams.set(name: 'count', init: count);
  }
}

/// class Interval extends Curve
class Interval$Mate extends Interval with Mate<Interval$Mate> {
  /// Interval Interval(double begin, double end, {Curve curve = Curves.linear})
  Interval$Mate(
    /// requiredParameters: double begin
    double begin,

    /// requiredParameters: double end
    double end, {
    /// optionalParameters: {Curve curve = Curves.linear} , hasDefaultValue:true, defaultValueCode:Curves.linear
    required Curve curve,
  }) : super(
          begin,
          end,
          curve: curve,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Interval$Mate(
        p.getValue('begin'),
        p.getValue('end'),
        curve: p.getValue('curve'),
      ),
    );
    mateParams.set(name: 'begin', init: begin);
    mateParams.set(name: 'end', init: end);
    mateParams.set(name: 'curve', init: curve);
  }
}

/// class Threshold extends Curve
class Threshold$Mate extends Threshold with Mate<Threshold$Mate> {
  /// Threshold Threshold(double threshold)
  Threshold$Mate(

      /// requiredParameters: double threshold
      double threshold)
      : super(threshold) {
    mateParams = Params(
      init: this,
      builder: (p) => Threshold$Mate(p.getValue('threshold')),
    );
    mateParams.set(name: 'threshold', init: threshold);
  }
}

/// class Cubic extends Curve
class Cubic$Mate extends Cubic with Mate<Cubic$Mate> {
  /// Cubic Cubic(double a, double b, double c, double d)
  Cubic$Mate(
    /// requiredParameters: double a
    double a,

    /// requiredParameters: double b
    double b,

    /// requiredParameters: double c
    double c,

    /// requiredParameters: double d
    double d,
  ) : super(
          a,
          b,
          c,
          d,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Cubic$Mate(
        p.getValue('a'),
        p.getValue('b'),
        p.getValue('c'),
        p.getValue('d'),
      ),
    );
    mateParams.set(name: 'a', init: a);
    mateParams.set(name: 'b', init: b);
    mateParams.set(name: 'c', init: c);
    mateParams.set(name: 'd', init: d);
  }
}

/// class ThreePointCubic extends Curve
class ThreePointCubic$Mate extends ThreePointCubic with Mate<ThreePointCubic$Mate> {
  /// ThreePointCubic ThreePointCubic(Offset a1, Offset b1, Offset midpoint, Offset a2, Offset b2)
  ThreePointCubic$Mate(
    /// requiredParameters: Offset a1
    Offset a1,

    /// requiredParameters: Offset b1
    Offset b1,

    /// requiredParameters: Offset midpoint
    Offset midpoint,

    /// requiredParameters: Offset a2
    Offset a2,

    /// requiredParameters: Offset b2
    Offset b2,
  ) : super(
          a1,
          b1,
          midpoint,
          a2,
          b2,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ThreePointCubic$Mate(
        p.getValue('a1'),
        p.getValue('b1'),
        p.getValue('midpoint'),
        p.getValue('a2'),
        p.getValue('b2'),
      ),
    );
    mateParams.set(name: 'a1', init: a1);
    mateParams.set(name: 'b1', init: b1);
    mateParams.set(name: 'midpoint', init: midpoint);
    mateParams.set(name: 'a2', init: a2);
    mateParams.set(name: 'b2', init: b2);
  }
}

/// class Curve2DSample
class Curve2DSample$Mate extends Curve2DSample with Mate<Curve2DSample$Mate> {
  /// Curve2DSample Curve2DSample(double t, Offset value)
  Curve2DSample$Mate(
    /// requiredParameters: double t
    double t,

    /// requiredParameters: Offset value
    Offset value,
  ) : super(
          t,
          value,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Curve2DSample$Mate(
        p.getValue('t'),
        p.getValue('value'),
      ),
    );
    mateParams.set(name: 't', init: t);
    mateParams.set(name: 'value', init: value);
  }
}

/// class CatmullRomSpline extends Curve2D
class CatmullRomSpline$Mate extends CatmullRomSpline with Mate<CatmullRomSpline$Mate> {
  /// CatmullRomSpline CatmullRomSpline(List<Offset> controlPoints, {double tension = 0.0, Offset? startHandle, Offset? endHandle})
  CatmullRomSpline$Mate(
    /// requiredParameters: List<Offset> controlPoints
    List<Offset> controlPoints, {
    /// optionalParameters: {double tension = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double tension,

    /// optionalParameters: {Offset? startHandle} , hasDefaultValue:false, defaultValueCode:null
    Offset? startHandle,

    /// optionalParameters: {Offset? endHandle} , hasDefaultValue:false, defaultValueCode:null
    Offset? endHandle,
  }) : super(
          controlPoints,
          tension: tension,
          startHandle: startHandle,
          endHandle: endHandle,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => CatmullRomSpline$Mate(
        p.getValue('controlPoints'),
        tension: p.getValue('tension'),
        startHandle: p.getValue('startHandle'),
        endHandle: p.getValue('endHandle'),
      ),
    );
    mateParams.set(name: 'controlPoints', init: controlPoints);
    mateParams.set(name: 'tension', init: tension);
    mateParams.set(name: 'startHandle', init: startHandle);
    mateParams.set(name: 'endHandle', init: endHandle);
  }

  /// CatmullRomSpline CatmullRomSpline.precompute(List<Offset> controlPoints, {double tension = 0.0, Offset? startHandle, Offset? endHandle})
  CatmullRomSpline$Mate.precompute(
    /// requiredParameters: List<Offset> controlPoints
    List<Offset> controlPoints, {
    /// optionalParameters: {double tension = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double tension,

    /// optionalParameters: {Offset? startHandle} , hasDefaultValue:false, defaultValueCode:null
    Offset? startHandle,

    /// optionalParameters: {Offset? endHandle} , hasDefaultValue:false, defaultValueCode:null
    Offset? endHandle,
  }) : super.precompute(
          controlPoints,
          tension: tension,
          startHandle: startHandle,
          endHandle: endHandle,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => CatmullRomSpline$Mate.precompute(
        p.getValue('controlPoints'),
        tension: p.getValue('tension'),
        startHandle: p.getValue('startHandle'),
        endHandle: p.getValue('endHandle'),
      ),
    );
    mateParams.set(name: 'controlPoints', init: controlPoints);
    mateParams.set(name: 'tension', init: tension);
    mateParams.set(name: 'startHandle', init: startHandle);
    mateParams.set(name: 'endHandle', init: endHandle);
  }
}

/// class CatmullRomCurve extends Curve
class CatmullRomCurve$Mate extends CatmullRomCurve with Mate<CatmullRomCurve$Mate> {
  /// CatmullRomCurve CatmullRomCurve(List<Offset> controlPoints, {double tension = 0.0})
  CatmullRomCurve$Mate(
    /// requiredParameters: List<Offset> controlPoints
    List<Offset> controlPoints, {
    /// optionalParameters: {double tension = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double tension,
  }) : super(
          controlPoints,
          tension: tension,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => CatmullRomCurve$Mate(
        p.getValue('controlPoints'),
        tension: p.getValue('tension'),
      ),
    );
    mateParams.set(name: 'controlPoints', init: controlPoints);
    mateParams.set(name: 'tension', init: tension);
  }

  /// CatmullRomCurve CatmullRomCurve.precompute(List<Offset> controlPoints, {double tension = 0.0})
  CatmullRomCurve$Mate.precompute(
    /// requiredParameters: List<Offset> controlPoints
    List<Offset> controlPoints, {
    /// optionalParameters: {double tension = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double tension,
  }) : super.precompute(
          controlPoints,
          tension: tension,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => CatmullRomCurve$Mate.precompute(
        p.getValue('controlPoints'),
        tension: p.getValue('tension'),
      ),
    );
    mateParams.set(name: 'controlPoints', init: controlPoints);
    mateParams.set(name: 'tension', init: tension);
  }
}

/// class FlippedCurve extends Curve
class FlippedCurve$Mate extends FlippedCurve with Mate<FlippedCurve$Mate> {
  /// FlippedCurve FlippedCurve(Curve curve)
  FlippedCurve$Mate(

      /// requiredParameters: Curve curve
      Curve curve)
      : super(curve) {
    mateParams = Params(
      init: this,
      builder: (p) => FlippedCurve$Mate(p.getValue('curve')),
    );
    mateParams.set(name: 'curve', init: curve);
  }
}

/// class ElasticInCurve extends Curve
class ElasticInCurve$Mate extends ElasticInCurve with Mate<ElasticInCurve$Mate> {
  /// ElasticInCurve ElasticInCurve([double period = 0.4])
  ElasticInCurve$Mate(

      /// requiredParameters: [double period = 0.4]
      double period)
      : super(period) {
    mateParams = Params(
      init: this,
      builder: (p) => ElasticInCurve$Mate(p.getValue('period')),
    );
    mateParams.set(name: 'period', init: period);
  }
}

/// class ElasticOutCurve extends Curve
class ElasticOutCurve$Mate extends ElasticOutCurve with Mate<ElasticOutCurve$Mate> {
  /// ElasticOutCurve ElasticOutCurve([double period = 0.4])
  ElasticOutCurve$Mate(

      /// requiredParameters: [double period = 0.4]
      double period)
      : super(period) {
    mateParams = Params(
      init: this,
      builder: (p) => ElasticOutCurve$Mate(p.getValue('period')),
    );
    mateParams.set(name: 'period', init: period);
  }
}

/// class ElasticInOutCurve extends Curve
class ElasticInOutCurve$Mate extends ElasticInOutCurve with Mate<ElasticInOutCurve$Mate> {
  /// ElasticInOutCurve ElasticInOutCurve([double period = 0.4])
  ElasticInOutCurve$Mate(

      /// requiredParameters: [double period = 0.4]
      double period)
      : super(period) {
    mateParams = Params(
      init: this,
      builder: (p) => ElasticInOutCurve$Mate(p.getValue('period')),
    );
    mateParams.set(name: 'period', init: period);
  }
}
