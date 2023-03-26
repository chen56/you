// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/table_border.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/painting/border_radius.dart';

/// class TableBorder
class TableBorder$Mate extends TableBorder with Mate {
  /// TableBorder TableBorder({BorderSide top = BorderSide.none, BorderSide right = BorderSide.none, BorderSide bottom = BorderSide.none, BorderSide left = BorderSide.none, BorderSide horizontalInside = BorderSide.none, BorderSide verticalInside = BorderSide.none, BorderRadius borderRadius = BorderRadius.zero})
  TableBorder$Mate({
    /// optionalParameters: {BorderSide top = BorderSide.none} , defaultValue:unprocessed
    required BorderSide top,

    /// optionalParameters: {BorderSide right = BorderSide.none} , defaultValue:unprocessed
    required BorderSide right,

    /// optionalParameters: {BorderSide bottom = BorderSide.none} , defaultValue:unprocessed
    required BorderSide bottom,

    /// optionalParameters: {BorderSide left = BorderSide.none} , defaultValue:unprocessed
    required BorderSide left,

    /// optionalParameters: {BorderSide horizontalInside = BorderSide.none} , defaultValue:unprocessed
    required BorderSide horizontalInside,

    /// optionalParameters: {BorderSide verticalInside = BorderSide.none} , defaultValue:unprocessed
    required BorderSide verticalInside,

    /// optionalParameters: {BorderRadius borderRadius = BorderRadius.zero} , defaultValue:unprocessed
    required BorderRadius borderRadius,
  }) : super(
          top: top,
          right: right,
          bottom: bottom,
          left: left,
          horizontalInside: horizontalInside,
          verticalInside: verticalInside,
          borderRadius: borderRadius,
        ) {
    mateCreateName = 'TableBorder';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => TableBorder$Mate(
          top: p.get('top').build(),
          right: p.get('right').build(),
          bottom: p.get('bottom').build(),
          left: p.get('left').build(),
          horizontalInside: p.get('horizontalInside').build(),
          verticalInside: p.get('verticalInside').build(),
          borderRadius: p.get('borderRadius').build(),
        );
    mateUse('top', top);
    mateUse('right', right);
    mateUse('bottom', bottom);
    mateUse('left', left);
    mateUse('horizontalInside', horizontalInside);
    mateUse('verticalInside', verticalInside);
    mateUse('borderRadius', borderRadius);
  }
}
