// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/input_border.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/painting/border_radius.dart';
import 'dart:core';

/// class UnderlineInputBorder extends InputBorder
class UnderlineInputBorder$Mate extends UnderlineInputBorder with Mate {
  /// UnderlineInputBorder UnderlineInputBorder({BorderSide borderSide = const BorderSide(), BorderRadius borderRadius = const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0))})
  UnderlineInputBorder$Mate({
    /// optionalParameters: {BorderSide borderSide = const BorderSide()} , defaultValue:unprocessed
    required BorderSide borderSide,

    /// optionalParameters: {BorderRadius borderRadius = const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0))} , defaultValue:unprocessed
    required BorderRadius borderRadius,
  }) : super(
          borderSide: borderSide,
          borderRadius: borderRadius,
        ) {
    mateCreateName = 'UnderlineInputBorder';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => UnderlineInputBorder$Mate(
          borderSide: p.get('borderSide').build(),
          borderRadius: p.get('borderRadius').build(),
        );
    mateUse('borderSide', borderSide);
    mateUse('borderRadius', borderRadius);
  }
}

/// class OutlineInputBorder extends InputBorder
class OutlineInputBorder$Mate extends OutlineInputBorder with Mate {
  /// OutlineInputBorder OutlineInputBorder({BorderSide borderSide = const BorderSide(), BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0)), double gapPadding = 4.0})
  OutlineInputBorder$Mate({
    /// optionalParameters: {BorderSide borderSide = const BorderSide()} , defaultValue:unprocessed
    required BorderSide borderSide,

    /// optionalParameters: {BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0))} , defaultValue:unprocessed
    required BorderRadius borderRadius,

    /// optionalParameters: {double gapPadding = 4.0} , defaultValue:Literal
    double gapPadding = 4.0,
  }) : super(
          borderSide: borderSide,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        ) {
    mateCreateName = 'OutlineInputBorder';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => OutlineInputBorder$Mate(
          borderSide: p.get('borderSide').build(),
          borderRadius: p.get('borderRadius').build(),
          gapPadding: p.get('gapPadding').build(),
        );
    mateUse('borderSide', borderSide);
    mateUse('borderRadius', borderRadius);
    mateUse('gapPadding', gapPadding);
  }
}
