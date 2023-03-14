// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/bottom_navigation_bar_item.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';
import 'dart:ui';
import 'package:note/mate.dart';

/// class BottomNavigationBarItem
class BottomNavigationBarItem$Mate extends BottomNavigationBarItem with Mate<BottomNavigationBarItem$Mate> {
  /// BottomNavigationBarItem BottomNavigationBarItem({required Widget icon, String? label, Widget? activeIcon, Color? backgroundColor, String? tooltip})
  BottomNavigationBarItem$Mate({
    /// optionalParameters: {required Widget icon} , hasDefaultValue:false, defaultValueCode:null
    required Widget icon,

    /// optionalParameters: {String? label} , hasDefaultValue:false, defaultValueCode:null
    String? label,

    /// optionalParameters: {Widget? activeIcon} , hasDefaultValue:false, defaultValueCode:null
    Widget? activeIcon,

    /// optionalParameters: {Color? backgroundColor} , hasDefaultValue:false, defaultValueCode:null
    Color? backgroundColor,

    /// optionalParameters: {String? tooltip} , hasDefaultValue:false, defaultValueCode:null
    String? tooltip,
  }) : super(
          icon: icon,
          label: label,
          activeIcon: activeIcon,
          backgroundColor: backgroundColor,
          tooltip: tooltip,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BottomNavigationBarItem$Mate(
        icon: p.getValue('icon'),
        label: p.getValue('label'),
        activeIcon: p.getValue('activeIcon'),
        backgroundColor: p.getValue('backgroundColor'),
        tooltip: p.getValue('tooltip'),
      ),
    );
    mateParams.set(name: 'icon', init: icon);
    mateParams.set(name: 'label', init: label);
    mateParams.set(name: 'activeIcon', init: activeIcon);
    mateParams.set(name: 'backgroundColor', init: backgroundColor);
    mateParams.set(name: 'tooltip', init: tooltip);
  }
}
