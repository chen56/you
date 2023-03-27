// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/expansion_tile_theme.dart';
import 'package:note/mate.dart';
import 'dart:ui';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class ExpansionTileThemeData with Diagnosticable
class ExpansionTileThemeData$Mate extends ExpansionTileThemeData with Mate {
  /// ExpansionTileThemeData ExpansionTileThemeData({Color? backgroundColor, Color? collapsedBackgroundColor, EdgeInsetsGeometry? tilePadding, AlignmentGeometry? expandedAlignment, EdgeInsetsGeometry? childrenPadding, Color? iconColor, Color? collapsedIconColor, Color? textColor, Color? collapsedTextColor, ShapeBorder? shape, ShapeBorder? collapsedShape, Clip? clipBehavior})
  ExpansionTileThemeData$Mate({
    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {Color? collapsedBackgroundColor} , defaultValue:none
    Color? collapsedBackgroundColor,

    /// optionalParameters: {EdgeInsetsGeometry? tilePadding} , defaultValue:none
    EdgeInsetsGeometry? tilePadding,

    /// optionalParameters: {AlignmentGeometry? expandedAlignment} , defaultValue:none
    AlignmentGeometry? expandedAlignment,

    /// optionalParameters: {EdgeInsetsGeometry? childrenPadding} , defaultValue:none
    EdgeInsetsGeometry? childrenPadding,

    /// optionalParameters: {Color? iconColor} , defaultValue:none
    Color? iconColor,

    /// optionalParameters: {Color? collapsedIconColor} , defaultValue:none
    Color? collapsedIconColor,

    /// optionalParameters: {Color? textColor} , defaultValue:none
    Color? textColor,

    /// optionalParameters: {Color? collapsedTextColor} , defaultValue:none
    Color? collapsedTextColor,

    /// optionalParameters: {ShapeBorder? shape} , defaultValue:none
    ShapeBorder? shape,

    /// optionalParameters: {ShapeBorder? collapsedShape} , defaultValue:none
    ShapeBorder? collapsedShape,

    /// optionalParameters: {Clip? clipBehavior} , defaultValue:none
    Clip? clipBehavior,
  }) : super(
          backgroundColor: backgroundColor,
          collapsedBackgroundColor: collapsedBackgroundColor,
          tilePadding: tilePadding,
          expandedAlignment: expandedAlignment,
          childrenPadding: childrenPadding,
          iconColor: iconColor,
          collapsedIconColor: collapsedIconColor,
          textColor: textColor,
          collapsedTextColor: collapsedTextColor,
          shape: shape,
          collapsedShape: collapsedShape,
          clipBehavior: clipBehavior,
        ) {
    mateCreateName = 'ExpansionTileThemeData';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ExpansionTileThemeData$Mate(
          backgroundColor: p.get('backgroundColor').build(),
          collapsedBackgroundColor: p.get('collapsedBackgroundColor').build(),
          tilePadding: p.get('tilePadding').build(),
          expandedAlignment: p.get('expandedAlignment').build(),
          childrenPadding: p.get('childrenPadding').build(),
          iconColor: p.get('iconColor').build(),
          collapsedIconColor: p.get('collapsedIconColor').build(),
          textColor: p.get('textColor').build(),
          collapsedTextColor: p.get('collapsedTextColor').build(),
          shape: p.get('shape').build(),
          collapsedShape: p.get('collapsedShape').build(),
          clipBehavior: p.get('clipBehavior').build(),
        );
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('collapsedBackgroundColor', collapsedBackgroundColor, isNamed: true);
    mateUse('tilePadding', tilePadding, isNamed: true);
    mateUse('expandedAlignment', expandedAlignment, isNamed: true);
    mateUse('childrenPadding', childrenPadding, isNamed: true);
    mateUse('iconColor', iconColor, isNamed: true);
    mateUse('collapsedIconColor', collapsedIconColor, isNamed: true);
    mateUse('textColor', textColor, isNamed: true);
    mateUse('collapsedTextColor', collapsedTextColor, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('collapsedShape', collapsedShape, isNamed: true);
    mateUse('clipBehavior', clipBehavior, isNamed: true);
  }
}

/// class ExpansionTileTheme extends InheritedTheme
class ExpansionTileTheme$Mate extends ExpansionTileTheme with Mate {
  /// ExpansionTileTheme ExpansionTileTheme({Key? key, required ExpansionTileThemeData data, required Widget child})
  ExpansionTileTheme$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required ExpansionTileThemeData data} , defaultValue:none
    required ExpansionTileThemeData data,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateCreateName = 'ExpansionTileTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ExpansionTileTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('data', data, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}
