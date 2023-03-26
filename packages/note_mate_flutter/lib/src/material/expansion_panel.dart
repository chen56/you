// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/expansion_panel.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/painting/edge_insets.dart';

/// class ExpansionPanel
class ExpansionPanel$Mate extends ExpansionPanel with Mate {
  /// ExpansionPanel ExpansionPanel({required Widget Function(BuildContext, bool) headerBuilder, required Widget body, bool isExpanded = false, bool canTapOnHeader = false, Color? backgroundColor})
  ExpansionPanel$Mate({
    /// optionalParameters: {required Widget Function(BuildContext, bool) headerBuilder} , defaultValue:none
    required ExpansionPanelHeaderBuilder headerBuilder,

    /// optionalParameters: {required Widget body} , defaultValue:none
    required Widget body,

    /// optionalParameters: {bool isExpanded = false} , defaultValue:Literal
    bool isExpanded = false,

    /// optionalParameters: {bool canTapOnHeader = false} , defaultValue:Literal
    bool canTapOnHeader = false,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,
  }) : super(
          headerBuilder: headerBuilder,
          body: body,
          isExpanded: isExpanded,
          canTapOnHeader: canTapOnHeader,
          backgroundColor: backgroundColor,
        ) {
    mateCreateName = 'ExpansionPanel';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ExpansionPanel$Mate(
          headerBuilder: p.get('headerBuilder').build(),
          body: p.get('body').build(),
          isExpanded: p.get('isExpanded').build(),
          canTapOnHeader: p.get('canTapOnHeader').build(),
          backgroundColor: p.get('backgroundColor').build(),
        );
    mateUse('headerBuilder', headerBuilder);
    mateUse('body', body);
    mateUse('isExpanded', isExpanded);
    mateUse('canTapOnHeader', canTapOnHeader);
    mateUse('backgroundColor', backgroundColor);
  }
}

/// class ExpansionPanelRadio extends ExpansionPanel
class ExpansionPanelRadio$Mate extends ExpansionPanelRadio with Mate {
  /// ExpansionPanelRadio ExpansionPanelRadio({required Object value, required Widget Function(BuildContext, bool) headerBuilder, required Widget body, bool canTapOnHeader = false, Color? backgroundColor})
  ExpansionPanelRadio$Mate({
    /// optionalParameters: {required Object value} , defaultValue:none
    required Object value,

    /// optionalParameters: {required Widget Function(BuildContext, bool) headerBuilder} , defaultValue:none
    required ExpansionPanelHeaderBuilder headerBuilder,

    /// optionalParameters: {required Widget body} , defaultValue:none
    required Widget body,

    /// optionalParameters: {bool canTapOnHeader = false} , defaultValue:Literal
    bool canTapOnHeader = false,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,
  }) : super(
          value: value,
          headerBuilder: headerBuilder,
          body: body,
          canTapOnHeader: canTapOnHeader,
          backgroundColor: backgroundColor,
        ) {
    mateCreateName = 'ExpansionPanelRadio';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ExpansionPanelRadio$Mate(
          value: p.get('value').build(),
          headerBuilder: p.get('headerBuilder').build(),
          body: p.get('body').build(),
          canTapOnHeader: p.get('canTapOnHeader').build(),
          backgroundColor: p.get('backgroundColor').build(),
        );
    mateUse('value', value);
    mateUse('headerBuilder', headerBuilder);
    mateUse('body', body);
    mateUse('canTapOnHeader', canTapOnHeader);
    mateUse('backgroundColor', backgroundColor);
  }
}

/// class ExpansionPanelList extends StatefulWidget
class ExpansionPanelList$Mate extends ExpansionPanelList with Mate {
  /// ExpansionPanelList ExpansionPanelList({Key? key, List<ExpansionPanel> children = const <ExpansionPanel>[], void Function(int, bool)? expansionCallback, Duration animationDuration = kThemeAnimationDuration, EdgeInsets expandedHeaderPadding = _kPanelHeaderExpandedDefaultPadding, Color? dividerColor, double elevation = 2, Color? expandIconColor})
  ExpansionPanelList$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {List<ExpansionPanel> children = const <ExpansionPanel>[]} , defaultValue:unprocessed
    required List<ExpansionPanel> children,

    /// optionalParameters: {void Function(int, bool)? expansionCallback} , defaultValue:none
    ExpansionPanelCallback? expansionCallback,

    /// optionalParameters: {Duration animationDuration = kThemeAnimationDuration} , defaultValue:unprocessed
    required Duration animationDuration,

    /// optionalParameters: {EdgeInsets expandedHeaderPadding = _kPanelHeaderExpandedDefaultPadding} , defaultValue:unprocessed
    required EdgeInsets expandedHeaderPadding,

    /// optionalParameters: {Color? dividerColor} , defaultValue:none
    Color? dividerColor,

    /// optionalParameters: {double elevation = 2} , defaultValue:Literal
    double elevation = 2,

    /// optionalParameters: {Color? expandIconColor} , defaultValue:none
    Color? expandIconColor,
  }) : super(
          key: key,
          children: children,
          expansionCallback: expansionCallback,
          animationDuration: animationDuration,
          expandedHeaderPadding: expandedHeaderPadding,
          dividerColor: dividerColor,
          elevation: elevation,
          expandIconColor: expandIconColor,
        ) {
    mateCreateName = 'ExpansionPanelList';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ExpansionPanelList$Mate(
          key: p.get('key').build(),
          children: p.get('children').build(),
          expansionCallback: p.get('expansionCallback').build(),
          animationDuration: p.get('animationDuration').build(),
          expandedHeaderPadding: p.get('expandedHeaderPadding').build(),
          dividerColor: p.get('dividerColor').build(),
          elevation: p.get('elevation').build(),
          expandIconColor: p.get('expandIconColor').build(),
        );
    mateUse('key', key);
    mateUse('children', children);
    mateUse('expansionCallback', expansionCallback);
    mateUse('animationDuration', animationDuration);
    mateUse('expandedHeaderPadding', expandedHeaderPadding);
    mateUse('dividerColor', dividerColor);
    mateUse('elevation', elevation);
    mateUse('expandIconColor', expandIconColor);
  }

  /// ExpansionPanelList ExpansionPanelList.radio({Key? key, List<ExpansionPanel> children = const <ExpansionPanelRadio>[], void Function(int, bool)? expansionCallback, Duration animationDuration = kThemeAnimationDuration, Object? initialOpenPanelValue, EdgeInsets expandedHeaderPadding = _kPanelHeaderExpandedDefaultPadding, Color? dividerColor, double elevation = 2, Color? expandIconColor})
  ExpansionPanelList$Mate.radio({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {List<ExpansionPanel> children = const <ExpansionPanelRadio>[]} , defaultValue:unprocessed
    required List<ExpansionPanel> children,

    /// optionalParameters: {void Function(int, bool)? expansionCallback} , defaultValue:none
    ExpansionPanelCallback? expansionCallback,

    /// optionalParameters: {Duration animationDuration = kThemeAnimationDuration} , defaultValue:unprocessed
    required Duration animationDuration,

    /// optionalParameters: {Object? initialOpenPanelValue} , defaultValue:none
    Object? initialOpenPanelValue,

    /// optionalParameters: {EdgeInsets expandedHeaderPadding = _kPanelHeaderExpandedDefaultPadding} , defaultValue:unprocessed
    required EdgeInsets expandedHeaderPadding,

    /// optionalParameters: {Color? dividerColor} , defaultValue:none
    Color? dividerColor,

    /// optionalParameters: {double elevation = 2} , defaultValue:Literal
    double elevation = 2,

    /// optionalParameters: {Color? expandIconColor} , defaultValue:none
    Color? expandIconColor,
  }) : super.radio(
          key: key,
          children: children,
          expansionCallback: expansionCallback,
          animationDuration: animationDuration,
          initialOpenPanelValue: initialOpenPanelValue,
          expandedHeaderPadding: expandedHeaderPadding,
          dividerColor: dividerColor,
          elevation: elevation,
          expandIconColor: expandIconColor,
        ) {
    mateCreateName = 'ExpansionPanelList.radio';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ExpansionPanelList$Mate.radio(
          key: p.get('key').build(),
          children: p.get('children').build(),
          expansionCallback: p.get('expansionCallback').build(),
          animationDuration: p.get('animationDuration').build(),
          initialOpenPanelValue: p.get('initialOpenPanelValue').build(),
          expandedHeaderPadding: p.get('expandedHeaderPadding').build(),
          dividerColor: p.get('dividerColor').build(),
          elevation: p.get('elevation').build(),
          expandIconColor: p.get('expandIconColor').build(),
        );
    mateUse('key', key);
    mateUse('children', children);
    mateUse('expansionCallback', expansionCallback);
    mateUse('animationDuration', animationDuration);
    mateUse('initialOpenPanelValue', initialOpenPanelValue);
    mateUse('expandedHeaderPadding', expandedHeaderPadding);
    mateUse('dividerColor', dividerColor);
    mateUse('elevation', elevation);
    mateUse('expandIconColor', expandIconColor);
  }
}
