// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/painting/rounded_rectangle_border.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/painting/border_radius.dart';
import 'package:note/mate.dart';

/// class RoundedRectangleBorder extends OutlinedBorder
class RoundedRectangleBorder$Mate extends RoundedRectangleBorder with Mate<RoundedRectangleBorder$Mate> {
  /// RoundedRectangleBorder RoundedRectangleBorder({BorderSide side = BorderSide.none, BorderRadiusGeometry borderRadius = BorderRadius.zero})
  RoundedRectangleBorder$Mate({
    /// optionalParameters: {BorderSide side = BorderSide.none} , hasDefaultValue:true, defaultValueCode:BorderSide.none
    required BorderSide side,

    /// optionalParameters: {BorderRadiusGeometry borderRadius = BorderRadius.zero} , hasDefaultValue:true, defaultValueCode:BorderRadius.zero
    required BorderRadiusGeometry borderRadius,
  }) : super(
          side: side,
          borderRadius: borderRadius,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RoundedRectangleBorder$Mate(
        side: p.getValue('side'),
        borderRadius: p.getValue('borderRadius'),
      ),
    );
    mateParams.set(name: 'side', init: side);
    mateParams.set(name: 'borderRadius', init: borderRadius);
  }
}
