// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/painting/border_radius.dart';
import 'dart:ui';
import 'package:note/mate.dart';
import 'dart:core';

/// class BorderRadius extends BorderRadiusGeometry
class BorderRadius$Mate extends BorderRadius with Mate<BorderRadius$Mate> {
  /// BorderRadius BorderRadius.all(Radius radius)
  BorderRadius$Mate.all(

      /// requiredParameters: Radius radius
      Radius radius)
      : super.all(radius) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BorderRadius$Mate.all(p.get('radius').value),
    );
    mateParams.put('radius', radius);
  }

  /// BorderRadius BorderRadius.circular(double radius)
  BorderRadius$Mate.circular(

      /// requiredParameters: double radius
      double radius)
      : super.circular(radius) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BorderRadius$Mate.circular(p.get('radius').value),
    );
    mateParams.put('radius', radius);
  }

  /// BorderRadius BorderRadius.vertical({Radius top = Radius.zero, Radius bottom = Radius.zero})
  BorderRadius$Mate.vertical({
    /// optionalParameters: {Radius top = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius top,

    /// optionalParameters: {Radius bottom = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius bottom,
  }) : super.vertical(
          top: top,
          bottom: bottom,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BorderRadius$Mate.vertical(
        top: p.get('top').value,
        bottom: p.get('bottom').value,
      ),
    );
    mateParams.put('top', top);
    mateParams.put('bottom', bottom);
  }

  /// BorderRadius BorderRadius.horizontal({Radius left = Radius.zero, Radius right = Radius.zero})
  BorderRadius$Mate.horizontal({
    /// optionalParameters: {Radius left = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius left,

    /// optionalParameters: {Radius right = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius right,
  }) : super.horizontal(
          left: left,
          right: right,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BorderRadius$Mate.horizontal(
        left: p.get('left').value,
        right: p.get('right').value,
      ),
    );
    mateParams.put('left', left);
    mateParams.put('right', right);
  }

  /// BorderRadius BorderRadius.only({Radius topLeft = Radius.zero, Radius topRight = Radius.zero, Radius bottomLeft = Radius.zero, Radius bottomRight = Radius.zero})
  BorderRadius$Mate.only({
    /// optionalParameters: {Radius topLeft = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius topLeft,

    /// optionalParameters: {Radius topRight = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius topRight,

    /// optionalParameters: {Radius bottomLeft = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius bottomLeft,

    /// optionalParameters: {Radius bottomRight = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius bottomRight,
  }) : super.only(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BorderRadius$Mate.only(
        topLeft: p.get('topLeft').value,
        topRight: p.get('topRight').value,
        bottomLeft: p.get('bottomLeft').value,
        bottomRight: p.get('bottomRight').value,
      ),
    );
    mateParams.put('topLeft', topLeft);
    mateParams.put('topRight', topRight);
    mateParams.put('bottomLeft', bottomLeft);
    mateParams.put('bottomRight', bottomRight);
  }
}

/// class BorderRadiusDirectional extends BorderRadiusGeometry
class BorderRadiusDirectional$Mate extends BorderRadiusDirectional with Mate<BorderRadiusDirectional$Mate> {
  /// BorderRadiusDirectional BorderRadiusDirectional.all(Radius radius)
  BorderRadiusDirectional$Mate.all(

      /// requiredParameters: Radius radius
      Radius radius)
      : super.all(radius) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BorderRadiusDirectional$Mate.all(p.get('radius').value),
    );
    mateParams.put('radius', radius);
  }

  /// BorderRadiusDirectional BorderRadiusDirectional.circular(double radius)
  BorderRadiusDirectional$Mate.circular(

      /// requiredParameters: double radius
      double radius)
      : super.circular(radius) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BorderRadiusDirectional$Mate.circular(p.get('radius').value),
    );
    mateParams.put('radius', radius);
  }

  /// BorderRadiusDirectional BorderRadiusDirectional.vertical({Radius top = Radius.zero, Radius bottom = Radius.zero})
  BorderRadiusDirectional$Mate.vertical({
    /// optionalParameters: {Radius top = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius top,

    /// optionalParameters: {Radius bottom = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius bottom,
  }) : super.vertical(
          top: top,
          bottom: bottom,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BorderRadiusDirectional$Mate.vertical(
        top: p.get('top').value,
        bottom: p.get('bottom').value,
      ),
    );
    mateParams.put('top', top);
    mateParams.put('bottom', bottom);
  }

  /// BorderRadiusDirectional BorderRadiusDirectional.horizontal({Radius start = Radius.zero, Radius end = Radius.zero})
  BorderRadiusDirectional$Mate.horizontal({
    /// optionalParameters: {Radius start = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius start,

    /// optionalParameters: {Radius end = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius end,
  }) : super.horizontal(
          start: start,
          end: end,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BorderRadiusDirectional$Mate.horizontal(
        start: p.get('start').value,
        end: p.get('end').value,
      ),
    );
    mateParams.put('start', start);
    mateParams.put('end', end);
  }

  /// BorderRadiusDirectional BorderRadiusDirectional.only({Radius topStart = Radius.zero, Radius topEnd = Radius.zero, Radius bottomStart = Radius.zero, Radius bottomEnd = Radius.zero})
  BorderRadiusDirectional$Mate.only({
    /// optionalParameters: {Radius topStart = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius topStart,

    /// optionalParameters: {Radius topEnd = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius topEnd,

    /// optionalParameters: {Radius bottomStart = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius bottomStart,

    /// optionalParameters: {Radius bottomEnd = Radius.zero} , hasDefaultValue:true, defaultValueCode:Radius.zero
    required Radius bottomEnd,
  }) : super.only(
          topStart: topStart,
          topEnd: topEnd,
          bottomStart: bottomStart,
          bottomEnd: bottomEnd,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => BorderRadiusDirectional$Mate.only(
        topStart: p.get('topStart').value,
        topEnd: p.get('topEnd').value,
        bottomStart: p.get('bottomStart').value,
        bottomEnd: p.get('bottomEnd').value,
      ),
    );
    mateParams.put('topStart', topStart);
    mateParams.put('topEnd', topEnd);
    mateParams.put('bottomStart', bottomStart);
    mateParams.put('bottomEnd', bottomEnd);
  }
}
