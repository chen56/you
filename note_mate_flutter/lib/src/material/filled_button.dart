// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/filled_button.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'package:flutter/src/foundation/basic_types.dart';
import 'dart:core';
import 'package:flutter/src/material/button_style.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class FilledButton extends ButtonStyleButton
class FilledButton$Mate extends FilledButton with WidgetMate<FilledButton$Mate> {
  /// FilledButton FilledButton({Key? key, required void Function()? onPressed, void Function()? onLongPress, void Function(bool)? onHover, void Function(bool)? onFocusChange, ButtonStyle? style, FocusNode? focusNode, bool autofocus = false, Clip clipBehavior = Clip.none, MaterialStatesController? statesController, required Widget? child})
  FilledButton$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required void Function()? onPressed} , hasDefaultValue:false, defaultValueCode:null
    required VoidCallback? onPressed,

    /// optionalParameters: {void Function()? onLongPress} , hasDefaultValue:false, defaultValueCode:null
    VoidCallback? onLongPress,

    /// optionalParameters: {void Function(bool)? onHover} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<bool>? onHover,

    /// optionalParameters: {void Function(bool)? onFocusChange} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<bool>? onFocusChange,

    /// optionalParameters: {ButtonStyle? style} , hasDefaultValue:false, defaultValueCode:null
    ButtonStyle? style,

    /// optionalParameters: {FocusNode? focusNode} , hasDefaultValue:false, defaultValueCode:null
    FocusNode? focusNode,

    /// optionalParameters: {bool autofocus = false} , hasDefaultValue:true, defaultValueCode:false
    required bool autofocus,

    /// optionalParameters: {Clip clipBehavior = Clip.none} , hasDefaultValue:true, defaultValueCode:Clip.none
    required Clip clipBehavior,

    /// optionalParameters: {MaterialStatesController? statesController} , hasDefaultValue:false, defaultValueCode:null
    MaterialStatesController? statesController,

    /// optionalParameters: {required Widget? child} , hasDefaultValue:false, defaultValueCode:null
    required Widget? child,
  }) : super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          statesController: statesController,
          child: child,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => FilledButton$Mate(
        key: p.get('key').value,
        onPressed: p.get('onPressed').value,
        onLongPress: p.get('onLongPress').value,
        onHover: p.get('onHover').value,
        onFocusChange: p.get('onFocusChange').value,
        style: p.get('style').value,
        focusNode: p.get('focusNode').value,
        autofocus: p.get('autofocus').value,
        clipBehavior: p.get('clipBehavior').value,
        statesController: p.get('statesController').value,
        child: p.get('child').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('onPressed', onPressed);
    mateParams.put('onLongPress', onLongPress);
    mateParams.put('onHover', onHover);
    mateParams.put('onFocusChange', onFocusChange);
    mateParams.put('style', style);
    mateParams.put('focusNode', focusNode);
    mateParams.put('autofocus', autofocus);
    mateParams.put('clipBehavior', clipBehavior);
    mateParams.put('statesController', statesController);
    mateParams.put('child', child);
  }

  /// FilledButton FilledButton.tonal({Key? key, required void Function()? onPressed, void Function()? onLongPress, void Function(bool)? onHover, void Function(bool)? onFocusChange, ButtonStyle? style, FocusNode? focusNode, bool autofocus = false, Clip clipBehavior = Clip.none, MaterialStatesController? statesController, required Widget? child})
  FilledButton$Mate.tonal({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required void Function()? onPressed} , hasDefaultValue:false, defaultValueCode:null
    required VoidCallback? onPressed,

    /// optionalParameters: {void Function()? onLongPress} , hasDefaultValue:false, defaultValueCode:null
    VoidCallback? onLongPress,

    /// optionalParameters: {void Function(bool)? onHover} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<bool>? onHover,

    /// optionalParameters: {void Function(bool)? onFocusChange} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<bool>? onFocusChange,

    /// optionalParameters: {ButtonStyle? style} , hasDefaultValue:false, defaultValueCode:null
    ButtonStyle? style,

    /// optionalParameters: {FocusNode? focusNode} , hasDefaultValue:false, defaultValueCode:null
    FocusNode? focusNode,

    /// optionalParameters: {bool autofocus = false} , hasDefaultValue:true, defaultValueCode:false
    required bool autofocus,

    /// optionalParameters: {Clip clipBehavior = Clip.none} , hasDefaultValue:true, defaultValueCode:Clip.none
    required Clip clipBehavior,

    /// optionalParameters: {MaterialStatesController? statesController} , hasDefaultValue:false, defaultValueCode:null
    MaterialStatesController? statesController,

    /// optionalParameters: {required Widget? child} , hasDefaultValue:false, defaultValueCode:null
    required Widget? child,
  }) : super.tonal(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          statesController: statesController,
          child: child,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => FilledButton$Mate.tonal(
        key: p.get('key').value,
        onPressed: p.get('onPressed').value,
        onLongPress: p.get('onLongPress').value,
        onHover: p.get('onHover').value,
        onFocusChange: p.get('onFocusChange').value,
        style: p.get('style').value,
        focusNode: p.get('focusNode').value,
        autofocus: p.get('autofocus').value,
        clipBehavior: p.get('clipBehavior').value,
        statesController: p.get('statesController').value,
        child: p.get('child').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('onPressed', onPressed);
    mateParams.put('onLongPress', onLongPress);
    mateParams.put('onHover', onHover);
    mateParams.put('onFocusChange', onFocusChange);
    mateParams.put('style', style);
    mateParams.put('focusNode', focusNode);
    mateParams.put('autofocus', autofocus);
    mateParams.put('clipBehavior', clipBehavior);
    mateParams.put('statesController', statesController);
    mateParams.put('child', child);
  }
}
