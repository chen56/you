// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/text_selection_toolbar_text_button.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'dart:ui';
import 'package:flutter/src/painting/alignment.dart';

/// class TextSelectionToolbarTextButton extends StatelessWidget
class TextSelectionToolbarTextButton$Mate extends TextSelectionToolbarTextButton with Mate {
  /// TextSelectionToolbarTextButton TextSelectionToolbarTextButton({Key? key, required Widget child, required EdgeInsets padding, void Function()? onPressed, AlignmentGeometry? alignment})
  TextSelectionToolbarTextButton$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {required EdgeInsets padding} , defaultValue:none
    required EdgeInsets padding,

    /// optionalParameters: {void Function()? onPressed} , defaultValue:none
    VoidCallback? onPressed,

    /// optionalParameters: {AlignmentGeometry? alignment} , defaultValue:none
    AlignmentGeometry? alignment,
  }) : super(
          key: key,
          child: child,
          padding: padding,
          onPressed: onPressed,
          alignment: alignment,
        ) {
    mateCreateName = 'TextSelectionToolbarTextButton';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => TextSelectionToolbarTextButton$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          padding: p.get('padding').build(),
          onPressed: p.get('onPressed').build(),
          alignment: p.get('alignment').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('child', child, isNamed: true);
    mateUse('padding', padding, isNamed: true);
    mateUse('onPressed', onPressed, isNamed: true);
    mateUse('alignment', alignment, isNamed: true);
  }
}
