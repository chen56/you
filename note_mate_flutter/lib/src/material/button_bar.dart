// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/button_bar.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/rendering/flex.dart';
import 'package:flutter/src/material/button_theme.dart';
import 'dart:core';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/painting/basic_types.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class ButtonBar extends StatelessWidget
class ButtonBar$Mate extends ButtonBar with WidgetMate<ButtonBar$Mate> {
  /// ButtonBar ButtonBar({Key? key, MainAxisAlignment? alignment, MainAxisSize? mainAxisSize, ButtonTextTheme? buttonTextTheme, double? buttonMinWidth, double? buttonHeight, EdgeInsetsGeometry? buttonPadding, bool? buttonAlignedDropdown, ButtonBarLayoutBehavior? layoutBehavior, VerticalDirection? overflowDirection, double? overflowButtonSpacing, List<Widget> children = const <Widget>[]})
  ButtonBar$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {MainAxisAlignment? alignment} , hasDefaultValue:false, defaultValueCode:null
    MainAxisAlignment? alignment,

    /// optionalParameters: {MainAxisSize? mainAxisSize} , hasDefaultValue:false, defaultValueCode:null
    MainAxisSize? mainAxisSize,

    /// optionalParameters: {ButtonTextTheme? buttonTextTheme} , hasDefaultValue:false, defaultValueCode:null
    ButtonTextTheme? buttonTextTheme,

    /// optionalParameters: {double? buttonMinWidth} , hasDefaultValue:false, defaultValueCode:null
    double? buttonMinWidth,

    /// optionalParameters: {double? buttonHeight} , hasDefaultValue:false, defaultValueCode:null
    double? buttonHeight,

    /// optionalParameters: {EdgeInsetsGeometry? buttonPadding} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? buttonPadding,

    /// optionalParameters: {bool? buttonAlignedDropdown} , hasDefaultValue:false, defaultValueCode:null
    bool? buttonAlignedDropdown,

    /// optionalParameters: {ButtonBarLayoutBehavior? layoutBehavior} , hasDefaultValue:false, defaultValueCode:null
    ButtonBarLayoutBehavior? layoutBehavior,

    /// optionalParameters: {VerticalDirection? overflowDirection} , hasDefaultValue:false, defaultValueCode:null
    VerticalDirection? overflowDirection,

    /// optionalParameters: {double? overflowButtonSpacing} , hasDefaultValue:false, defaultValueCode:null
    double? overflowButtonSpacing,

    /// optionalParameters: {List<Widget> children = const <Widget>[]} , hasDefaultValue:true, defaultValueCode:const <Widget>[]
    required List<Widget> children,
  }) : super(
          key: key,
          alignment: alignment,
          mainAxisSize: mainAxisSize,
          buttonTextTheme: buttonTextTheme,
          buttonMinWidth: buttonMinWidth,
          buttonHeight: buttonHeight,
          buttonPadding: buttonPadding,
          buttonAlignedDropdown: buttonAlignedDropdown,
          layoutBehavior: layoutBehavior,
          overflowDirection: overflowDirection,
          overflowButtonSpacing: overflowButtonSpacing,
          children: children,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ButtonBar$Mate(
        key: p.getValue('key'),
        alignment: p.getValue('alignment'),
        mainAxisSize: p.getValue('mainAxisSize'),
        buttonTextTheme: p.getValue('buttonTextTheme'),
        buttonMinWidth: p.getValue('buttonMinWidth'),
        buttonHeight: p.getValue('buttonHeight'),
        buttonPadding: p.getValue('buttonPadding'),
        buttonAlignedDropdown: p.getValue('buttonAlignedDropdown'),
        layoutBehavior: p.getValue('layoutBehavior'),
        overflowDirection: p.getValue('overflowDirection'),
        overflowButtonSpacing: p.getValue('overflowButtonSpacing'),
        children: p.getValue('children'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'alignment', init: alignment);
    mateParams.set(name: 'mainAxisSize', init: mainAxisSize);
    mateParams.set(name: 'buttonTextTheme', init: buttonTextTheme);
    mateParams.set(name: 'buttonMinWidth', init: buttonMinWidth);
    mateParams.set(name: 'buttonHeight', init: buttonHeight);
    mateParams.set(name: 'buttonPadding', init: buttonPadding);
    mateParams.set(name: 'buttonAlignedDropdown', init: buttonAlignedDropdown);
    mateParams.set(name: 'layoutBehavior', init: layoutBehavior);
    mateParams.set(name: 'overflowDirection', init: overflowDirection);
    mateParams.set(name: 'overflowButtonSpacing', init: overflowButtonSpacing);
    mateParams.set(name: 'children', init: children);
  }
}
