// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/painting/alignment.dart';
import 'package:note/mate.dart';
import 'dart:core';

/// class Alignment extends AlignmentGeometry
class Alignment$Mate extends Alignment with Mate {
  /// Alignment Alignment(double x, double y)
  Alignment$Mate(
    /// requiredParameters: double x
    double x,

    /// requiredParameters: double y
    double y,
  ) : super(
          x,
          y,
        ) {
    mateCreateName = 'Alignment';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => Alignment$Mate(
          p.get('x').value,
          p.get('y').value,
        );
    mateUse('x', x);
    mateUse('y', y);
  }
}

/// class AlignmentDirectional extends AlignmentGeometry
class AlignmentDirectional$Mate extends AlignmentDirectional with Mate {
  /// AlignmentDirectional AlignmentDirectional(double start, double y)
  AlignmentDirectional$Mate(
    /// requiredParameters: double start
    double start,

    /// requiredParameters: double y
    double y,
  ) : super(
          start,
          y,
        ) {
    mateCreateName = 'AlignmentDirectional';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => AlignmentDirectional$Mate(
          p.get('start').value,
          p.get('y').value,
        );
    mateUse('start', start);
    mateUse('y', y);
  }
}

/// class TextAlignVertical
class TextAlignVertical$Mate extends TextAlignVertical with Mate {
  /// TextAlignVertical TextAlignVertical({required double y})
  TextAlignVertical$Mate(
      {
      /// optionalParameters: {required double y} , defaultValue:none
      required double y})
      : super(y: y) {
    mateCreateName = 'TextAlignVertical';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => TextAlignVertical$Mate(y: p.get('y').build());
    mateUse('y', y);
  }
}
