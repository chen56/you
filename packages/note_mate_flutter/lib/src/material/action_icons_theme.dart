// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/action_icons_theme.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';

/// class ActionIconThemeData with Diagnosticable
class ActionIconThemeData$Mate extends ActionIconThemeData with Mate {
  /// ActionIconThemeData ActionIconThemeData({Widget Function(BuildContext)? backButtonIconBuilder, Widget Function(BuildContext)? closeButtonIconBuilder, Widget Function(BuildContext)? drawerButtonIconBuilder, Widget Function(BuildContext)? endDrawerButtonIconBuilder})
  ActionIconThemeData$Mate({
    /// optionalParameters: {Widget Function(BuildContext)? backButtonIconBuilder} , defaultValue:none
    WidgetBuilder? backButtonIconBuilder,

    /// optionalParameters: {Widget Function(BuildContext)? closeButtonIconBuilder} , defaultValue:none
    WidgetBuilder? closeButtonIconBuilder,

    /// optionalParameters: {Widget Function(BuildContext)? drawerButtonIconBuilder} , defaultValue:none
    WidgetBuilder? drawerButtonIconBuilder,

    /// optionalParameters: {Widget Function(BuildContext)? endDrawerButtonIconBuilder} , defaultValue:none
    WidgetBuilder? endDrawerButtonIconBuilder,
  }) : super(
          backButtonIconBuilder: backButtonIconBuilder,
          closeButtonIconBuilder: closeButtonIconBuilder,
          drawerButtonIconBuilder: drawerButtonIconBuilder,
          endDrawerButtonIconBuilder: endDrawerButtonIconBuilder,
        ) {
    mateCreateName = 'ActionIconThemeData';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ActionIconThemeData$Mate(
          backButtonIconBuilder: p.get('backButtonIconBuilder').build(),
          closeButtonIconBuilder: p.get('closeButtonIconBuilder').build(),
          drawerButtonIconBuilder: p.get('drawerButtonIconBuilder').build(),
          endDrawerButtonIconBuilder: p.get('endDrawerButtonIconBuilder').build(),
        );
    mateUse('backButtonIconBuilder', backButtonIconBuilder, isNamed: true);
    mateUse('closeButtonIconBuilder', closeButtonIconBuilder, isNamed: true);
    mateUse('drawerButtonIconBuilder', drawerButtonIconBuilder, isNamed: true);
    mateUse('endDrawerButtonIconBuilder', endDrawerButtonIconBuilder, isNamed: true);
  }
}

/// class ActionIconTheme extends InheritedTheme
class ActionIconTheme$Mate extends ActionIconTheme with Mate {
  /// ActionIconTheme ActionIconTheme({Key? key, required ActionIconThemeData data, required Widget child})
  ActionIconTheme$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required ActionIconThemeData data} , defaultValue:none
    required ActionIconThemeData data,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateCreateName = 'ActionIconTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ActionIconTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('data', data, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}
