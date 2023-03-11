// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/material/expand_icon.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'dart:ui';
import 'package:note/mate.dart';

/// class ExpandIcon extends StatefulWidget
class ExpandIcon$Mate extends ExpandIcon with WidgetMate<ExpandIcon$Mate> {
  /// ExpandIcon ExpandIcon({Key? key, bool isExpanded = false, double size = 24.0, required void Function(bool)? onPressed, EdgeInsetsGeometry padding = const EdgeInsets.all(8.0), Color? color, Color? disabledColor, Color? expandedColor})
  ExpandIcon$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {bool isExpanded = false}
    required bool isExpanded,

    /// param: {double size = 24.0}
    required double size,

    /// param: {required void Function(bool)? onPressed}
    required ValueChanged<bool>? onPressed,

    /// param: {EdgeInsetsGeometry padding = const EdgeInsets.all(8.0)}
    required EdgeInsetsGeometry padding,

    /// param: {Color? color}
    Color? color,

    /// param: {Color? disabledColor}
    Color? disabledColor,

    /// param: {Color? expandedColor}
    Color? expandedColor,
  }) : super(
          key: key,
          isExpanded: isExpanded,
          size: size,
          onPressed: onPressed,
          padding: padding,
          color: color,
          disabledColor: disabledColor,
          expandedColor: expandedColor,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ExpandIcon$Mate(
        key: p.getValue('key'),
        isExpanded: p.getValue('isExpanded'),
        size: p.getValue('size'),
        onPressed: p.getValue('onPressed'),
        padding: p.getValue('padding'),
        color: p.getValue('color'),
        disabledColor: p.getValue('disabledColor'),
        expandedColor: p.getValue('expandedColor'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'isExpanded', init: isExpanded);
    mateParams.set(name: 'size', init: size);
    mateParams.set(name: 'onPressed', init: onPressed);
    mateParams.set(name: 'padding', init: padding);
    mateParams.set(name: 'color', init: color);
    mateParams.set(name: 'disabledColor', init: disabledColor);
    mateParams.set(name: 'expandedColor', init: expandedColor);
  }
}
