// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/tooltip_visibility.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class TooltipVisibility extends StatelessWidget
class TooltipVisibility$Mate extends TooltipVisibility with WidgetMate<TooltipVisibility$Mate> {
  /// TooltipVisibility TooltipVisibility({Key? key, required bool visible, required Widget child})
  TooltipVisibility$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required bool visible} , hasDefaultValue:false, defaultValueCode:null
    required bool visible,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          visible: visible,
          child: child,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => TooltipVisibility$Mate(
        key: p.get('key').value,
        visible: p.get('visible').value,
        child: p.get('child').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('visible', visible);
    mateParams.put('child', child);
  }
}
