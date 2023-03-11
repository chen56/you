// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/material/navigation_drawer.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:note/mate.dart';

/// class NavigationDrawer extends StatelessWidget
class NavigationDrawer$Mate extends NavigationDrawer with WidgetMate<NavigationDrawer$Mate> {
  /// NavigationDrawer NavigationDrawer({Key? key, required List<Widget> children, Color? backgroundColor, Color? shadowColor, Color? surfaceTintColor, double? elevation, Color? indicatorColor, ShapeBorder? indicatorShape, void Function(int)? onDestinationSelected, int? selectedIndex = 0})
  NavigationDrawer$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required List<Widget> children}
    required List<Widget> children,

    /// param: {Color? backgroundColor}
    Color? backgroundColor,

    /// param: {Color? shadowColor}
    Color? shadowColor,

    /// param: {Color? surfaceTintColor}
    Color? surfaceTintColor,

    /// param: {double? elevation}
    double? elevation,

    /// param: {Color? indicatorColor}
    Color? indicatorColor,

    /// param: {ShapeBorder? indicatorShape}
    ShapeBorder? indicatorShape,

    /// param: {void Function(int)? onDestinationSelected}
    ValueChanged<int>? onDestinationSelected,

    /// param: {int? selectedIndex = 0}
    int? selectedIndex,
  }) : super(
          key: key,
          children: children,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          elevation: elevation,
          indicatorColor: indicatorColor,
          indicatorShape: indicatorShape,
          onDestinationSelected: onDestinationSelected,
          selectedIndex: selectedIndex,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => NavigationDrawer$Mate(
        key: p.getValue('key'),
        children: p.getValue('children'),
        backgroundColor: p.getValue('backgroundColor'),
        shadowColor: p.getValue('shadowColor'),
        surfaceTintColor: p.getValue('surfaceTintColor'),
        elevation: p.getValue('elevation'),
        indicatorColor: p.getValue('indicatorColor'),
        indicatorShape: p.getValue('indicatorShape'),
        onDestinationSelected: p.getValue('onDestinationSelected'),
        selectedIndex: p.getValue('selectedIndex'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'children', init: children);
    mateParams.set(name: 'backgroundColor', init: backgroundColor);
    mateParams.set(name: 'shadowColor', init: shadowColor);
    mateParams.set(name: 'surfaceTintColor', init: surfaceTintColor);
    mateParams.set(name: 'elevation', init: elevation);
    mateParams.set(name: 'indicatorColor', init: indicatorColor);
    mateParams.set(name: 'indicatorShape', init: indicatorShape);
    mateParams.set(name: 'onDestinationSelected', init: onDestinationSelected);
    mateParams.set(name: 'selectedIndex', init: selectedIndex);
  }
}

/// class NavigationDrawerDestination extends StatelessWidget
class NavigationDrawerDestination$Mate extends NavigationDrawerDestination
    with WidgetMate<NavigationDrawerDestination$Mate> {
  /// NavigationDrawerDestination NavigationDrawerDestination({Key? key, Color? backgroundColor, required Widget icon, Widget? selectedIcon, required Widget label})
  NavigationDrawerDestination$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {Color? backgroundColor}
    Color? backgroundColor,

    /// param: {required Widget icon}
    required Widget icon,

    /// param: {Widget? selectedIcon}
    Widget? selectedIcon,

    /// param: {required Widget label}
    required Widget label,
  }) : super(
          key: key,
          backgroundColor: backgroundColor,
          icon: icon,
          selectedIcon: selectedIcon,
          label: label,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => NavigationDrawerDestination$Mate(
        key: p.getValue('key'),
        backgroundColor: p.getValue('backgroundColor'),
        icon: p.getValue('icon'),
        selectedIcon: p.getValue('selectedIcon'),
        label: p.getValue('label'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'backgroundColor', init: backgroundColor);
    mateParams.set(name: 'icon', init: icon);
    mateParams.set(name: 'selectedIcon', init: selectedIcon);
    mateParams.set(name: 'label', init: label);
  }
}
