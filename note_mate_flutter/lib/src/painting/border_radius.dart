// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/painting/border_radius.dart';
import 'dart:ui';
import 'package:note/mate.dart';
import 'dart:core';

/// class BorderRadius extends BorderRadiusGeometry
class BorderRadius$Mate extends BorderRadius with Mate<BorderRadius$Mate> {
  /// BorderRadius BorderRadius.all(Radius radius)
  BorderRadius$Mate.all(

      /// param: Radius radius
      Radius radius)
      : super.all(radius) {
    mateParams = Params(
      init: this,
      builder: (p) => BorderRadius$Mate.all(p.getValue('radius')),
    );
    mateParams.set(name: 'radius', init: radius);
  }

  /// BorderRadius BorderRadius.circular(double radius)
  BorderRadius$Mate.circular(

      /// param: double radius
      double radius)
      : super.circular(radius) {
    mateParams = Params(
      init: this,
      builder: (p) => BorderRadius$Mate.circular(p.getValue('radius')),
    );
    mateParams.set(name: 'radius', init: radius);
  }

  /// BorderRadius BorderRadius.vertical({Radius top = Radius.zero, Radius bottom = Radius.zero})
  BorderRadius$Mate.vertical({
    /// param: {Radius top = Radius.zero}
    required Radius top,

    /// param: {Radius bottom = Radius.zero}
    required Radius bottom,
  }) : super.vertical(
          top: top,
          bottom: bottom,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BorderRadius$Mate.vertical(
        top: p.getValue('top'),
        bottom: p.getValue('bottom'),
      ),
    );
    mateParams.set(name: 'top', init: top);
    mateParams.set(name: 'bottom', init: bottom);
  }

  /// BorderRadius BorderRadius.horizontal({Radius left = Radius.zero, Radius right = Radius.zero})
  BorderRadius$Mate.horizontal({
    /// param: {Radius left = Radius.zero}
    required Radius left,

    /// param: {Radius right = Radius.zero}
    required Radius right,
  }) : super.horizontal(
          left: left,
          right: right,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BorderRadius$Mate.horizontal(
        left: p.getValue('left'),
        right: p.getValue('right'),
      ),
    );
    mateParams.set(name: 'left', init: left);
    mateParams.set(name: 'right', init: right);
  }

  /// BorderRadius BorderRadius.only({Radius topLeft = Radius.zero, Radius topRight = Radius.zero, Radius bottomLeft = Radius.zero, Radius bottomRight = Radius.zero})
  BorderRadius$Mate.only({
    /// param: {Radius topLeft = Radius.zero}
    required Radius topLeft,

    /// param: {Radius topRight = Radius.zero}
    required Radius topRight,

    /// param: {Radius bottomLeft = Radius.zero}
    required Radius bottomLeft,

    /// param: {Radius bottomRight = Radius.zero}
    required Radius bottomRight,
  }) : super.only(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BorderRadius$Mate.only(
        topLeft: p.getValue('topLeft'),
        topRight: p.getValue('topRight'),
        bottomLeft: p.getValue('bottomLeft'),
        bottomRight: p.getValue('bottomRight'),
      ),
    );
    mateParams.set(name: 'topLeft', init: topLeft);
    mateParams.set(name: 'topRight', init: topRight);
    mateParams.set(name: 'bottomLeft', init: bottomLeft);
    mateParams.set(name: 'bottomRight', init: bottomRight);
  }
}

/// class BorderRadiusDirectional extends BorderRadiusGeometry
class BorderRadiusDirectional$Mate extends BorderRadiusDirectional with Mate<BorderRadiusDirectional$Mate> {
  /// BorderRadiusDirectional BorderRadiusDirectional.all(Radius radius)
  BorderRadiusDirectional$Mate.all(

      /// param: Radius radius
      Radius radius)
      : super.all(radius) {
    mateParams = Params(
      init: this,
      builder: (p) => BorderRadiusDirectional$Mate.all(p.getValue('radius')),
    );
    mateParams.set(name: 'radius', init: radius);
  }

  /// BorderRadiusDirectional BorderRadiusDirectional.circular(double radius)
  BorderRadiusDirectional$Mate.circular(

      /// param: double radius
      double radius)
      : super.circular(radius) {
    mateParams = Params(
      init: this,
      builder: (p) => BorderRadiusDirectional$Mate.circular(p.getValue('radius')),
    );
    mateParams.set(name: 'radius', init: radius);
  }

  /// BorderRadiusDirectional BorderRadiusDirectional.vertical({Radius top = Radius.zero, Radius bottom = Radius.zero})
  BorderRadiusDirectional$Mate.vertical({
    /// param: {Radius top = Radius.zero}
    required Radius top,

    /// param: {Radius bottom = Radius.zero}
    required Radius bottom,
  }) : super.vertical(
          top: top,
          bottom: bottom,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BorderRadiusDirectional$Mate.vertical(
        top: p.getValue('top'),
        bottom: p.getValue('bottom'),
      ),
    );
    mateParams.set(name: 'top', init: top);
    mateParams.set(name: 'bottom', init: bottom);
  }

  /// BorderRadiusDirectional BorderRadiusDirectional.horizontal({Radius start = Radius.zero, Radius end = Radius.zero})
  BorderRadiusDirectional$Mate.horizontal({
    /// param: {Radius start = Radius.zero}
    required Radius start,

    /// param: {Radius end = Radius.zero}
    required Radius end,
  }) : super.horizontal(
          start: start,
          end: end,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BorderRadiusDirectional$Mate.horizontal(
        start: p.getValue('start'),
        end: p.getValue('end'),
      ),
    );
    mateParams.set(name: 'start', init: start);
    mateParams.set(name: 'end', init: end);
  }

  /// BorderRadiusDirectional BorderRadiusDirectional.only({Radius topStart = Radius.zero, Radius topEnd = Radius.zero, Radius bottomStart = Radius.zero, Radius bottomEnd = Radius.zero})
  BorderRadiusDirectional$Mate.only({
    /// param: {Radius topStart = Radius.zero}
    required Radius topStart,

    /// param: {Radius topEnd = Radius.zero}
    required Radius topEnd,

    /// param: {Radius bottomStart = Radius.zero}
    required Radius bottomStart,

    /// param: {Radius bottomEnd = Radius.zero}
    required Radius bottomEnd,
  }) : super.only(
          topStart: topStart,
          topEnd: topEnd,
          bottomStart: bottomStart,
          bottomEnd: bottomEnd,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BorderRadiusDirectional$Mate.only(
        topStart: p.getValue('topStart'),
        topEnd: p.getValue('topEnd'),
        bottomStart: p.getValue('bottomStart'),
        bottomEnd: p.getValue('bottomEnd'),
      ),
    );
    mateParams.set(name: 'topStart', init: topStart);
    mateParams.set(name: 'topEnd', init: topEnd);
    mateParams.set(name: 'bottomStart', init: bottomStart);
    mateParams.set(name: 'bottomEnd', init: bottomEnd);
  }
}
