// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/switch_list_tile.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/foundation/basic_types.dart';
import 'dart:ui';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:flutter/src/painting/image_stream.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/gestures/recognizer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/borders.dart';

/// class SwitchListTile extends StatelessWidget
class SwitchListTile$Mate extends SwitchListTile with Mate {
  /// SwitchListTile SwitchListTile({Key? key, required bool value, required void Function(bool)? onChanged, Color? activeColor, Color? activeTrackColor, Color? inactiveThumbColor, Color? inactiveTrackColor, ImageProvider<Object>? activeThumbImage, void Function(Object, StackTrace?)? onActiveThumbImageError, ImageProvider<Object>? inactiveThumbImage, void Function(Object, StackTrace?)? onInactiveThumbImageError, MaterialStateProperty<Color?>? thumbColor, MaterialStateProperty<Color?>? trackColor, MaterialStateProperty<Color?>? trackOutlineColor, MaterialStateProperty<Icon?>? thumbIcon, MaterialTapTargetSize? materialTapTargetSize, DragStartBehavior dragStartBehavior = DragStartBehavior.start, MouseCursor? mouseCursor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, FocusNode? focusNode, void Function(bool)? onFocusChange, bool autofocus = false, Color? tileColor, Widget? title, Widget? subtitle, bool isThreeLine = false, bool? dense, EdgeInsetsGeometry? contentPadding, Widget? secondary, bool selected = false, ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform, ShapeBorder? shape, Color? selectedTileColor, VisualDensity? visualDensity, bool? enableFeedback, Color? hoverColor})
  SwitchListTile$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required bool value} , defaultValue:none
    required bool value,

    /// optionalParameters: {required void Function(bool)? onChanged} , defaultValue:none
    required ValueChanged<bool>? onChanged,

    /// optionalParameters: {Color? activeColor} , defaultValue:none
    Color? activeColor,

    /// optionalParameters: {Color? activeTrackColor} , defaultValue:none
    Color? activeTrackColor,

    /// optionalParameters: {Color? inactiveThumbColor} , defaultValue:none
    Color? inactiveThumbColor,

    /// optionalParameters: {Color? inactiveTrackColor} , defaultValue:none
    Color? inactiveTrackColor,

    /// optionalParameters: {ImageProvider<Object>? activeThumbImage} , defaultValue:none
    ImageProvider<Object>? activeThumbImage,

    /// optionalParameters: {void Function(Object, StackTrace?)? onActiveThumbImageError} , defaultValue:none
    ImageErrorListener? onActiveThumbImageError,

    /// optionalParameters: {ImageProvider<Object>? inactiveThumbImage} , defaultValue:none
    ImageProvider<Object>? inactiveThumbImage,

    /// optionalParameters: {void Function(Object, StackTrace?)? onInactiveThumbImageError} , defaultValue:none
    ImageErrorListener? onInactiveThumbImageError,

    /// optionalParameters: {MaterialStateProperty<Color?>? thumbColor} , defaultValue:none
    MaterialStateProperty<Color?>? thumbColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? trackColor} , defaultValue:none
    MaterialStateProperty<Color?>? trackColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? trackOutlineColor} , defaultValue:none
    MaterialStateProperty<Color?>? trackOutlineColor,

    /// optionalParameters: {MaterialStateProperty<Icon?>? thumbIcon} , defaultValue:none
    MaterialStateProperty<Icon?>? thumbIcon,

    /// optionalParameters: {MaterialTapTargetSize? materialTapTargetSize} , defaultValue:none
    MaterialTapTargetSize? materialTapTargetSize,

    /// optionalParameters: {DragStartBehavior dragStartBehavior = DragStartBehavior.start} , defaultValue:PrefixedIdentifier
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,

    /// optionalParameters: {MouseCursor? mouseCursor} , defaultValue:none
    MouseCursor? mouseCursor,

    /// optionalParameters: {MaterialStateProperty<Color?>? overlayColor} , defaultValue:none
    MaterialStateProperty<Color?>? overlayColor,

    /// optionalParameters: {double? splashRadius} , defaultValue:none
    double? splashRadius,

    /// optionalParameters: {FocusNode? focusNode} , defaultValue:none
    FocusNode? focusNode,

    /// optionalParameters: {void Function(bool)? onFocusChange} , defaultValue:none
    ValueChanged<bool>? onFocusChange,

    /// optionalParameters: {bool autofocus = false} , defaultValue:Literal
    bool autofocus = false,

    /// optionalParameters: {Color? tileColor} , defaultValue:none
    Color? tileColor,

    /// optionalParameters: {Widget? title} , defaultValue:none
    Widget? title,

    /// optionalParameters: {Widget? subtitle} , defaultValue:none
    Widget? subtitle,

    /// optionalParameters: {bool isThreeLine = false} , defaultValue:Literal
    bool isThreeLine = false,

    /// optionalParameters: {bool? dense} , defaultValue:none
    bool? dense,

    /// optionalParameters: {EdgeInsetsGeometry? contentPadding} , defaultValue:none
    EdgeInsetsGeometry? contentPadding,

    /// optionalParameters: {Widget? secondary} , defaultValue:none
    Widget? secondary,

    /// optionalParameters: {bool selected = false} , defaultValue:Literal
    bool selected = false,

    /// optionalParameters: {ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform} , defaultValue:PrefixedIdentifier
    ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform,

    /// optionalParameters: {ShapeBorder? shape} , defaultValue:none
    ShapeBorder? shape,

    /// optionalParameters: {Color? selectedTileColor} , defaultValue:none
    Color? selectedTileColor,

    /// optionalParameters: {VisualDensity? visualDensity} , defaultValue:none
    VisualDensity? visualDensity,

    /// optionalParameters: {bool? enableFeedback} , defaultValue:none
    bool? enableFeedback,

    /// optionalParameters: {Color? hoverColor} , defaultValue:none
    Color? hoverColor,
  }) : super(
          key: key,
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          activeTrackColor: activeTrackColor,
          inactiveThumbColor: inactiveThumbColor,
          inactiveTrackColor: inactiveTrackColor,
          activeThumbImage: activeThumbImage,
          onActiveThumbImageError: onActiveThumbImageError,
          inactiveThumbImage: inactiveThumbImage,
          onInactiveThumbImageError: onInactiveThumbImageError,
          thumbColor: thumbColor,
          trackColor: trackColor,
          trackOutlineColor: trackOutlineColor,
          thumbIcon: thumbIcon,
          materialTapTargetSize: materialTapTargetSize,
          dragStartBehavior: dragStartBehavior,
          mouseCursor: mouseCursor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          focusNode: focusNode,
          onFocusChange: onFocusChange,
          autofocus: autofocus,
          tileColor: tileColor,
          title: title,
          subtitle: subtitle,
          isThreeLine: isThreeLine,
          dense: dense,
          contentPadding: contentPadding,
          secondary: secondary,
          selected: selected,
          controlAffinity: controlAffinity,
          shape: shape,
          selectedTileColor: selectedTileColor,
          visualDensity: visualDensity,
          enableFeedback: enableFeedback,
          hoverColor: hoverColor,
        ) {
    mateCreateName = 'SwitchListTile';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => SwitchListTile$Mate(
          key: p.get('key').build(),
          value: p.get('value').build(),
          onChanged: p.get('onChanged').build(),
          activeColor: p.get('activeColor').build(),
          activeTrackColor: p.get('activeTrackColor').build(),
          inactiveThumbColor: p.get('inactiveThumbColor').build(),
          inactiveTrackColor: p.get('inactiveTrackColor').build(),
          activeThumbImage: p.get('activeThumbImage').build(),
          onActiveThumbImageError: p.get('onActiveThumbImageError').build(),
          inactiveThumbImage: p.get('inactiveThumbImage').build(),
          onInactiveThumbImageError: p.get('onInactiveThumbImageError').build(),
          thumbColor: p.get('thumbColor').build(),
          trackColor: p.get('trackColor').build(),
          trackOutlineColor: p.get('trackOutlineColor').build(),
          thumbIcon: p.get('thumbIcon').build(),
          materialTapTargetSize: p.get('materialTapTargetSize').build(),
          dragStartBehavior: p.get('dragStartBehavior').build(),
          mouseCursor: p.get('mouseCursor').build(),
          overlayColor: p.get('overlayColor').build(),
          splashRadius: p.get('splashRadius').build(),
          focusNode: p.get('focusNode').build(),
          onFocusChange: p.get('onFocusChange').build(),
          autofocus: p.get('autofocus').build(),
          tileColor: p.get('tileColor').build(),
          title: p.get('title').build(),
          subtitle: p.get('subtitle').build(),
          isThreeLine: p.get('isThreeLine').build(),
          dense: p.get('dense').build(),
          contentPadding: p.get('contentPadding').build(),
          secondary: p.get('secondary').build(),
          selected: p.get('selected').build(),
          controlAffinity: p.get('controlAffinity').build(),
          shape: p.get('shape').build(),
          selectedTileColor: p.get('selectedTileColor').build(),
          visualDensity: p.get('visualDensity').build(),
          enableFeedback: p.get('enableFeedback').build(),
          hoverColor: p.get('hoverColor').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('value', value, isNamed: true);
    mateUse('onChanged', onChanged, isNamed: true);
    mateUse('activeColor', activeColor, isNamed: true);
    mateUse('activeTrackColor', activeTrackColor, isNamed: true);
    mateUse('inactiveThumbColor', inactiveThumbColor, isNamed: true);
    mateUse('inactiveTrackColor', inactiveTrackColor, isNamed: true);
    mateUse('activeThumbImage', activeThumbImage, isNamed: true);
    mateUse('onActiveThumbImageError', onActiveThumbImageError, isNamed: true);
    mateUse('inactiveThumbImage', inactiveThumbImage, isNamed: true);
    mateUse('onInactiveThumbImageError', onInactiveThumbImageError, isNamed: true);
    mateUse('thumbColor', thumbColor, isNamed: true);
    mateUse('trackColor', trackColor, isNamed: true);
    mateUse('trackOutlineColor', trackOutlineColor, isNamed: true);
    mateUse('thumbIcon', thumbIcon, isNamed: true);
    mateUse('materialTapTargetSize', materialTapTargetSize, isNamed: true);
    mateUse('dragStartBehavior', dragStartBehavior, isNamed: true);
    mateUse('mouseCursor', mouseCursor, isNamed: true);
    mateUse('overlayColor', overlayColor, isNamed: true);
    mateUse('splashRadius', splashRadius, isNamed: true);
    mateUse('focusNode', focusNode, isNamed: true);
    mateUse('onFocusChange', onFocusChange, isNamed: true);
    mateUse('autofocus', autofocus, isNamed: true);
    mateUse('tileColor', tileColor, isNamed: true);
    mateUse('title', title, isNamed: true);
    mateUse('subtitle', subtitle, isNamed: true);
    mateUse('isThreeLine', isThreeLine, isNamed: true);
    mateUse('dense', dense, isNamed: true);
    mateUse('contentPadding', contentPadding, isNamed: true);
    mateUse('secondary', secondary, isNamed: true);
    mateUse('selected', selected, isNamed: true);
    mateUse('controlAffinity', controlAffinity, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('selectedTileColor', selectedTileColor, isNamed: true);
    mateUse('visualDensity', visualDensity, isNamed: true);
    mateUse('enableFeedback', enableFeedback, isNamed: true);
    mateUse('hoverColor', hoverColor, isNamed: true);
  }

  /// SwitchListTile SwitchListTile.adaptive({Key? key, required bool value, required void Function(bool)? onChanged, Color? activeColor, Color? activeTrackColor, Color? inactiveThumbColor, Color? inactiveTrackColor, ImageProvider<Object>? activeThumbImage, void Function(Object, StackTrace?)? onActiveThumbImageError, ImageProvider<Object>? inactiveThumbImage, void Function(Object, StackTrace?)? onInactiveThumbImageError, MaterialStateProperty<Color?>? thumbColor, MaterialStateProperty<Color?>? trackColor, MaterialStateProperty<Color?>? trackOutlineColor, MaterialStateProperty<Icon?>? thumbIcon, MaterialTapTargetSize? materialTapTargetSize, DragStartBehavior dragStartBehavior = DragStartBehavior.start, MouseCursor? mouseCursor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, FocusNode? focusNode, void Function(bool)? onFocusChange, bool autofocus = false, bool? applyCupertinoTheme, Color? tileColor, Widget? title, Widget? subtitle, bool isThreeLine = false, bool? dense, EdgeInsetsGeometry? contentPadding, Widget? secondary, bool selected = false, ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform, ShapeBorder? shape, Color? selectedTileColor, VisualDensity? visualDensity, bool? enableFeedback, Color? hoverColor})
  SwitchListTile$Mate.adaptive({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required bool value} , defaultValue:none
    required bool value,

    /// optionalParameters: {required void Function(bool)? onChanged} , defaultValue:none
    required ValueChanged<bool>? onChanged,

    /// optionalParameters: {Color? activeColor} , defaultValue:none
    Color? activeColor,

    /// optionalParameters: {Color? activeTrackColor} , defaultValue:none
    Color? activeTrackColor,

    /// optionalParameters: {Color? inactiveThumbColor} , defaultValue:none
    Color? inactiveThumbColor,

    /// optionalParameters: {Color? inactiveTrackColor} , defaultValue:none
    Color? inactiveTrackColor,

    /// optionalParameters: {ImageProvider<Object>? activeThumbImage} , defaultValue:none
    ImageProvider<Object>? activeThumbImage,

    /// optionalParameters: {void Function(Object, StackTrace?)? onActiveThumbImageError} , defaultValue:none
    ImageErrorListener? onActiveThumbImageError,

    /// optionalParameters: {ImageProvider<Object>? inactiveThumbImage} , defaultValue:none
    ImageProvider<Object>? inactiveThumbImage,

    /// optionalParameters: {void Function(Object, StackTrace?)? onInactiveThumbImageError} , defaultValue:none
    ImageErrorListener? onInactiveThumbImageError,

    /// optionalParameters: {MaterialStateProperty<Color?>? thumbColor} , defaultValue:none
    MaterialStateProperty<Color?>? thumbColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? trackColor} , defaultValue:none
    MaterialStateProperty<Color?>? trackColor,

    /// optionalParameters: {MaterialStateProperty<Color?>? trackOutlineColor} , defaultValue:none
    MaterialStateProperty<Color?>? trackOutlineColor,

    /// optionalParameters: {MaterialStateProperty<Icon?>? thumbIcon} , defaultValue:none
    MaterialStateProperty<Icon?>? thumbIcon,

    /// optionalParameters: {MaterialTapTargetSize? materialTapTargetSize} , defaultValue:none
    MaterialTapTargetSize? materialTapTargetSize,

    /// optionalParameters: {DragStartBehavior dragStartBehavior = DragStartBehavior.start} , defaultValue:PrefixedIdentifier
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,

    /// optionalParameters: {MouseCursor? mouseCursor} , defaultValue:none
    MouseCursor? mouseCursor,

    /// optionalParameters: {MaterialStateProperty<Color?>? overlayColor} , defaultValue:none
    MaterialStateProperty<Color?>? overlayColor,

    /// optionalParameters: {double? splashRadius} , defaultValue:none
    double? splashRadius,

    /// optionalParameters: {FocusNode? focusNode} , defaultValue:none
    FocusNode? focusNode,

    /// optionalParameters: {void Function(bool)? onFocusChange} , defaultValue:none
    ValueChanged<bool>? onFocusChange,

    /// optionalParameters: {bool autofocus = false} , defaultValue:Literal
    bool autofocus = false,

    /// optionalParameters: {bool? applyCupertinoTheme} , defaultValue:none
    bool? applyCupertinoTheme,

    /// optionalParameters: {Color? tileColor} , defaultValue:none
    Color? tileColor,

    /// optionalParameters: {Widget? title} , defaultValue:none
    Widget? title,

    /// optionalParameters: {Widget? subtitle} , defaultValue:none
    Widget? subtitle,

    /// optionalParameters: {bool isThreeLine = false} , defaultValue:Literal
    bool isThreeLine = false,

    /// optionalParameters: {bool? dense} , defaultValue:none
    bool? dense,

    /// optionalParameters: {EdgeInsetsGeometry? contentPadding} , defaultValue:none
    EdgeInsetsGeometry? contentPadding,

    /// optionalParameters: {Widget? secondary} , defaultValue:none
    Widget? secondary,

    /// optionalParameters: {bool selected = false} , defaultValue:Literal
    bool selected = false,

    /// optionalParameters: {ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform} , defaultValue:PrefixedIdentifier
    ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform,

    /// optionalParameters: {ShapeBorder? shape} , defaultValue:none
    ShapeBorder? shape,

    /// optionalParameters: {Color? selectedTileColor} , defaultValue:none
    Color? selectedTileColor,

    /// optionalParameters: {VisualDensity? visualDensity} , defaultValue:none
    VisualDensity? visualDensity,

    /// optionalParameters: {bool? enableFeedback} , defaultValue:none
    bool? enableFeedback,

    /// optionalParameters: {Color? hoverColor} , defaultValue:none
    Color? hoverColor,
  }) : super.adaptive(
          key: key,
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          activeTrackColor: activeTrackColor,
          inactiveThumbColor: inactiveThumbColor,
          inactiveTrackColor: inactiveTrackColor,
          activeThumbImage: activeThumbImage,
          onActiveThumbImageError: onActiveThumbImageError,
          inactiveThumbImage: inactiveThumbImage,
          onInactiveThumbImageError: onInactiveThumbImageError,
          thumbColor: thumbColor,
          trackColor: trackColor,
          trackOutlineColor: trackOutlineColor,
          thumbIcon: thumbIcon,
          materialTapTargetSize: materialTapTargetSize,
          dragStartBehavior: dragStartBehavior,
          mouseCursor: mouseCursor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          focusNode: focusNode,
          onFocusChange: onFocusChange,
          autofocus: autofocus,
          applyCupertinoTheme: applyCupertinoTheme,
          tileColor: tileColor,
          title: title,
          subtitle: subtitle,
          isThreeLine: isThreeLine,
          dense: dense,
          contentPadding: contentPadding,
          secondary: secondary,
          selected: selected,
          controlAffinity: controlAffinity,
          shape: shape,
          selectedTileColor: selectedTileColor,
          visualDensity: visualDensity,
          enableFeedback: enableFeedback,
          hoverColor: hoverColor,
        ) {
    mateCreateName = 'SwitchListTile.adaptive';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => SwitchListTile$Mate.adaptive(
          key: p.get('key').build(),
          value: p.get('value').build(),
          onChanged: p.get('onChanged').build(),
          activeColor: p.get('activeColor').build(),
          activeTrackColor: p.get('activeTrackColor').build(),
          inactiveThumbColor: p.get('inactiveThumbColor').build(),
          inactiveTrackColor: p.get('inactiveTrackColor').build(),
          activeThumbImage: p.get('activeThumbImage').build(),
          onActiveThumbImageError: p.get('onActiveThumbImageError').build(),
          inactiveThumbImage: p.get('inactiveThumbImage').build(),
          onInactiveThumbImageError: p.get('onInactiveThumbImageError').build(),
          thumbColor: p.get('thumbColor').build(),
          trackColor: p.get('trackColor').build(),
          trackOutlineColor: p.get('trackOutlineColor').build(),
          thumbIcon: p.get('thumbIcon').build(),
          materialTapTargetSize: p.get('materialTapTargetSize').build(),
          dragStartBehavior: p.get('dragStartBehavior').build(),
          mouseCursor: p.get('mouseCursor').build(),
          overlayColor: p.get('overlayColor').build(),
          splashRadius: p.get('splashRadius').build(),
          focusNode: p.get('focusNode').build(),
          onFocusChange: p.get('onFocusChange').build(),
          autofocus: p.get('autofocus').build(),
          applyCupertinoTheme: p.get('applyCupertinoTheme').build(),
          tileColor: p.get('tileColor').build(),
          title: p.get('title').build(),
          subtitle: p.get('subtitle').build(),
          isThreeLine: p.get('isThreeLine').build(),
          dense: p.get('dense').build(),
          contentPadding: p.get('contentPadding').build(),
          secondary: p.get('secondary').build(),
          selected: p.get('selected').build(),
          controlAffinity: p.get('controlAffinity').build(),
          shape: p.get('shape').build(),
          selectedTileColor: p.get('selectedTileColor').build(),
          visualDensity: p.get('visualDensity').build(),
          enableFeedback: p.get('enableFeedback').build(),
          hoverColor: p.get('hoverColor').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('value', value, isNamed: true);
    mateUse('onChanged', onChanged, isNamed: true);
    mateUse('activeColor', activeColor, isNamed: true);
    mateUse('activeTrackColor', activeTrackColor, isNamed: true);
    mateUse('inactiveThumbColor', inactiveThumbColor, isNamed: true);
    mateUse('inactiveTrackColor', inactiveTrackColor, isNamed: true);
    mateUse('activeThumbImage', activeThumbImage, isNamed: true);
    mateUse('onActiveThumbImageError', onActiveThumbImageError, isNamed: true);
    mateUse('inactiveThumbImage', inactiveThumbImage, isNamed: true);
    mateUse('onInactiveThumbImageError', onInactiveThumbImageError, isNamed: true);
    mateUse('thumbColor', thumbColor, isNamed: true);
    mateUse('trackColor', trackColor, isNamed: true);
    mateUse('trackOutlineColor', trackOutlineColor, isNamed: true);
    mateUse('thumbIcon', thumbIcon, isNamed: true);
    mateUse('materialTapTargetSize', materialTapTargetSize, isNamed: true);
    mateUse('dragStartBehavior', dragStartBehavior, isNamed: true);
    mateUse('mouseCursor', mouseCursor, isNamed: true);
    mateUse('overlayColor', overlayColor, isNamed: true);
    mateUse('splashRadius', splashRadius, isNamed: true);
    mateUse('focusNode', focusNode, isNamed: true);
    mateUse('onFocusChange', onFocusChange, isNamed: true);
    mateUse('autofocus', autofocus, isNamed: true);
    mateUse('applyCupertinoTheme', applyCupertinoTheme, isNamed: true);
    mateUse('tileColor', tileColor, isNamed: true);
    mateUse('title', title, isNamed: true);
    mateUse('subtitle', subtitle, isNamed: true);
    mateUse('isThreeLine', isThreeLine, isNamed: true);
    mateUse('dense', dense, isNamed: true);
    mateUse('contentPadding', contentPadding, isNamed: true);
    mateUse('secondary', secondary, isNamed: true);
    mateUse('selected', selected, isNamed: true);
    mateUse('controlAffinity', controlAffinity, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('selectedTileColor', selectedTileColor, isNamed: true);
    mateUse('visualDensity', visualDensity, isNamed: true);
    mateUse('enableFeedback', enableFeedback, isNamed: true);
    mateUse('hoverColor', hoverColor, isNamed: true);
  }
}
