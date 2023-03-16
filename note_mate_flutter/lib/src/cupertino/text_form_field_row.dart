// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/text_form_field_row.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'dart:core';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/painting/box_decoration.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/painting/strut_style.dart';
import 'dart:ui';
import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:flutter/src/widgets/text_selection.dart';
import 'package:flutter/src/widgets/scroll_physics.dart';
import 'package:note/mate.dart';

/// class CupertinoTextFormFieldRow extends FormField<String>
class CupertinoTextFormFieldRow$Mate extends CupertinoTextFormFieldRow with WidgetMate<CupertinoTextFormFieldRow$Mate> {
  /// CupertinoTextFormFieldRow CupertinoTextFormFieldRow({Key? key, Widget? prefix, EdgeInsetsGeometry? padding, TextEditingController? controller, String? initialValue, FocusNode? focusNode, BoxDecoration? decoration, TextInputType? keyboardType, TextCapitalization textCapitalization = TextCapitalization.none, TextInputAction? textInputAction, TextStyle? style, StrutStyle? strutStyle, TextDirection? textDirection, TextAlign textAlign = TextAlign.start, TextAlignVertical? textAlignVertical, bool autofocus = false, bool readOnly = false, ToolbarOptions? toolbarOptions, bool? showCursor, String obscuringCharacter = '•', bool obscureText = false, bool autocorrect = true, SmartDashesType? smartDashesType, SmartQuotesType? smartQuotesType, bool enableSuggestions = true, int? maxLines = 1, int? minLines, bool expands = false, int? maxLength, void Function(String)? onChanged, void Function()? onTap, void Function()? onEditingComplete, void Function(String)? onFieldSubmitted, void Function(String?)? onSaved, String? Function(String?)? validator, List<TextInputFormatter>? inputFormatters, bool? enabled, double cursorWidth = 2.0, double? cursorHeight, Color? cursorColor, Brightness? keyboardAppearance, EdgeInsets scrollPadding = const EdgeInsets.all(20.0), bool enableInteractiveSelection = true, TextSelectionControls? selectionControls, ScrollPhysics? scrollPhysics, Iterable<String>? autofillHints, AutovalidateMode autovalidateMode = AutovalidateMode.disabled, String? placeholder, TextStyle? placeholderStyle = const TextStyle(fontWeight: FontWeight.w400, color: CupertinoColors.placeholderText), Widget Function(BuildContext, EditableTextState)? contextMenuBuilder = _defaultContextMenuBuilder})
  CupertinoTextFormFieldRow$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Widget? prefix} , hasDefaultValue:false, defaultValueCode:null
    Widget? prefix,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , hasDefaultValue:false, defaultValueCode:null
    EdgeInsetsGeometry? padding,

    /// optionalParameters: {TextEditingController? controller} , hasDefaultValue:false, defaultValueCode:null
    TextEditingController? controller,

    /// optionalParameters: {String? initialValue} , hasDefaultValue:false, defaultValueCode:null
    String? initialValue,

    /// optionalParameters: {FocusNode? focusNode} , hasDefaultValue:false, defaultValueCode:null
    FocusNode? focusNode,

    /// optionalParameters: {BoxDecoration? decoration} , hasDefaultValue:false, defaultValueCode:null
    BoxDecoration? decoration,

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

    /// optionalParameters: {Color? cursorColor} , hasDefaultValue:false, defaultValueCode:null
    Color? cursorColor,

    /// optionalParameters: {Brightness? keyboardAppearance} , hasDefaultValue:false, defaultValueCode:null
    Brightness? keyboardAppearance,

    /// optionalParameters: {EdgeInsets scrollPadding = const EdgeInsets.all(20.0)} , hasDefaultValue:true, defaultValueCode:const EdgeInsets.all(20.0)
    required EdgeInsets scrollPadding,

    /// optionalParameters: {bool enableInteractiveSelection = true} , hasDefaultValue:true, defaultValueCode:true
    required bool enableInteractiveSelection,

    /// optionalParameters: {TextSelectionControls? selectionControls} , hasDefaultValue:false, defaultValueCode:null
    TextSelectionControls? selectionControls,

    /// optionalParameters: {ScrollPhysics? scrollPhysics} , hasDefaultValue:false, defaultValueCode:null
    ScrollPhysics? scrollPhysics,

    /// optionalParameters: {Iterable<String>? autofillHints} , hasDefaultValue:false, defaultValueCode:null
    Iterable<String>? autofillHints,

    /// optionalParameters: {AutovalidateMode autovalidateMode = AutovalidateMode.disabled} , hasDefaultValue:true, defaultValueCode:AutovalidateMode.disabled
    required AutovalidateMode autovalidateMode,

    /// optionalParameters: {String? placeholder} , hasDefaultValue:false, defaultValueCode:null
    String? placeholder,

    /// optionalParameters: {TextStyle? placeholderStyle = const TextStyle(fontWeight: FontWeight.w400, color: CupertinoColors.placeholderText)} , hasDefaultValue:true, defaultValueCode:const TextStyle(fontWeight: FontWeight.w400, color: CupertinoColors.placeholderText)
    TextStyle? placeholderStyle,

    /// optionalParameters: {Widget Function(BuildContext, EditableTextState)? contextMenuBuilder = _defaultContextMenuBuilder} , hasDefaultValue:true, defaultValueCode:_defaultContextMenuBuilder
    EditableTextContextMenuBuilder? contextMenuBuilder,
  }) : super(
          key: key,
          prefix: prefix,
          padding: padding,
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
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          autovalidateMode: autovalidateMode,
          placeholder: placeholder,
          placeholderStyle: placeholderStyle,
          contextMenuBuilder: contextMenuBuilder,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => CupertinoTextFormFieldRow$Mate(
        key: p.get('key').value,
        prefix: p.get('prefix').value,
        padding: p.get('padding').value,
        controller: p.get('controller').value,
        initialValue: p.get('initialValue').value,
        focusNode: p.get('focusNode').value,
        decoration: p.get('decoration').value,
        keyboardType: p.get('keyboardType').value,
        textCapitalization: p.get('textCapitalization').value,
        textInputAction: p.get('textInputAction').value,
        style: p.get('style').value,
        strutStyle: p.get('strutStyle').value,
        textDirection: p.get('textDirection').value,
        textAlign: p.get('textAlign').value,
        textAlignVertical: p.get('textAlignVertical').value,
        autofocus: p.get('autofocus').value,
        readOnly: p.get('readOnly').value,
        showCursor: p.get('showCursor').value,
        obscuringCharacter: p.get('obscuringCharacter').value,
        obscureText: p.get('obscureText').value,
        autocorrect: p.get('autocorrect').value,
        smartDashesType: p.get('smartDashesType').value,
        smartQuotesType: p.get('smartQuotesType').value,
        enableSuggestions: p.get('enableSuggestions').value,
        maxLines: p.get('maxLines').value,
        minLines: p.get('minLines').value,
        expands: p.get('expands').value,
        maxLength: p.get('maxLength').value,
        onChanged: p.get('onChanged').value,
        onTap: p.get('onTap').value,
        onEditingComplete: p.get('onEditingComplete').value,
        onFieldSubmitted: p.get('onFieldSubmitted').value,
        onSaved: p.get('onSaved').value,
        validator: p.get('validator').value,
        inputFormatters: p.get('inputFormatters').value,
        enabled: p.get('enabled').value,
        cursorWidth: p.get('cursorWidth').value,
        cursorHeight: p.get('cursorHeight').value,
        cursorColor: p.get('cursorColor').value,
        keyboardAppearance: p.get('keyboardAppearance').value,
        scrollPadding: p.get('scrollPadding').value,
        enableInteractiveSelection: p.get('enableInteractiveSelection').value,
        selectionControls: p.get('selectionControls').value,
        scrollPhysics: p.get('scrollPhysics').value,
        autofillHints: p.get('autofillHints').value,
        autovalidateMode: p.get('autovalidateMode').value,
        placeholder: p.get('placeholder').value,
        placeholderStyle: p.get('placeholderStyle').value,
        contextMenuBuilder: p.get('contextMenuBuilder').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('prefix', prefix);
    mateParams.put('padding', padding);
    mateParams.put('controller', controller);
    mateParams.put('initialValue', initialValue);
    mateParams.put('focusNode', focusNode);
    mateParams.put('decoration', decoration);
    mateParams.put('keyboardType', keyboardType);
    mateParams.put('textCapitalization', textCapitalization);
    mateParams.put('textInputAction', textInputAction);
    mateParams.put('style', style);
    mateParams.put('strutStyle', strutStyle);
    mateParams.put('textDirection', textDirection);
    mateParams.put('textAlign', textAlign);
    mateParams.put('textAlignVertical', textAlignVertical);
    mateParams.put('autofocus', autofocus);
    mateParams.put('readOnly', readOnly);
    mateParams.put('showCursor', showCursor);
    mateParams.put('obscuringCharacter', obscuringCharacter);
    mateParams.put('obscureText', obscureText);
    mateParams.put('autocorrect', autocorrect);
    mateParams.put('smartDashesType', smartDashesType);
    mateParams.put('smartQuotesType', smartQuotesType);
    mateParams.put('enableSuggestions', enableSuggestions);
    mateParams.put('maxLines', maxLines);
    mateParams.put('minLines', minLines);
    mateParams.put('expands', expands);
    mateParams.put('maxLength', maxLength);
    mateParams.put('onChanged', onChanged);
    mateParams.put('onTap', onTap);
    mateParams.put('onEditingComplete', onEditingComplete);
    mateParams.put('onFieldSubmitted', onFieldSubmitted);
    mateParams.put('onSaved', onSaved);
    mateParams.put('validator', validator);
    mateParams.putList('inputFormatters', inputFormatters);
    mateParams.put('enabled', enabled);
    mateParams.put('cursorWidth', cursorWidth);
    mateParams.put('cursorHeight', cursorHeight);
    mateParams.put('cursorColor', cursorColor);
    mateParams.put('keyboardAppearance', keyboardAppearance);
    mateParams.put('scrollPadding', scrollPadding);
    mateParams.put('enableInteractiveSelection', enableInteractiveSelection);
    mateParams.put('selectionControls', selectionControls);
    mateParams.put('scrollPhysics', scrollPhysics);
    mateParams.put('autofillHints', autofillHints);
    mateParams.put('autovalidateMode', autovalidateMode);
    mateParams.put('placeholder', placeholder);
    mateParams.put('placeholderStyle', placeholderStyle);
    mateParams.put('contextMenuBuilder', contextMenuBuilder);
  }
}
