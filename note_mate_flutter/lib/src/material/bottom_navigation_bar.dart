// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/widgets/bottom_navigation_bar_item.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/icon_theme_data.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'package:note/mate.dart';

/// class BottomNavigationBar extends StatefulWidget
class BottomNavigationBar$Mate extends BottomNavigationBar with WidgetMate<BottomNavigationBar$Mate> {
  /// BottomNavigationBar BottomNavigationBar({Key? key, required List<BottomNavigationBarItem> items, void Function(int)? onTap, int currentIndex = 0, double? elevation, BottomNavigationBarType? type, Color? fixedColor, Color? backgroundColor, double iconSize = 24.0, Color? selectedItemColor, Color? unselectedItemColor, IconThemeData? selectedIconTheme, IconThemeData? unselectedIconTheme, double selectedFontSize = 14.0, double unselectedFontSize = 12.0, TextStyle? selectedLabelStyle, TextStyle? unselectedLabelStyle, bool? showSelectedLabels, bool? showUnselectedLabels, MouseCursor? mouseCursor, bool? enableFeedback, BottomNavigationBarLandscapeLayout? landscapeLayout, bool useLegacyColorScheme = true})
  BottomNavigationBar$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required List<BottomNavigationBarItem> items} , hasDefaultValue:false, defaultValueCode:null
    required List<BottomNavigationBarItem> items,

    /// optionalParameters: {void Function(int)? onTap} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<int>? onTap,

    /// optionalParameters: {int currentIndex = 0} , hasDefaultValue:true, defaultValueCode:0
    required int currentIndex,

    /// optionalParameters: {double? elevation} , hasDefaultValue:false, defaultValueCode:null
    double? elevation,

    /// optionalParameters: {BottomNavigationBarType? type} , hasDefaultValue:false, defaultValueCode:null
    BottomNavigationBarType? type,

    /// optionalParameters: {Color? fixedColor} , hasDefaultValue:false, defaultValueCode:null
    Color? fixedColor,

    /// optionalParameters: {Color? backgroundColor} , hasDefaultValue:false, defaultValueCode:null
    Color? backgroundColor,

    /// optionalParameters: {double iconSize = 24.0} , hasDefaultValue:true, defaultValueCode:24.0
    required double iconSize,

    /// optionalParameters: {Color? selectedItemColor} , hasDefaultValue:false, defaultValueCode:null
    Color? selectedItemColor,

    /// optionalParameters: {Color? unselectedItemColor} , hasDefaultValue:false, defaultValueCode:null
    Color? unselectedItemColor,

    /// optionalParameters: {IconThemeData? selectedIconTheme} , hasDefaultValue:false, defaultValueCode:null
    IconThemeData? selectedIconTheme,

    /// optionalParameters: {IconThemeData? unselectedIconTheme} , hasDefaultValue:false, defaultValueCode:null
    IconThemeData? unselectedIconTheme,

    /// optionalParameters: {double selectedFontSize = 14.0} , hasDefaultValue:true, defaultValueCode:14.0
    required double selectedFontSize,

    /// optionalParameters: {double unselectedFontSize = 12.0} , hasDefaultValue:true, defaultValueCode:12.0
    required double unselectedFontSize,

    /// optionalParameters: {TextStyle? selectedLabelStyle} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? selectedLabelStyle,

    /// optionalParameters: {TextStyle? unselectedLabelStyle} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? unselectedLabelStyle,

    /// optionalParameters: {bool? showSelectedLabels} , hasDefaultValue:false, defaultValueCode:null
    bool? showSelectedLabels,

    /// optionalParameters: {bool? showUnselectedLabels} , hasDefaultValue:false, defaultValueCode:null
    bool? showUnselectedLabels,

    /// optionalParameters: {MouseCursor? mouseCursor} , hasDefaultValue:false, defaultValueCode:null
    MouseCursor? mouseCursor,

    /// optionalParameters: {bool? enableFeedback} , hasDefaultValue:false, defaultValueCode:null
    bool? enableFeedback,

    /// optionalParameters: {BottomNavigationBarLandscapeLayout? landscapeLayout} , hasDefaultValue:false, defaultValueCode:null
    BottomNavigationBarLandscapeLayout? landscapeLayout,

    /// optionalParameters: {bool useLegacyColorScheme = true} , hasDefaultValue:true, defaultValueCode:true
    required bool useLegacyColorScheme,
  }) : super(
          key: key,
          items: items,
          onTap: onTap,
          currentIndex: currentIndex,
          elevation: elevation,
          type: type,
          fixedColor: fixedColor,
          backgroundColor: backgroundColor,
          iconSize: iconSize,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unselectedItemColor,
          selectedIconTheme: selectedIconTheme,
          unselectedIconTheme: unselectedIconTheme,
          selectedFontSize: selectedFontSize,
          unselectedFontSize: unselectedFontSize,
          selectedLabelStyle: selectedLabelStyle,
          unselectedLabelStyle: unselectedLabelStyle,
          showSelectedLabels: showSelectedLabels,
          showUnselectedLabels: showUnselectedLabels,
          mouseCursor: mouseCursor,
          enableFeedback: enableFeedback,
          landscapeLayout: landscapeLayout,
          useLegacyColorScheme: useLegacyColorScheme,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BottomNavigationBar$Mate(
        key: p.getValue('key'),
        items: p.getValue('items'),
        onTap: p.getValue('onTap'),
        currentIndex: p.getValue('currentIndex'),
        elevation: p.getValue('elevation'),
        type: p.getValue('type'),
        fixedColor: p.getValue('fixedColor'),
        backgroundColor: p.getValue('backgroundColor'),
        iconSize: p.getValue('iconSize'),
        selectedItemColor: p.getValue('selectedItemColor'),
        unselectedItemColor: p.getValue('unselectedItemColor'),
        selectedIconTheme: p.getValue('selectedIconTheme'),
        unselectedIconTheme: p.getValue('unselectedIconTheme'),
        selectedFontSize: p.getValue('selectedFontSize'),
        unselectedFontSize: p.getValue('unselectedFontSize'),
        selectedLabelStyle: p.getValue('selectedLabelStyle'),
        unselectedLabelStyle: p.getValue('unselectedLabelStyle'),
        showSelectedLabels: p.getValue('showSelectedLabels'),
        showUnselectedLabels: p.getValue('showUnselectedLabels'),
        mouseCursor: p.getValue('mouseCursor'),
        enableFeedback: p.getValue('enableFeedback'),
        landscapeLayout: p.getValue('landscapeLayout'),
        useLegacyColorScheme: p.getValue('useLegacyColorScheme'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'items', init: items);
    mateParams.set(name: 'onTap', init: onTap);
    mateParams.set(name: 'currentIndex', init: currentIndex);
    mateParams.set(name: 'elevation', init: elevation);
    mateParams.set(name: 'type', init: type);
    mateParams.set(name: 'fixedColor', init: fixedColor);
    mateParams.set(name: 'backgroundColor', init: backgroundColor);
    mateParams.set(name: 'iconSize', init: iconSize);
    mateParams.set(name: 'selectedItemColor', init: selectedItemColor);
    mateParams.set(name: 'unselectedItemColor', init: unselectedItemColor);
    mateParams.set(name: 'selectedIconTheme', init: selectedIconTheme);
    mateParams.set(name: 'unselectedIconTheme', init: unselectedIconTheme);
    mateParams.set(name: 'selectedFontSize', init: selectedFontSize);
    mateParams.set(name: 'unselectedFontSize', init: unselectedFontSize);
    mateParams.set(name: 'selectedLabelStyle', init: selectedLabelStyle);
    mateParams.set(name: 'unselectedLabelStyle', init: unselectedLabelStyle);
    mateParams.set(name: 'showSelectedLabels', init: showSelectedLabels);
    mateParams.set(name: 'showUnselectedLabels', init: showUnselectedLabels);
    mateParams.set(name: 'mouseCursor', init: mouseCursor);
    mateParams.set(name: 'enableFeedback', init: enableFeedback);
    mateParams.set(name: 'landscapeLayout', init: landscapeLayout);
    mateParams.set(name: 'useLegacyColorScheme', init: useLegacyColorScheme);
  }
}
