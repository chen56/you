// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/arc.dart';
import 'dart:ui';
import 'package:note/mate.dart';

/// class MaterialPointArcTween extends Tween<Offset>
class MaterialPointArcTween$Mate extends MaterialPointArcTween with Mate<MaterialPointArcTween$Mate> {
  /// MaterialPointArcTween MaterialPointArcTween({Offset? begin, Offset? end})
  MaterialPointArcTween$Mate({
    /// optionalParameters: {Offset? begin} , hasDefaultValue:false, defaultValueCode:null
    Offset? begin,

    /// optionalParameters: {Offset? end} , hasDefaultValue:false, defaultValueCode:null
    Offset? end,
  }) : super(
          begin: begin,
          end: end,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => MaterialPointArcTween$Mate(
        begin: p.getValue('begin'),
        end: p.getValue('end'),
      ),
    );
    mateParams.set(name: 'begin', init: begin);
    mateParams.set(name: 'end', init: end);
  }
}

/// class MaterialRectArcTween extends RectTween
class MaterialRectArcTween$Mate extends MaterialRectArcTween with Mate<MaterialRectArcTween$Mate> {
  /// MaterialRectArcTween MaterialRectArcTween({Rect? begin, Rect? end})
  MaterialRectArcTween$Mate({
    /// optionalParameters: {Rect? begin} , hasDefaultValue:false, defaultValueCode:null
    Rect? begin,

    /// optionalParameters: {Rect? end} , hasDefaultValue:false, defaultValueCode:null
    Rect? end,
  }) : super(
          begin: begin,
          end: end,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => MaterialRectArcTween$Mate(
        begin: p.getValue('begin'),
        end: p.getValue('end'),
      ),
    );
    mateParams.set(name: 'begin', init: begin);
    mateParams.set(name: 'end', init: end);
  }
}

/// class MaterialRectCenterArcTween extends RectTween
class MaterialRectCenterArcTween$Mate extends MaterialRectCenterArcTween with Mate<MaterialRectCenterArcTween$Mate> {
  /// MaterialRectCenterArcTween MaterialRectCenterArcTween({Rect? begin, Rect? end})
  MaterialRectCenterArcTween$Mate({
    /// optionalParameters: {Rect? begin} , hasDefaultValue:false, defaultValueCode:null
    Rect? begin,

    /// optionalParameters: {Rect? end} , hasDefaultValue:false, defaultValueCode:null
    Rect? end,
  }) : super(
          begin: begin,
          end: end,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => MaterialRectCenterArcTween$Mate(
        begin: p.getValue('begin'),
        end: p.getValue('end'),
      ),
    );
    mateParams.set(name: 'begin', init: begin);
    mateParams.set(name: 'end', init: end);
  }
}
