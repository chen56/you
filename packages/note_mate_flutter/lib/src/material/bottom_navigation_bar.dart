// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/widgets/bottom_navigation_bar_item.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/icon_theme_data.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/services/mouse_cursor.dart';

/// class BottomNavigationBar extends StatefulWidget
class BottomNavigationBar$Mate extends BottomNavigationBar with Mate {
  /// BottomNavigationBar BottomNavigationBar({Key? key, required List<BottomNavigationBarItem> items, void Function(int)? onTap, int currentIndex = 0, double? elevation, BottomNavigationBarType? type, Color? fixedColor, Color? backgroundColor, double iconSize = 24.0, Color? selectedItemColor, Color? unselectedItemColor, IconThemeData? selectedIconTheme, IconThemeData? unselectedIconTheme, double selectedFontSize = 14.0, double unselectedFontSize = 12.0, TextStyle? selectedLabelStyle, TextStyle? unselectedLabelStyle, bool? showSelectedLabels, bool? showUnselectedLabels, MouseCursor? mouseCursor, bool? enableFeedback, BottomNavigationBarLandscapeLayout? landscapeLayout, bool useLegacyColorScheme = true})
  BottomNavigationBar$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required List<BottomNavigationBarItem> items} , defaultValue:none
    required List<BottomNavigationBarItem> items,

    /// optionalParameters: {void Function(int)? onTap} , defaultValue:none
    ValueChanged<int>? onTap,

    /// optionalParameters: {int currentIndex = 0} , defaultValue:Literal
    int currentIndex = 0,

    /// optionalParameters: {double? elevation} , defaultValue:none
    double? elevation,

    /// optionalParameters: {BottomNavigationBarType? type} , defaultValue:none
    BottomNavigationBarType? type,

    /// optionalParameters: {Color? fixedColor} , defaultValue:none
    Color? fixedColor,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {double iconSize = 24.0} , defaultValue:Literal
    double iconSize = 24.0,

    /// optionalParameters: {Color? selectedItemColor} , defaultValue:none
    Color? selectedItemColor,

    /// optionalParameters: {Color? unselectedItemColor} , defaultValue:none
    Color? unselectedItemColor,

    /// optionalParameters: {IconThemeData? selectedIconTheme} , defaultValue:none
    IconThemeData? selectedIconTheme,

    /// optionalParameters: {IconThemeData? unselectedIconTheme} , defaultValue:none
    IconThemeData? unselectedIconTheme,

    /// optionalParameters: {double selectedFontSize = 14.0} , defaultValue:Literal
    double selectedFontSize = 14.0,

    /// optionalParameters: {double unselectedFontSize = 12.0} , defaultValue:Literal
    double unselectedFontSize = 12.0,

    /// optionalParameters: {TextStyle? selectedLabelStyle} , defaultValue:none
    TextStyle? selectedLabelStyle,

    /// optionalParameters: {TextStyle? unselectedLabelStyle} , defaultValue:none
    TextStyle? unselectedLabelStyle,

    /// optionalParameters: {bool? showSelectedLabels} , defaultValue:none
    bool? showSelectedLabels,

    /// optionalParameters: {bool? showUnselectedLabels} , defaultValue:none
    bool? showUnselectedLabels,

    /// optionalParameters: {MouseCursor? mouseCursor} , defaultValue:none
    MouseCursor? mouseCursor,

    /// optionalParameters: {bool? enableFeedback} , defaultValue:none
    bool? enableFeedback,

    /// optionalParameters: {BottomNavigationBarLandscapeLayout? landscapeLayout} , defaultValue:none
    BottomNavigationBarLandscapeLayout? landscapeLayout,

    /// optionalParameters: {bool useLegacyColorScheme = true} , defaultValue:Literal
    bool useLegacyColorScheme = true,
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
    mateCreateName = 'BottomNavigationBar';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => BottomNavigationBar$Mate(
          key: p.get('key').build(),
          items: p.get('items').build(),
          onTap: p.get('onTap').build(),
          currentIndex: p.get('currentIndex').build(),
          elevation: p.get('elevation').build(),
          type: p.get('type').build(),
          fixedColor: p.get('fixedColor').build(),
          backgroundColor: p.get('backgroundColor').build(),
          iconSize: p.get('iconSize').build(),
          selectedItemColor: p.get('selectedItemColor').build(),
          unselectedItemColor: p.get('unselectedItemColor').build(),
          selectedIconTheme: p.get('selectedIconTheme').build(),
          unselectedIconTheme: p.get('unselectedIconTheme').build(),
          selectedFontSize: p.get('selectedFontSize').build(),
          unselectedFontSize: p.get('unselectedFontSize').build(),
          selectedLabelStyle: p.get('selectedLabelStyle').build(),
          unselectedLabelStyle: p.get('unselectedLabelStyle').build(),
          showSelectedLabels: p.get('showSelectedLabels').build(),
          showUnselectedLabels: p.get('showUnselectedLabels').build(),
          mouseCursor: p.get('mouseCursor').build(),
          enableFeedback: p.get('enableFeedback').build(),
          landscapeLayout: p.get('landscapeLayout').build(),
          useLegacyColorScheme: p.get('useLegacyColorScheme').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUseList('items', items, isNamed: true);
    mateUse('onTap', onTap, isNamed: true);
    mateUse('currentIndex', currentIndex, isNamed: true);
    mateUse('elevation', elevation, isNamed: true);
    mateUse('type', type, isNamed: true);
    mateUse('fixedColor', fixedColor, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('iconSize', iconSize, isNamed: true);
    mateUse('selectedItemColor', selectedItemColor, isNamed: true);
    mateUse('unselectedItemColor', unselectedItemColor, isNamed: true);
    mateUse('selectedIconTheme', selectedIconTheme, isNamed: true);
    mateUse('unselectedIconTheme', unselectedIconTheme, isNamed: true);
    mateUse('selectedFontSize', selectedFontSize, isNamed: true);
    mateUse('unselectedFontSize', unselectedFontSize, isNamed: true);
    mateUse('selectedLabelStyle', selectedLabelStyle, isNamed: true);
    mateUse('unselectedLabelStyle', unselectedLabelStyle, isNamed: true);
    mateUse('showSelectedLabels', showSelectedLabels, isNamed: true);
    mateUse('showUnselectedLabels', showUnselectedLabels, isNamed: true);
    mateUse('mouseCursor', mouseCursor, isNamed: true);
    mateUse('enableFeedback', enableFeedback, isNamed: true);
    mateUse('landscapeLayout', landscapeLayout, isNamed: true);
    mateUse('useLegacyColorScheme', useLegacyColorScheme, isNamed: true);
  }
}
