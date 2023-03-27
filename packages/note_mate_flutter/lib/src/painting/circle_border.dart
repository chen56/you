// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/painting/circle_border.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/painting.dart';
import 'dart:core';

/// class CircleBorder extends OutlinedBorder
class CircleBorder$Mate extends CircleBorder with Mate {
  /// CircleBorder CircleBorder({BorderSide side = BorderSide.none, double eccentricity = 0.0})
  CircleBorder$Mate({
    /// optionalParameters: {BorderSide side = BorderSide.none} , defaultValue:PrefixedIdentifier
    BorderSide side = BorderSide.none,

    /// optionalParameters: {double eccentricity = 0.0} , defaultValue:Literal
    double eccentricity = 0.0,
  }) : super(
          side: side,
          eccentricity: eccentricity,
        ) {
    mateCreateName = 'CircleBorder';
    matePackageUrl = 'package:flutter/painting.dart';
    mateBuilder = (p) => CircleBorder$Mate(
          side: p.get('side').build(),
          eccentricity: p.get('eccentricity').build(),
        );
    mateUse('side', side, isNamed: true);
    mateUse('eccentricity', eccentricity, isNamed: true);
  }
}
