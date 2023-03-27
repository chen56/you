// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/tooltip_visibility.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';

/// class TooltipVisibility extends StatelessWidget
class TooltipVisibility$Mate extends TooltipVisibility with Mate {
  /// TooltipVisibility TooltipVisibility({Key? key, required bool visible, required Widget child})
  TooltipVisibility$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required bool visible} , defaultValue:none
    required bool visible,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          visible: visible,
          child: child,
        ) {
    mateCreateName = 'TooltipVisibility';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => TooltipVisibility$Mate(
          key: p.get('key').build(),
          visible: p.get('visible').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('visible', visible, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}
