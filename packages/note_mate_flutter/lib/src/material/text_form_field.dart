// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/text_form_field.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'dart:core';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/painting/strut_style.dart';
import 'dart:ui';
import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:flutter/src/widgets/tap_region.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/widgets/text_selection.dart';
import 'package:flutter/src/material/text_field.dart';
import 'package:flutter/src/widgets/scroll_physics.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'package:flutter/src/widgets/magnifier.dart';

/// class TextFormField extends FormField<String>
class TextFormField$Mate extends TextFormField with Mate {
  /// TextFormField TextFormField({Key? key, TextEditingController? controller, String? initialValue, FocusNode? focusNode, InputDecoration? decoration = const InputDecoration(), TextInputType? keyboardType, TextCapitalization textCapitalization = TextCapitalization.none, TextInputAction? textInputAction, TextStyle? style, StrutStyle? strutStyle, TextDirection? textDirection, TextAlign textAlign = TextAlign.start, TextAlignVertical? textAlignVertical, bool autofocus = false, bool readOnly = false, ToolbarOptions? toolbarOptions, bool? showCursor, String obscuringCharacter = '•', bool obscureText = false, bool autocorrect = true, SmartDashesType? smartDashesType, SmartQuotesType? smartQuotesType, bool enableSuggestions = true, MaxLengthEnforcement? maxLengthEnforcement, int? maxLines = 1, int? minLines, bool expands = false, int? maxLength, void Function(String)? onChanged, void Function()? onTap, void Function(PointerDownEvent)? onTapOutside, void Function()? onEditingComplete, void Function(String)? onFieldSubmitted, void Function(String?)? onSaved, String? Function(String?)? validator, List<TextInputFormatter>? inputFormatters, bool? enabled, double cursorWidth = 2.0, double? cursorHeight, Radius? cursorRadius, Color? cursorColor, Brightness? keyboardAppearance, EdgeInsets scrollPadding = const EdgeInsets.all(20.0), bool? enableInteractiveSelection, TextSelectionControls? selectionControls, Widget? Function(BuildContext, {required int currentLength, required bool isFocused, required int? maxLength})? buildCounter, ScrollPhysics? scrollPhysics, Iterable<String>? autofillHints, AutovalidateMode? autovalidateMode, ScrollController? scrollController, String? restorationId, bool enableIMEPersonalizedLearning = true, MouseCursor? mouseCursor, Widget Function(BuildContext, EditableTextState)? contextMenuBuilder = _defaultContextMenuBuilder, TextMagnifierConfiguration? magnifierConfiguration})
  TextFormField$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {TextEditingController? controller} , hasDefaultValue:false, defaultValueCode:null
    TextEditingController? controller,

    /// optionalParameters: {String? initialValue} , hasDefaultValue:false, defaultValueCode:null
    String? initialValue,

    /// optionalParameters: {FocusNode? focusNode} , hasDefaultValue:false, defaultValueCode:null
    FocusNode? focusNode,

    /// optionalParameters: {InputDecoration? decoration = const InputDecoration()} , hasDefaultValue:true, defaultValueCode:const InputDecoration()
    InputDecoration? decoration,

    /// optionalParameters: {TextInputType? keyboardType} , hasDefaultValue:false, defaultValueCode:null
    TextInputType? keyboardType,

    /// optionalParameters: {TextCapitalization textCapitalization = TextCapitalization.none} , hasDefaultValue:true, defaultValueCode:TextCapitalization.none
    required TextCapitalization textCapitalization,

    /// optionalParameters: {TextInputAction? textInputAction} , hasDefaultValue:false, defaultValueCode:null
    TextInputAction? textInputAction,

    /// optionalParameters: {TextStyle? style} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? style,

    /// optionalParameters: {StrutStyle? strutStyle} , hasDefaultValue:false, defaultValueCode:null
    StrutStyle? strutStyle,

    /// optionalParameters: {TextDirection? textDirection} , hasDefaultValue:false, defaultValueCode:null
    TextDirection? textDirection,

    /// optionalParameters: {TextAlign textAlign = TextAlign.start} , hasDefaultValue:true, defaultValueCode:TextAlign.start
    required TextAlign textAlign,

    /// optionalParameters: {TextAlignVertical? textAlignVertical} , hasDefaultValue:false, defaultValueCode:null
    TextAlignVertical? textAlignVertical,

    /// optionalParameters: {bool autofocus = false} , hasDefaultValue:true, defaultValueCode:false
    required bool autofocus,

    /// optionalParameters: {bool readOnly = false} , hasDefaultValue:true, defaultValueCode:false
    required bool readOnly,

    /// optionalParameters: {bool? showCursor} , hasDefaultValue:false, defaultValueCode:null
    bool? showCursor,

    /// optionalParameters: {String obscuringCharacter = '•'} , hasDefaultValue:true, defaultValueCode:'•'
    required String obscuringCharacter,

    /// optionalParameters: {bool obscureText = false} , hasDefaultValue:true, defaultValueCode:false
    required bool obscureText,

    /// optionalParameters: {bool autocorrect = true} , hasDefaultValue:true, defaultValueCode:true
    required bool autocorrect,

    /// optionalParameters: {SmartDashesType? smartDashesType} , hasDefaultValue:false, defaultValueCode:null
    SmartDashesType? smartDashesType,

    /// optionalParameters: {SmartQuotesType? smartQuotesType} , hasDefaultValue:false, defaultValueCode:null
    SmartQuotesType? smartQuotesType,

    /// optionalParameters: {bool enableSuggestions = true} , hasDefaultValue:true, defaultValueCode:true
    required bool enableSuggestions,

    /// optionalParameters: {MaxLengthEnforcement? maxLengthEnforcement} , hasDefaultValue:false, defaultValueCode:null
    MaxLengthEnforcement? maxLengthEnforcement,

    /// optionalParameters: {int? maxLines = 1} , hasDefaultValue:true, defaultValueCode:1
    int? maxLines,

    /// optionalParameters: {int? minLines} , hasDefaultValue:false, defaultValueCode:null
    int? minLines,

    /// optionalParameters: {bool expands = false} , hasDefaultValue:true, defaultValueCode:false
    required bool expands,

    /// optionalParameters: {int? maxLength} , hasDefaultValue:false, defaultValueCode:null
    int? maxLength,

    /// optionalParameters: {void Function(String)? onChanged} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<String>? onChanged,

    /// optionalParameters: {void Function()? onTap} , hasDefaultValue:false, defaultValueCode:null
    GestureTapCallback? onTap,

    /// optionalParameters: {void Function(PointerDownEvent)? onTapOutside} , hasDefaultValue:false, defaultValueCode:null
    TapRegionCallback? onTapOutside,

    /// optionalParameters: {void Function()? onEditingComplete} , hasDefaultValue:false, defaultValueCode:null
    VoidCallback? onEditingComplete,

    /// optionalParameters: {void Function(String)? onFieldSubmitted} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<String>? onFieldSubmitted,

    /// optionalParameters: {void Function(String?)? onSaved} , hasDefaultValue:false, defaultValueCode:null
    FormFieldSetter<String>? onSaved,

    /// optionalParameters: {String? Function(String?)? validator} , hasDefaultValue:false, defaultValueCode:null
    FormFieldValidator<String>? validator,

    /// optionalParameters: {List<TextInputFormatter>? inputFormatters} , hasDefaultValue:false, defaultValueCode:null
    List<TextInputFormatter>? inputFormatters,

    /// optionalParameters: {bool? enabled} , hasDefaultValue:false, defaultValueCode:null
    bool? enabled,

    /// optionalParameters: {double cursorWidth = 2.0} , hasDefaultValue:true, defaultValueCode:2.0
    required double cursorWidth,

    /// optionalParameters: {double? cursorHeight} , hasDefaultValue:false, defaultValueCode:null
    double? cursorHeight,

    /// optionalParameters: {Radius? cursorRadius} , hasDefaultValue:false, defaultValueCode:null
    Radius? cursorRadius,

    /// optionalParameters: {Color? cursorColor} , hasDefaultValue:false, defaultValueCode:null
    Color? cursorColor,

    /// optionalParameters: {Brightness? keyboardAppearance} , hasDefaultValue:false, defaultValueCode:null
    Brightness? keyboardAppearance,

    /// optionalParameters: {EdgeInsets scrollPadding = const EdgeInsets.all(20.0)} , hasDefaultValue:true, defaultValueCode:const EdgeInsets.all(20.0)
    required EdgeInsets scrollPadding,

    /// optionalParameters: {bool? enableInteractiveSelection} , hasDefaultValue:false, defaultValueCode:null
    bool? enableInteractiveSelection,

    /// optionalParameters: {TextSelectionControls? selectionControls} , hasDefaultValue:false, defaultValueCode:null
    TextSelectionControls? selectionControls,

    /// optionalParameters: {Widget? Function(BuildContext, {required int currentLength, required bool isFocused, required int? maxLength})? buildCounter} , hasDefaultValue:false, defaultValueCode:null
    InputCounterWidgetBuilder? buildCounter,

    /// optionalParameters: {ScrollPhysics? scrollPhysics} , hasDefaultValue:false, defaultValueCode:null
    ScrollPhysics? scrollPhysics,

    /// optionalParameters: {Iterable<String>? autofillHints} , hasDefaultValue:false, defaultValueCode:null
    Iterable<String>? autofillHints,

    /// optionalParameters: {AutovalidateMode? autovalidateMode} , hasDefaultValue:false, defaultValueCode:null
    AutovalidateMode? autovalidateMode,

    /// optionalParameters: {ScrollController? scrollController} , hasDefaultValue:false, defaultValueCode:null
    ScrollController? scrollController,

    /// optionalParameters: {String? restorationId} , hasDefaultValue:false, defaultValueCode:null
    String? restorationId,

    /// optionalParameters: {bool enableIMEPersonalizedLearning = true} , hasDefaultValue:true, defaultValueCode:true
    required bool enableIMEPersonalizedLearning,

    /// optionalParameters: {MouseCursor? mouseCursor} , hasDefaultValue:false, defaultValueCode:null
    MouseCursor? mouseCursor,

    /// optionalParameters: {Widget Function(BuildContext, EditableTextState)? contextMenuBuilder = _defaultContextMenuBuilder} , hasDefaultValue:true, defaultValueCode:_defaultContextMenuBuilder
    EditableTextContextMenuBuilder? contextMenuBuilder,

    /// optionalParameters: {TextMagnifierConfiguration? magnifierConfiguration} , hasDefaultValue:false, defaultValueCode:null
    TextMagnifierConfiguration? magnifierConfiguration,
  }) : super(
          key: key,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          decoration: decoration,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          autofocus: autofocus,
          readOnly: readOnly,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onTapOutside: onTapOutside,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          buildCounter: buildCounter,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          autovalidateMode: autovalidateMode,
          scrollController: scrollController,
          restorationId: restorationId,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          mouseCursor: mouseCursor,
          contextMenuBuilder: contextMenuBuilder,
          magnifierConfiguration: magnifierConfiguration,
        ) {
    mateBuilder = (p) => TextFormField$Mate(
          key: p.get('key').build(),
          controller: p.get('controller').build(),
          initialValue: p.get('initialValue').build(),
          focusNode: p.get('focusNode').build(),
          decoration: p.get('decoration').build(),
          keyboardType: p.get('keyboardType').build(),
          textCapitalization: p.get('textCapitalization').build(),
          textInputAction: p.get('textInputAction').build(),
          style: p.get('style').build(),
          strutStyle: p.get('strutStyle').build(),
          textDirection: p.get('textDirection').build(),
          textAlign: p.get('textAlign').build(),
          textAlignVertical: p.get('textAlignVertical').build(),
          autofocus: p.get('autofocus').build(),
          readOnly: p.get('readOnly').build(),
          showCursor: p.get('showCursor').build(),
          obscuringCharacter: p.get('obscuringCharacter').build(),
          obscureText: p.get('obscureText').build(),
          autocorrect: p.get('autocorrect').build(),
          smartDashesType: p.get('smartDashesType').build(),
          smartQuotesType: p.get('smartQuotesType').build(),
          enableSuggestions: p.get('enableSuggestions').build(),
          maxLengthEnforcement: p.get('maxLengthEnforcement').build(),
          maxLines: p.get('maxLines').build(),
          minLines: p.get('minLines').build(),
          expands: p.get('expands').build(),
          maxLength: p.get('maxLength').build(),
          onChanged: p.get('onChanged').build(),
          onTap: p.get('onTap').build(),
          onTapOutside: p.get('onTapOutside').build(),
          onEditingComplete: p.get('onEditingComplete').build(),
          onFieldSubmitted: p.get('onFieldSubmitted').build(),
          onSaved: p.get('onSaved').build(),
          validator: p.get('validator').build(),
          inputFormatters: p.get('inputFormatters').build(),
          enabled: p.get('enabled').build(),
          cursorWidth: p.get('cursorWidth').build(),
          cursorHeight: p.get('cursorHeight').build(),
          cursorRadius: p.get('cursorRadius').build(),
          cursorColor: p.get('cursorColor').build(),
          keyboardAppearance: p.get('keyboardAppearance').build(),
          scrollPadding: p.get('scrollPadding').build(),
          enableInteractiveSelection: p.get('enableInteractiveSelection').build(),
          selectionControls: p.get('selectionControls').build(),
          buildCounter: p.get('buildCounter').build(),
          scrollPhysics: p.get('scrollPhysics').build(),
          autofillHints: p.get('autofillHints').build(),
          autovalidateMode: p.get('autovalidateMode').build(),
          scrollController: p.get('scrollController').build(),
          restorationId: p.get('restorationId').build(),
          enableIMEPersonalizedLearning: p.get('enableIMEPersonalizedLearning').build(),
          mouseCursor: p.get('mouseCursor').build(),
          contextMenuBuilder: p.get('contextMenuBuilder').build(),
          magnifierConfiguration: p.get('magnifierConfiguration').build(),
        );
    matePut('key', key);
    matePut('controller', controller);
    matePut('initialValue', initialValue);
    matePut('focusNode', focusNode);
    matePut('decoration', decoration);
    matePut('keyboardType', keyboardType);
    matePut('textCapitalization', textCapitalization);
    matePut('textInputAction', textInputAction);
    matePut('style', style);
    matePut('strutStyle', strutStyle);
    matePut('textDirection', textDirection);
    matePut('textAlign', textAlign);
    matePut('textAlignVertical', textAlignVertical);
    matePut('autofocus', autofocus);
    matePut('readOnly', readOnly);
    matePut('showCursor', showCursor);
    matePut('obscuringCharacter', obscuringCharacter);
    matePut('obscureText', obscureText);
    matePut('autocorrect', autocorrect);
    matePut('smartDashesType', smartDashesType);
    matePut('smartQuotesType', smartQuotesType);
    matePut('enableSuggestions', enableSuggestions);
    matePut('maxLengthEnforcement', maxLengthEnforcement);
    matePut('maxLines', maxLines);
    matePut('minLines', minLines);
    matePut('expands', expands);
    matePut('maxLength', maxLength);
    matePut('onChanged', onChanged);
    matePut('onTap', onTap);
    matePut('onTapOutside', onTapOutside);
    matePut('onEditingComplete', onEditingComplete);
    matePut('onFieldSubmitted', onFieldSubmitted);
    matePut('onSaved', onSaved);
    matePut('validator', validator);
    matePut('inputFormatters', inputFormatters);
    matePut('enabled', enabled);
    matePut('cursorWidth', cursorWidth);
    matePut('cursorHeight', cursorHeight);
    matePut('cursorRadius', cursorRadius);
    matePut('cursorColor', cursorColor);
    matePut('keyboardAppearance', keyboardAppearance);
    matePut('scrollPadding', scrollPadding);
    matePut('enableInteractiveSelection', enableInteractiveSelection);
    matePut('selectionControls', selectionControls);
    matePut('buildCounter', buildCounter);
    matePut('scrollPhysics', scrollPhysics);
    matePut('autofillHints', autofillHints);
    matePut('autovalidateMode', autovalidateMode);
    matePut('scrollController', scrollController);
    matePut('restorationId', restorationId);
    matePut('enableIMEPersonalizedLearning', enableIMEPersonalizedLearning);
    matePut('mouseCursor', mouseCursor);
    matePut('contextMenuBuilder', contextMenuBuilder);
    matePut('magnifierConfiguration', magnifierConfiguration);
  }
}