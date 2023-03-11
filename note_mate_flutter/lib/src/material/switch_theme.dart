// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/material/switch_theme.dart';
import 'package:flutter/src/material/material_state.dart';
import 'dart:ui';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'dart:core';
import 'package:flutter/src/widgets/icon.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class SwitchThemeData with Diagnosticable
class SwitchThemeData$Mate extends SwitchThemeData with Mate<SwitchThemeData$Mate> {
  /// SwitchThemeData SwitchThemeData({MaterialStateProperty<Color?>? thumbColor, MaterialStateProperty<Color?>? trackColor, MaterialStateProperty<Color?>? trackOutlineColor, MaterialTapTargetSize? materialTapTargetSize, MaterialStateProperty<MouseCursor?>? mouseCursor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, MaterialStateProperty<Icon?>? thumbIcon})
  SwitchThemeData$Mate({
    /// param: {MaterialStateProperty<Color?>? thumbColor}
    MaterialStateProperty<Color?>? thumbColor,

    /// param: {MaterialStateProperty<Color?>? trackColor}
    MaterialStateProperty<Color?>? trackColor,

    /// param: {MaterialStateProperty<Color?>? trackOutlineColor}
    MaterialStateProperty<Color?>? trackOutlineColor,

    /// param: {MaterialTapTargetSize? materialTapTargetSize}
    MaterialTapTargetSize? materialTapTargetSize,

    /// param: {MaterialStateProperty<MouseCursor?>? mouseCursor}
    MaterialStateProperty<MouseCursor?>? mouseCursor,

    /// param: {MaterialStateProperty<Color?>? overlayColor}
    MaterialStateProperty<Color?>? overlayColor,

    /// param: {double? splashRadius}
    double? splashRadius,

    /// param: {MaterialStateProperty<Icon?>? thumbIcon}
    MaterialStateProperty<Icon?>? thumbIcon,
  }) : super(
          thumbColor: thumbColor,
          trackColor: trackColor,
          trackOutlineColor: trackOutlineColor,
          materialTapTargetSize: materialTapTargetSize,
          mouseCursor: mouseCursor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          thumbIcon: thumbIcon,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SwitchThemeData$Mate(
        thumbColor: p.getValue('thumbColor'),
        trackColor: p.getValue('trackColor'),
        trackOutlineColor: p.getValue('trackOutlineColor'),
        materialTapTargetSize: p.getValue('materialTapTargetSize'),
        mouseCursor: p.getValue('mouseCursor'),
        overlayColor: p.getValue('overlayColor'),
        splashRadius: p.getValue('splashRadius'),
        thumbIcon: p.getValue('thumbIcon'),
      ),
    );
    mateParams.set(name: 'thumbColor', init: thumbColor);
    mateParams.set(name: 'trackColor', init: trackColor);
    mateParams.set(name: 'trackOutlineColor', init: trackOutlineColor);
    mateParams.set(name: 'materialTapTargetSize', init: materialTapTargetSize);
    mateParams.set(name: 'mouseCursor', init: mouseCursor);
    mateParams.set(name: 'overlayColor', init: overlayColor);
    mateParams.set(name: 'splashRadius', init: splashRadius);
    mateParams.set(name: 'thumbIcon', init: thumbIcon);
  }
}

/// class SwitchTheme extends InheritedWidget
class SwitchTheme$Mate extends SwitchTheme with WidgetMate<SwitchTheme$Mate> {
  /// SwitchTheme SwitchTheme({Key? key, required SwitchThemeData data, required Widget child})
  SwitchTheme$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required SwitchThemeData data}
    required SwitchThemeData data,

    /// param: {required Widget child}
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SwitchTheme$Mate(
        key: p.getValue('key'),
        data: p.getValue('data'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'data', init: data);
    mateParams.set(name: 'child', init: child);
  }
}
