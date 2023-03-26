// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/expansion_tile.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'dart:core';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/rendering/flex.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'dart:ui';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/material/list_tile.dart';

/// class ExpansionTile extends StatefulWidget
class ExpansionTile$Mate extends ExpansionTile with Mate {
  /// ExpansionTile ExpansionTile({Key? key, Widget? leading, required Widget title, Widget? subtitle, void Function(bool)? onExpansionChanged, List<Widget> children = const <Widget>[], Widget? trailing, bool initiallyExpanded = false, bool maintainState = false, EdgeInsetsGeometry? tilePadding, CrossAxisAlignment? expandedCrossAxisAlignment, Alignment? expandedAlignment, EdgeInsetsGeometry? childrenPadding, Color? backgroundColor, Color? collapsedBackgroundColor, Color? textColor, Color? collapsedTextColor, Color? iconColor, Color? collapsedIconColor, ShapeBorder? shape, ShapeBorder? collapsedShape, Clip? clipBehavior, ListTileControlAffinity? controlAffinity})
  ExpansionTile$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Widget? leading} , defaultValue:none
    Widget? leading,

    /// optionalParameters: {required Widget title} , defaultValue:none
    required Widget title,

    /// optionalParameters: {Widget? subtitle} , defaultValue:none
    Widget? subtitle,

    /// optionalParameters: {void Function(bool)? onExpansionChanged} , defaultValue:none
    ValueChanged<bool>? onExpansionChanged,

    /// optionalParameters: {List<Widget> children = const <Widget>[]} , defaultValue:unprocessed
    required List<Widget> children,

    /// optionalParameters: {Widget? trailing} , defaultValue:none
    Widget? trailing,

    /// optionalParameters: {bool initiallyExpanded = false} , defaultValue:Literal
    bool initiallyExpanded = false,

    /// optionalParameters: {bool maintainState = false} , defaultValue:Literal
    bool maintainState = false,

    /// optionalParameters: {EdgeInsetsGeometry? tilePadding} , defaultValue:none
    EdgeInsetsGeometry? tilePadding,

    /// optionalParameters: {CrossAxisAlignment? expandedCrossAxisAlignment} , defaultValue:none
    CrossAxisAlignment? expandedCrossAxisAlignment,

    /// optionalParameters: {Alignment? expandedAlignment} , defaultValue:none
    Alignment? expandedAlignment,

    /// optionalParameters: {EdgeInsetsGeometry? childrenPadding} , defaultValue:none
    EdgeInsetsGeometry? childrenPadding,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {Color? collapsedBackgroundColor} , defaultValue:none
    Color? collapsedBackgroundColor,

    /// optionalParameters: {Color? textColor} , defaultValue:none
    Color? textColor,

    /// optionalParameters: {Color? collapsedTextColor} , defaultValue:none
    Color? collapsedTextColor,

    /// optionalParameters: {Color? iconColor} , defaultValue:none
    Color? iconColor,

    /// optionalParameters: {Color? collapsedIconColor} , defaultValue:none
    Color? collapsedIconColor,

    /// optionalParameters: {ShapeBorder? shape} , defaultValue:none
    ShapeBorder? shape,

    /// optionalParameters: {ShapeBorder? collapsedShape} , defaultValue:none
    ShapeBorder? collapsedShape,

    /// optionalParameters: {Clip? clipBehavior} , defaultValue:none
    Clip? clipBehavior,

    /// optionalParameters: {ListTileControlAffinity? controlAffinity} , defaultValue:none
    ListTileControlAffinity? controlAffinity,
  }) : super(
          key: key,
          leading: leading,
          title: title,
          subtitle: subtitle,
          onExpansionChanged: onExpansionChanged,
          children: children,
          trailing: trailing,
          initiallyExpanded: initiallyExpanded,
          maintainState: maintainState,
          tilePadding: tilePadding,
          expandedCrossAxisAlignment: expandedCrossAxisAlignment,
          expandedAlignment: expandedAlignment,
          childrenPadding: childrenPadding,
          backgroundColor: backgroundColor,
          collapsedBackgroundColor: collapsedBackgroundColor,
          textColor: textColor,
          collapsedTextColor: collapsedTextColor,
          iconColor: iconColor,
          collapsedIconColor: collapsedIconColor,
          shape: shape,
          collapsedShape: collapsedShape,
          clipBehavior: clipBehavior,
          controlAffinity: controlAffinity,
        ) {
    mateCreateName = 'ExpansionTile';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ExpansionTile$Mate(
          key: p.get('key').build(),
          leading: p.get('leading').build(),
          title: p.get('title').build(),
          subtitle: p.get('subtitle').build(),
          onExpansionChanged: p.get('onExpansionChanged').build(),
          children: p.get('children').build(),
          trailing: p.get('trailing').build(),
          initiallyExpanded: p.get('initiallyExpanded').build(),
          maintainState: p.get('maintainState').build(),
          tilePadding: p.get('tilePadding').build(),
          expandedCrossAxisAlignment: p.get('expandedCrossAxisAlignment').build(),
          expandedAlignment: p.get('expandedAlignment').build(),
          childrenPadding: p.get('childrenPadding').build(),
          backgroundColor: p.get('backgroundColor').build(),
          collapsedBackgroundColor: p.get('collapsedBackgroundColor').build(),
          textColor: p.get('textColor').build(),
          collapsedTextColor: p.get('collapsedTextColor').build(),
          iconColor: p.get('iconColor').build(),
          collapsedIconColor: p.get('collapsedIconColor').build(),
          shape: p.get('shape').build(),
          collapsedShape: p.get('collapsedShape').build(),
          clipBehavior: p.get('clipBehavior').build(),
          controlAffinity: p.get('controlAffinity').build(),
        );
    mateUse('key', key);
    mateUse('leading', leading);
    mateUse('title', title);
    mateUse('subtitle', subtitle);
    mateUse('onExpansionChanged', onExpansionChanged);
    mateUse('children', children);
    mateUse('trailing', trailing);
    mateUse('initiallyExpanded', initiallyExpanded);
    mateUse('maintainState', maintainState);
    mateUse('tilePadding', tilePadding);
    mateUse('expandedCrossAxisAlignment', expandedCrossAxisAlignment);
    mateUse('expandedAlignment', expandedAlignment);
    mateUse('childrenPadding', childrenPadding);
    mateUse('backgroundColor', backgroundColor);
    mateUse('collapsedBackgroundColor', collapsedBackgroundColor);
    mateUse('textColor', textColor);
    mateUse('collapsedTextColor', collapsedTextColor);
    mateUse('iconColor', iconColor);
    mateUse('collapsedIconColor', collapsedIconColor);
    mateUse('shape', shape);
    mateUse('collapsedShape', collapsedShape);
    mateUse('clipBehavior', clipBehavior);
    mateUse('controlAffinity', controlAffinity);
  }
}
