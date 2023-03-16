// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/snack_bar.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/material/snack_bar_theme.dart';
import 'package:flutter/src/animation/animation.dart';
import 'package:flutter/src/widgets/dismissible.dart';

/// class SnackBarAction extends StatefulWidget
class SnackBarAction$Mate extends SnackBarAction with WidgetMate<SnackBarAction$Mate> {
  /// SnackBarAction SnackBarAction({Key? key, Color? textColor, Color? disabledTextColor, required String label, required void Function() onPressed})
  SnackBarAction$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Color? textColor} , hasDefaultValue:false, defaultValueCode:null
    Color? textColor,

    /// optionalParameters: {Color? disabledTextColor} , hasDefaultValue:false, defaultValueCode:null
    Color? disabledTextColor,

    /// optionalParameters: {required String label} , hasDefaultValue:false, defaultValueCode:null
    required String label,

    /// optionalParameters: {required void Function() onPressed} , hasDefaultValue:false, defaultValueCode:null
    required VoidCallback onPressed,
  }) : super(
          key: key,
          textColor: textColor,
          disabledTextColor: disabledTextColor,
          label: label,
          onPressed: onPressed,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => SnackBarAction$Mate(
        key: p.get('key').value,
        textColor: p.get('textColor').value,
        disabledTextColor: p.get('disabledTextColor').value,
        label: p.get('label').value,
        onPressed: p.get('onPressed').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('textColor', textColor);
    mateParams.put('disabledTextColor', disabledTextColor);
    mateParams.put('label', label);
    mateParams.put('onPressed', onPressed);
  }
}

/// class SnackBar extends StatefulWidget
class SnackBar$Mate extends SnackBar with WidgetMate<SnackBar$Mate> {
  /// SnackBar SnackBar({Key? key, required Widget content, Color? backgroundColor, double? elevation, EdgeInsetsGeometry? margin, EdgeInsetsGeometry? padding, double? width, ShapeBorder? shape, SnackBarBehavior? behavior, SnackBarAction? action, double? actionOverflowThreshold, bool? showCloseIcon, Color? closeIconColor, Duration duration = _snackBarDisplayDuration, Animation<double>? animation, void Function()? onVisible, DismissDirection dismissDirection = DismissDirection.down, Clip clipBehavior = Clip.hardEdge})
  SnackBar$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required Widget content} , hasDefaultValue:false, defaultValueCode:null
    required Widget content,

    /// optionalParameters: {Color? backgroundColor} , hasDefaultValue:false, defaultValueCode:null
    Color? backgroundColor,

    /// optionalParameters: {double? elevation} , hasDefaultValue:false, defaultValueCode:null
    double? elevation,

    /// optionalParameters: {EdgeInsetsGeometry? margin} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? margin,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? padding,

    /// optionalParameters: {double? width} , hasDefaultValue:false, defaultValueCode:null
    double? width,

    /// optionalParameters: {ShapeBorder? shape} , hasDefaultValue:false, defaultValueCode:null
    ShapeBorder? shape,

    /// optionalParameters: {SnackBarBehavior? behavior} , hasDefaultValue:false, defaultValueCode:null
    SnackBarBehavior? behavior,

    /// optionalParameters: {SnackBarAction? action} , hasDefaultValue:false, defaultValueCode:null
    SnackBarAction? action,

    /// optionalParameters: {double? actionOverflowThreshold} , hasDefaultValue:false, defaultValueCode:null
    double? actionOverflowThreshold,

    /// optionalParameters: {bool? showCloseIcon} , hasDefaultValue:false, defaultValueCode:null
    bool? showCloseIcon,

    /// optionalParameters: {Color? closeIconColor} , hasDefaultValue:false, defaultValueCode:null
    Color? closeIconColor,

    /// optionalParameters: {Duration duration = _snackBarDisplayDuration} , hasDefaultValue:true, defaultValueCode:_snackBarDisplayDuration
    required Duration duration,

    /// optionalParameters: {Animation<double>? animation} , hasDefaultValue:false, defaultValueCode:null
    Animation<double>? animation,

    /// optionalParameters: {void Function()? onVisible} , hasDefaultValue:false, defaultValueCode:null
    VoidCallback? onVisible,

    /// optionalParameters: {DismissDirection dismissDirection = DismissDirection.down} , hasDefaultValue:true, defaultValueCode:DismissDirection.down
    required DismissDirection dismissDirection,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , hasDefaultValue:true, defaultValueCode:Clip.hardEdge
    required Clip clipBehavior,
  }) : super(
          key: key,
          content: content,
          backgroundColor: backgroundColor,
          elevation: elevation,
          margin: margin,
          padding: padding,
          width: width,
          shape: shape,
          behavior: behavior,
          action: action,
          actionOverflowThreshold: actionOverflowThreshold,
          showCloseIcon: showCloseIcon,
          closeIconColor: closeIconColor,
          duration: duration,
          animation: animation,
          onVisible: onVisible,
          dismissDirection: dismissDirection,
          clipBehavior: clipBehavior,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => SnackBar$Mate(
        key: p.get('key').value,
        content: p.get('content').value,
        backgroundColor: p.get('backgroundColor').value,
        elevation: p.get('elevation').value,
        margin: p.get('margin').value,
        padding: p.get('padding').value,
        width: p.get('width').value,
        shape: p.get('shape').value,
        behavior: p.get('behavior').value,
        action: p.get('action').value,
        actionOverflowThreshold: p.get('actionOverflowThreshold').value,
        showCloseIcon: p.get('showCloseIcon').value,
        closeIconColor: p.get('closeIconColor').value,
        duration: p.get('duration').value,
        animation: p.get('animation').value,
        onVisible: p.get('onVisible').value,
        dismissDirection: p.get('dismissDirection').value,
        clipBehavior: p.get('clipBehavior').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('content', content);
    mateParams.put('backgroundColor', backgroundColor);
    mateParams.put('elevation', elevation);
    mateParams.put('margin', margin);
    mateParams.put('padding', padding);
    mateParams.put('width', width);
    mateParams.put('shape', shape);
    mateParams.put('behavior', behavior);
    mateParams.put('action', action);
    mateParams.put('actionOverflowThreshold', actionOverflowThreshold);
    mateParams.put('showCloseIcon', showCloseIcon);
    mateParams.put('closeIconColor', closeIconColor);
    mateParams.put('duration', duration);
    mateParams.put('animation', animation);
    mateParams.put('onVisible', onVisible);
    mateParams.put('dismissDirection', dismissDirection);
    mateParams.put('clipBehavior', clipBehavior);
  }
}
