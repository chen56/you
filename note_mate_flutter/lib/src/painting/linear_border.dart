// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/painting/linear_border.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/painting/borders.dart';

/// class LinearBorderEdge
class LinearBorderEdge$Mate extends LinearBorderEdge with Mate<LinearBorderEdge$Mate> {
  /// LinearBorderEdge LinearBorderEdge({double size = 1.0, double alignment = 0.0})
  LinearBorderEdge$Mate({
    /// optionalParameters: {double size = 1.0} , hasDefaultValue:true, defaultValueCode:1.0
    required double size,

    /// optionalParameters: {double alignment = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double alignment,
  }) : super(
          size: size,
          alignment: alignment,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => LinearBorderEdge$Mate(
        size: p.getValue('size'),
        alignment: p.getValue('alignment'),
      ),
    );
    mateParams.set(name: 'size', init: size);
    mateParams.set(name: 'alignment', init: alignment);
  }
}

/// class LinearBorder extends OutlinedBorder
class LinearBorder$Mate extends LinearBorder with Mate<LinearBorder$Mate> {
  /// LinearBorder LinearBorder({BorderSide side = BorderSide.none, LinearBorderEdge? start, LinearBorderEdge? end, LinearBorderEdge? top, LinearBorderEdge? bottom})
  LinearBorder$Mate({
    /// optionalParameters: {BorderSide side = BorderSide.none} , hasDefaultValue:true, defaultValueCode:BorderSide.none
    required BorderSide side,

    /// optionalParameters: {LinearBorderEdge? start} , hasDefaultValue:false, defaultValueCode:null
    LinearBorderEdge? start,

    /// optionalParameters: {LinearBorderEdge? end} , hasDefaultValue:false, defaultValueCode:null
    LinearBorderEdge? end,

    /// optionalParameters: {LinearBorderEdge? top} , hasDefaultValue:false, defaultValueCode:null
    LinearBorderEdge? top,

    /// optionalParameters: {LinearBorderEdge? bottom} , hasDefaultValue:false, defaultValueCode:null
    LinearBorderEdge? bottom,
  }) : super(
          side: side,
          start: start,
          end: end,
          top: top,
          bottom: bottom,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => LinearBorder$Mate(
        side: p.getValue('side'),
        start: p.getValue('start'),
        end: p.getValue('end'),
        top: p.getValue('top'),
        bottom: p.getValue('bottom'),
      ),
    );
    mateParams.set(name: 'side', init: side);
    mateParams.set(name: 'start', init: start);
    mateParams.set(name: 'end', init: end);
    mateParams.set(name: 'top', init: top);
    mateParams.set(name: 'bottom', init: bottom);
  }

  /// LinearBorder LinearBorder.start({BorderSide side = BorderSide.none, double alignment = 0.0, double size = 1.0})
  LinearBorder$Mate.start({
    /// optionalParameters: {BorderSide side = BorderSide.none} , hasDefaultValue:true, defaultValueCode:BorderSide.none
    required BorderSide side,

    /// optionalParameters: {double alignment = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double alignment,

    /// optionalParameters: {double size = 1.0} , hasDefaultValue:true, defaultValueCode:1.0
    required double size,
  }) : super.start(
          side: side,
          alignment: alignment,
          size: size,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => LinearBorder$Mate.start(
        side: p.getValue('side'),
        alignment: p.getValue('alignment'),
        size: p.getValue('size'),
      ),
    );
    mateParams.set(name: 'side', init: side);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'size', init: size);
  }

  /// LinearBorder LinearBorder.end({BorderSide side = BorderSide.none, double alignment = 0.0, double size = 1.0})
  LinearBorder$Mate.end({
    /// optionalParameters: {BorderSide side = BorderSide.none} , hasDefaultValue:true, defaultValueCode:BorderSide.none
    required BorderSide side,

    /// optionalParameters: {double alignment = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double alignment,

    /// optionalParameters: {double size = 1.0} , hasDefaultValue:true, defaultValueCode:1.0
    required double size,
  }) : super.end(
          side: side,
          alignment: alignment,
          size: size,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => LinearBorder$Mate.end(
        side: p.getValue('side'),
        alignment: p.getValue('alignment'),
        size: p.getValue('size'),
      ),
    );
    mateParams.set(name: 'side', init: side);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'size', init: size);
  }

  /// LinearBorder LinearBorder.top({BorderSide side = BorderSide.none, double alignment = 0.0, double size = 1.0})
  LinearBorder$Mate.top({
    /// optionalParameters: {BorderSide side = BorderSide.none} , hasDefaultValue:true, defaultValueCode:BorderSide.none
    required BorderSide side,

    /// optionalParameters: {double alignment = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double alignment,

    /// optionalParameters: {double size = 1.0} , hasDefaultValue:true, defaultValueCode:1.0
    required double size,
  }) : super.top(
          side: side,
          alignment: alignment,
          size: size,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => LinearBorder$Mate.top(
        side: p.getValue('side'),
        alignment: p.getValue('alignment'),
        size: p.getValue('size'),
      ),
    );
    mateParams.set(name: 'side', init: side);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'size', init: size);
  }

  /// LinearBorder LinearBorder.bottom({BorderSide side = BorderSide.none, double alignment = 0.0, double size = 1.0})
  LinearBorder$Mate.bottom({
    /// optionalParameters: {BorderSide side = BorderSide.none} , hasDefaultValue:true, defaultValueCode:BorderSide.none
    required BorderSide side,

    /// optionalParameters: {double alignment = 0.0} , hasDefaultValue:true, defaultValueCode:0.0
    required double alignment,

    /// optionalParameters: {double size = 1.0} , hasDefaultValue:true, defaultValueCode:1.0
    required double size,
  }) : super.bottom(
          side: side,
          alignment: alignment,
          size: size,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => LinearBorder$Mate.bottom(
        side: p.getValue('side'),
        alignment: p.getValue('alignment'),
        size: p.getValue('size'),
      ),
    );
    mateParams.set(name: 'side', init: side);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'size', init: size);
  }
}
