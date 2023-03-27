// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/banner.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/widgets/overflow_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/animation/animation.dart';

/// class MaterialBanner extends StatefulWidget
class MaterialBanner$Mate extends MaterialBanner with Mate {
  /// MaterialBanner MaterialBanner({Key? key, required Widget content, TextStyle? contentTextStyle, required List<Widget> actions, double? elevation, Widget? leading, Color? backgroundColor, Color? surfaceTintColor, Color? shadowColor, Color? dividerColor, EdgeInsetsGeometry? padding, EdgeInsetsGeometry? margin, EdgeInsetsGeometry? leadingPadding, bool forceActionsBelow = false, OverflowBarAlignment overflowAlignment = OverflowBarAlignment.end, Animation<double>? animation, void Function()? onVisible})
  MaterialBanner$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget content} , defaultValue:none
    required Widget content,

    /// optionalParameters: {TextStyle? contentTextStyle} , defaultValue:none
    TextStyle? contentTextStyle,

    /// optionalParameters: {required List<Widget> actions} , defaultValue:none
    required List<Widget> actions,

    /// optionalParameters: {double? elevation} , defaultValue:none
    double? elevation,

    /// optionalParameters: {Widget? leading} , defaultValue:none
    Widget? leading,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {Color? surfaceTintColor} , defaultValue:none
    Color? surfaceTintColor,

    /// optionalParameters: {Color? shadowColor} , defaultValue:none
    Color? shadowColor,

    /// optionalParameters: {Color? dividerColor} , defaultValue:none
    Color? dividerColor,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , defaultValue:none
    EdgeInsetsGeometry? padding,

    /// optionalParameters: {EdgeInsetsGeometry? margin} , defaultValue:none
    EdgeInsetsGeometry? margin,

    /// optionalParameters: {EdgeInsetsGeometry? leadingPadding} , defaultValue:none
    EdgeInsetsGeometry? leadingPadding,

    /// optionalParameters: {bool forceActionsBelow = false} , defaultValue:Literal
    bool forceActionsBelow = false,

    /// optionalParameters: {OverflowBarAlignment overflowAlignment = OverflowBarAlignment.end} , defaultValue:PrefixedIdentifier
    OverflowBarAlignment overflowAlignment = OverflowBarAlignment.end,

    /// optionalParameters: {Animation<double>? animation} , defaultValue:none
    Animation<double>? animation,

    /// optionalParameters: {void Function()? onVisible} , defaultValue:none
    VoidCallback? onVisible,
  }) : super(
          key: key,
          content: content,
          contentTextStyle: contentTextStyle,
          actions: actions,
          elevation: elevation,
          leading: leading,
          backgroundColor: backgroundColor,
          surfaceTintColor: surfaceTintColor,
          shadowColor: shadowColor,
          dividerColor: dividerColor,
          padding: padding,
          margin: margin,
          leadingPadding: leadingPadding,
          forceActionsBelow: forceActionsBelow,
          overflowAlignment: overflowAlignment,
          animation: animation,
          onVisible: onVisible,
        ) {
    mateCreateName = 'MaterialBanner';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => MaterialBanner$Mate(
          key: p.get('key').build(),
          content: p.get('content').build(),
          contentTextStyle: p.get('contentTextStyle').build(),
          actions: p.get('actions').build(),
          elevation: p.get('elevation').build(),
          leading: p.get('leading').build(),
          backgroundColor: p.get('backgroundColor').build(),
          surfaceTintColor: p.get('surfaceTintColor').build(),
          shadowColor: p.get('shadowColor').build(),
          dividerColor: p.get('dividerColor').build(),
          padding: p.get('padding').build(),
          margin: p.get('margin').build(),
          leadingPadding: p.get('leadingPadding').build(),
          forceActionsBelow: p.get('forceActionsBelow').build(),
          overflowAlignment: p.get('overflowAlignment').build(),
          animation: p.get('animation').build(),
          onVisible: p.get('onVisible').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('content', content, isNamed: true);
    mateUse('contentTextStyle', contentTextStyle, isNamed: true);
    mateUseList('actions', actions, isNamed: true);
    mateUse('elevation', elevation, isNamed: true);
    mateUse('leading', leading, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('surfaceTintColor', surfaceTintColor, isNamed: true);
    mateUse('shadowColor', shadowColor, isNamed: true);
    mateUse('dividerColor', dividerColor, isNamed: true);
    mateUse('padding', padding, isNamed: true);
    mateUse('margin', margin, isNamed: true);
    mateUse('leadingPadding', leadingPadding, isNamed: true);
    mateUse('forceActionsBelow', forceActionsBelow, isNamed: true);
    mateUse('overflowAlignment', overflowAlignment, isNamed: true);
    mateUse('animation', animation, isNamed: true);
    mateUse('onVisible', onVisible, isNamed: true);
  }
}
