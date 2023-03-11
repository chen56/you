// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/material/radio.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:note/mate.dart';

/// class Radio<T> extends StatefulWidget
class Radio$Mate<T> extends Radio<T> with WidgetMate<Radio$Mate> {
  /// Radio<T> Radio({Key? key, required T value, required T? groupValue, required void Function(T?)? onChanged, MouseCursor? mouseCursor, bool toggleable = false, Color? activeColor, MaterialStateProperty<Color?>? fillColor, Color? focusColor, Color? hoverColor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, MaterialTapTargetSize? materialTapTargetSize, VisualDensity? visualDensity, FocusNode? focusNode, bool autofocus = false})
  Radio$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required T value}
    required T value,

    /// param: {required T? groupValue}
    required T? groupValue,

    /// param: {required void Function(T?)? onChanged}
    required ValueChanged<T?>? onChanged,

    /// param: {MouseCursor? mouseCursor}
    MouseCursor? mouseCursor,

    /// param: {bool toggleable = false}
    required bool toggleable,

    /// param: {Color? activeColor}
    Color? activeColor,

    /// param: {MaterialStateProperty<Color?>? fillColor}
    MaterialStateProperty<Color?>? fillColor,

    /// param: {Color? focusColor}
    Color? focusColor,

    /// param: {Color? hoverColor}
    Color? hoverColor,

    /// param: {MaterialStateProperty<Color?>? overlayColor}
    MaterialStateProperty<Color?>? overlayColor,

    /// param: {double? splashRadius}
    double? splashRadius,

    /// param: {MaterialTapTargetSize? materialTapTargetSize}
    MaterialTapTargetSize? materialTapTargetSize,

    /// param: {VisualDensity? visualDensity}
    VisualDensity? visualDensity,

    /// param: {FocusNode? focusNode}
    FocusNode? focusNode,

    /// param: {bool autofocus = false}
    required bool autofocus,
  }) : super(
          key: key,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          mouseCursor: mouseCursor,
          toggleable: toggleable,
          activeColor: activeColor,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          materialTapTargetSize: materialTapTargetSize,
          visualDensity: visualDensity,
          focusNode: focusNode,
          autofocus: autofocus,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Radio$Mate(
        key: p.getValue('key'),
        value: p.getValue('value'),
        groupValue: p.getValue('groupValue'),
        onChanged: p.getValue('onChanged'),
        mouseCursor: p.getValue('mouseCursor'),
        toggleable: p.getValue('toggleable'),
        activeColor: p.getValue('activeColor'),
        fillColor: p.getValue('fillColor'),
        focusColor: p.getValue('focusColor'),
        hoverColor: p.getValue('hoverColor'),
        overlayColor: p.getValue('overlayColor'),
        splashRadius: p.getValue('splashRadius'),
        materialTapTargetSize: p.getValue('materialTapTargetSize'),
        visualDensity: p.getValue('visualDensity'),
        focusNode: p.getValue('focusNode'),
        autofocus: p.getValue('autofocus'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'value', init: value);
    mateParams.set(name: 'groupValue', init: groupValue);
    mateParams.set(name: 'onChanged', init: onChanged);
    mateParams.set(name: 'mouseCursor', init: mouseCursor);
    mateParams.set(name: 'toggleable', init: toggleable);
    mateParams.set(name: 'activeColor', init: activeColor);
    mateParams.set(name: 'fillColor', init: fillColor);
    mateParams.set(name: 'focusColor', init: focusColor);
    mateParams.set(name: 'hoverColor', init: hoverColor);
    mateParams.set(name: 'overlayColor', init: overlayColor);
    mateParams.set(name: 'splashRadius', init: splashRadius);
    mateParams.set(name: 'materialTapTargetSize', init: materialTapTargetSize);
    mateParams.set(name: 'visualDensity', init: visualDensity);
    mateParams.set(name: 'focusNode', init: focusNode);
    mateParams.set(name: 'autofocus', init: autofocus);
  }
}
