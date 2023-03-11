// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/painting/alignment.dart';
import 'dart:core';
import 'package:note/mate.dart';

/// class Alignment extends AlignmentGeometry
class Alignment$Mate extends Alignment with Mate<Alignment$Mate> {
  /// Alignment Alignment(double x, double y)
  Alignment$Mate(
    /// param: double x
    double x,

    /// param: double y
    double y,
  ) : super(
          x,
          y,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Alignment$Mate(
        p.getValue('x'),
        p.getValue('y'),
      ),
    );
    mateParams.set(name: 'x', init: x);
    mateParams.set(name: 'y', init: y);
  }
}

/// class AlignmentDirectional extends AlignmentGeometry
class AlignmentDirectional$Mate extends AlignmentDirectional with Mate<AlignmentDirectional$Mate> {
  /// AlignmentDirectional AlignmentDirectional(double start, double y)
  AlignmentDirectional$Mate(
    /// param: double start
    double start,

    /// param: double y
    double y,
  ) : super(
          start,
          y,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => AlignmentDirectional$Mate(
        p.getValue('start'),
        p.getValue('y'),
      ),
    );
    mateParams.set(name: 'start', init: start);
    mateParams.set(name: 'y', init: y);
  }
}

/// class TextAlignVertical
class TextAlignVertical$Mate extends TextAlignVertical with Mate<TextAlignVertical$Mate> {
  /// TextAlignVertical TextAlignVertical({required double y})
  TextAlignVertical$Mate(
      {
      /// param: {required double y}
      required double y})
      : super(y: y) {
    mateParams = Params(
      init: this,
      builder: (p) => TextAlignVertical$Mate(y: p.getValue('y')),
    );
    mateParams.set(name: 'y', init: y);
  }
}
