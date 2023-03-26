// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/radio_list_tile.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/widgets/focus_manager.dart';

/// class RadioListTile<T> extends StatelessWidget
class RadioListTile$Mate<T> extends RadioListTile<T> with Mate {
  /// RadioListTile<T> RadioListTile({Key? key, required T value, required T? groupValue, required void Function(T?)? onChanged, MouseCursor? mouseCursor, bool toggleable = false, Color? activeColor, MaterialStateProperty<Color?>? fillColor, Color? hoverColor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, MaterialTapTargetSize? materialTapTargetSize, Widget? title, Widget? subtitle, bool isThreeLine = false, bool? dense, Widget? secondary, bool selected = false, ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform, bool autofocus = false, EdgeInsetsGeometry? contentPadding, ShapeBorder? shape, Color? tileColor, Color? selectedTileColor, VisualDensity? visualDensity, FocusNode? focusNode, void Function(bool)? onFocusChange, bool? enableFeedback})
  RadioListTile$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required T value} , defaultValue:none
    required T value,

    /// optionalParameters: {required T? groupValue} , defaultValue:none
    required T? groupValue,

    /// optionalParameters: {required void Function(T?)? onChanged} , defaultValue:none
    required ValueChanged<T?>? onChanged,

    /// optionalParameters: {MouseCursor? mouseCursor} , defaultValue:none
    MouseCursor? mouseCursor,

    /// optionalParameters: {bool toggleable = false} , defaultValue:Literal
    bool toggleable = false,

    /// optionalParameters: {Color? activeColor} , defaultValue:none
    Color? activeColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? fillColor} , defaultValue:none
    MaterialStateProperty<Color?>? fillColor,

    /// optionalParameters: {Color? hoverColor} , defaultValue:none
    Color? hoverColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? overlayColor} , defaultValue:none
    MaterialStateProperty<Color?>? overlayColor,

    /// optionalParameters: {double? splashRadius} , defaultValue:none
    double? splashRadius,

    /// optionalParameters: {MaterialTapTargetSize? materialTapTargetSize} , defaultValue:none
    MaterialTapTargetSize? materialTapTargetSize,

    /// optionalParameters: {Widget? title} , defaultValue:none
    Widget? title,

    /// optionalParameters: {Widget? subtitle} , defaultValue:none
    Widget? subtitle,

    /// optionalParameters: {bool isThreeLine = false} , defaultValue:Literal
    bool isThreeLine = false,

    /// optionalParameters: {bool? dense} , defaultValue:none
    bool? dense,

    /// optionalParameters: {Widget? secondary} , defaultValue:none
    Widget? secondary,

    /// optionalParameters: {bool selected = false} , defaultValue:Literal
    bool selected = false,

    /// optionalParameters: {ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform} , defaultValue:unprocessed
    required ListTileControlAffinity controlAffinity,

    /// optionalParameters: {bool autofocus = false} , defaultValue:Literal
    bool autofocus = false,

    /// optionalParameters: {EdgeInsetsGeometry? contentPadding} , defaultValue:none
    EdgeInsetsGeometry? contentPadding,

    /// optionalParameters: {ShapeBorder? shape} , defaultValue:none
    ShapeBorder? shape,

    /// optionalParameters: {Color? tileColor} , defaultValue:none
    Color? tileColor,

    /// optionalParameters: {Color? selectedTileColor} , defaultValue:none
    Color? selectedTileColor,

    /// optionalParameters: {VisualDensity? visualDensity} , defaultValue:none
    VisualDensity? visualDensity,

    /// optionalParameters: {FocusNode? focusNode} , defaultValue:none
    FocusNode? focusNode,

    /// optionalParameters: {void Function(bool)? onFocusChange} , defaultValue:none
    ValueChanged<bool>? onFocusChange,

    /// optionalParameters: {bool? enableFeedback} , defaultValue:none
    bool? enableFeedback,
  }) : super(
          key: key,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          mouseCursor: mouseCursor,
          toggleable: toggleable,
          activeColor: activeColor,
          fillColor: fillColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          materialTapTargetSize: materialTapTargetSize,
          title: title,
          subtitle: subtitle,
          isThreeLine: isThreeLine,
          dense: dense,
          secondary: secondary,
          selected: selected,
          controlAffinity: controlAffinity,
          autofocus: autofocus,
          contentPadding: contentPadding,
          shape: shape,
          tileColor: tileColor,
          selectedTileColor: selectedTileColor,
          visualDensity: visualDensity,
          focusNode: focusNode,
          onFocusChange: onFocusChange,
          enableFeedback: enableFeedback,
        ) {
    mateCreateName = 'RadioListTile';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => RadioListTile$Mate<T>(
          key: p.get('key').build(),
          value: p.get('value').build(),
          groupValue: p.get('groupValue').build(),
          onChanged: p.get('onChanged').build(),
          mouseCursor: p.get('mouseCursor').build(),
          toggleable: p.get('toggleable').build(),
          activeColor: p.get('activeColor').build(),
          fillColor: p.get('fillColor').build(),
          hoverColor: p.get('hoverColor').build(),
          overlayColor: p.get('overlayColor').build(),
          splashRadius: p.get('splashRadius').build(),
          materialTapTargetSize: p.get('materialTapTargetSize').build(),
          title: p.get('title').build(),
          subtitle: p.get('subtitle').build(),
          isThreeLine: p.get('isThreeLine').build(),
          dense: p.get('dense').build(),
          secondary: p.get('secondary').build(),
          selected: p.get('selected').build(),
          controlAffinity: p.get('controlAffinity').build(),
          autofocus: p.get('autofocus').build(),
          contentPadding: p.get('contentPadding').build(),
          shape: p.get('shape').build(),
          tileColor: p.get('tileColor').build(),
          selectedTileColor: p.get('selectedTileColor').build(),
          visualDensity: p.get('visualDensity').build(),
          focusNode: p.get('focusNode').build(),
          onFocusChange: p.get('onFocusChange').build(),
          enableFeedback: p.get('enableFeedback').build(),
        );
    mateUse('key', key);
    mateUse('value', value);
    mateUse('groupValue', groupValue);
    mateUse('onChanged', onChanged);
    mateUse('mouseCursor', mouseCursor);
    mateUse('toggleable', toggleable);
    mateUse('activeColor', activeColor);
    mateUse('fillColor', fillColor);
    mateUse('hoverColor', hoverColor);
    mateUse('overlayColor', overlayColor);
    mateUse('splashRadius', splashRadius);
    mateUse('materialTapTargetSize', materialTapTargetSize);
    mateUse('title', title);
    mateUse('subtitle', subtitle);
    mateUse('isThreeLine', isThreeLine);
    mateUse('dense', dense);
    mateUse('secondary', secondary);
    mateUse('selected', selected);
    mateUse('controlAffinity', controlAffinity);
    mateUse('autofocus', autofocus);
    mateUse('contentPadding', contentPadding);
    mateUse('shape', shape);
    mateUse('tileColor', tileColor);
    mateUse('selectedTileColor', selectedTileColor);
    mateUse('visualDensity', visualDensity);
    mateUse('focusNode', focusNode);
    mateUse('onFocusChange', onFocusChange);
    mateUse('enableFeedback', enableFeedback);
  }
}
