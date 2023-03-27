// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/editable_text.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/services/text_input.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/services/keyboard_inserted_content.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/painting/strut_style.dart';
import 'dart:ui';
import 'package:flutter/src/painting/text_painter.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/text_selection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/tap_region.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/gestures/recognizer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:flutter/src/widgets/scroll_physics.dart';
import 'package:flutter/src/services/autofill.dart';
import 'package:flutter/src/widgets/scroll_configuration.dart';
import 'package:flutter/src/widgets/spell_check.dart';
import 'package:flutter/src/widgets/magnifier.dart';
import 'package:flutter/widgets.dart';

/// class TextEditingController extends ValueNotifier<TextEditingValue>
class TextEditingController$Mate extends TextEditingController with Mate {
  /// TextEditingController TextEditingController({String? text})
  TextEditingController$Mate(
      {
      /// optionalParameters: {String? text} , defaultValue:none
      String? text})
      : super(text: text) {
    mateCreateName = 'TextEditingController';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => TextEditingController$Mate(text: p.get('text').build());
    mateUse('text', text, isNamed: true);
  }

  /// TextEditingController TextEditingController.fromValue(TextEditingValue? value)
  TextEditingController$Mate.fromValue(

      /// requiredParameters: TextEditingValue? value
      TextEditingValue? value)
      : super.fromValue(value) {
    mateCreateName = 'TextEditingController.fromValue';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => TextEditingController$Mate.fromValue(p.get('value').value);
    mateUse('value', value, isNamed: false);
  }
}

/// class ToolbarOptions
class ToolbarOptions$Mate extends ToolbarOptions with Mate {
  /// ToolbarOptions ToolbarOptions({bool copy = false, bool cut = false, bool paste = false, bool selectAll = false})
  ToolbarOptions$Mate({
    /// optionalParameters: {bool copy = false} , defaultValue:Literal
    bool copy = false,

    /// optionalParameters: {bool cut = false} , defaultValue:Literal
    bool cut = false,

    /// optionalParameters: {bool paste = false} , defaultValue:Literal
    bool paste = false,

    /// optionalParameters: {bool selectAll = false} , defaultValue:Literal
    bool selectAll = false,
  }) : super(
          copy: copy,
          cut: cut,
          paste: paste,
          selectAll: selectAll,
        ) {
    mateCreateName = 'ToolbarOptions';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => ToolbarOptions$Mate(
          copy: p.get('copy').build(),
          cut: p.get('cut').build(),
          paste: p.get('paste').build(),
          selectAll: p.get('selectAll').build(),
        );
    mateUse('copy', copy, isNamed: true);
    mateUse('cut', cut, isNamed: true);
    mateUse('paste', paste, isNamed: true);
    mateUse('selectAll', selectAll, isNamed: true);
  }
}

/// class ContentInsertionConfiguration
class ContentInsertionConfiguration$Mate extends ContentInsertionConfiguration with Mate {
  /// ContentInsertionConfiguration ContentInsertionConfiguration({required void Function(KeyboardInsertedContent) onContentInserted, List<String> allowedMimeTypes = kDefaultContentInsertionMimeTypes})
  ContentInsertionConfiguration$Mate({
    /// optionalParameters: {required void Function(KeyboardInsertedContent) onContentInserted} , defaultValue:none
    required ValueChanged<KeyboardInsertedContent> onContentInserted,

    /// optionalParameters: {List<String> allowedMimeTypes = kDefaultContentInsertionMimeTypes} , defaultValue:unprocessed
    required List<String> allowedMimeTypes,
  }) : super(
          onContentInserted: onContentInserted,
          allowedMimeTypes: allowedMimeTypes,
        ) {
    mateCreateName = 'ContentInsertionConfiguration';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => ContentInsertionConfiguration$Mate(
          onContentInserted: p.get('onContentInserted').build(),
          allowedMimeTypes: p.get('allowedMimeTypes').build(),
        );
    mateUse('onContentInserted', onContentInserted, isNamed: true);
    mateUseList('allowedMimeTypes', allowedMimeTypes, isNamed: true);
  }
}

/// class EditableText extends StatefulWidget
class EditableText$Mate extends EditableText with Mate {
  /// EditableText EditableText({Key? key, required TextEditingController controller, required FocusNode focusNode, bool readOnly = false, String obscuringCharacter = '•', bool obscureText = false, bool autocorrect = true, SmartDashesType? smartDashesType, SmartQuotesType? smartQuotesType, bool enableSuggestions = true, required TextStyle style, StrutStyle? strutStyle, required Color cursorColor, required Color backgroundCursorColor, TextAlign textAlign = TextAlign.start, TextDirection? textDirection, Locale? locale, double? textScaleFactor, int? maxLines = 1, int? minLines, bool expands = false, bool forceLine = true, TextHeightBehavior? textHeightBehavior, TextWidthBasis textWidthBasis = TextWidthBasis.parent, bool autofocus = false, bool? showCursor, bool showSelectionHandles = false, Color? selectionColor, TextSelectionControls? selectionControls, TextInputType? keyboardType, TextInputAction? textInputAction, TextCapitalization textCapitalization = TextCapitalization.none, void Function(String)? onChanged, void Function()? onEditingComplete, void Function(String)? onSubmitted, void Function(String, Map<String, dynamic>)? onAppPrivateCommand, void Function(TextSelection, SelectionChangedCause?)? onSelectionChanged, void Function()? onSelectionHandleTapped, void Function(PointerDownEvent)? onTapOutside, List<TextInputFormatter>? inputFormatters, MouseCursor? mouseCursor, bool rendererIgnoresPointer = false, double cursorWidth = 2.0, double? cursorHeight, Radius? cursorRadius, bool cursorOpacityAnimates = false, Offset? cursorOffset, bool paintCursorAboveText = false, BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight, BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight, EdgeInsets scrollPadding = const EdgeInsets.all(20.0), Brightness keyboardAppearance = Brightness.light, DragStartBehavior dragStartBehavior = DragStartBehavior.start, bool? enableInteractiveSelection, ScrollController? scrollController, ScrollPhysics? scrollPhysics, Color? autocorrectionTextRectColor, ToolbarOptions? toolbarOptions, Iterable<String>? autofillHints = const <String>[], AutofillClient? autofillClient, Clip clipBehavior = Clip.hardEdge, String? restorationId, ScrollBehavior? scrollBehavior, bool scribbleEnabled = true, bool enableIMEPersonalizedLearning = true, ContentInsertionConfiguration? contentInsertionConfiguration, Widget Function(BuildContext, EditableTextState)? contextMenuBuilder, SpellCheckConfiguration? spellCheckConfiguration, TextMagnifierConfiguration magnifierConfiguration = TextMagnifierConfiguration.disabled})
  EditableText$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required TextEditingController controller} , defaultValue:none
    required TextEditingController controller,

    /// optionalParameters: {required FocusNode focusNode} , defaultValue:none
    required FocusNode focusNode,

    /// optionalParameters: {bool readOnly = false} , defaultValue:Literal
    bool readOnly = false,

    /// optionalParameters: {String obscuringCharacter = '•'} , defaultValue:Literal
    String obscuringCharacter = '•',

    /// optionalParameters: {bool obscureText = false} , defaultValue:Literal
    bool obscureText = false,

    /// optionalParameters: {bool autocorrect = true} , defaultValue:Literal
    bool autocorrect = true,

    /// optionalParameters: {SmartDashesType? smartDashesType} , defaultValue:none
    SmartDashesType? smartDashesType,

    /// optionalParameters: {SmartQuotesType? smartQuotesType} , defaultValue:none
    SmartQuotesType? smartQuotesType,

    /// optionalParameters: {bool enableSuggestions = true} , defaultValue:Literal
    bool enableSuggestions = true,

    /// optionalParameters: {required TextStyle style} , defaultValue:none
    required TextStyle style,

    /// optionalParameters: {StrutStyle? strutStyle} , defaultValue:none
    StrutStyle? strutStyle,

    /// optionalParameters: {required Color cursorColor} , defaultValue:none
    required Color cursorColor,

    /// optionalParameters: {required Color backgroundCursorColor} , defaultValue:none
    required Color backgroundCursorColor,

    /// optionalParameters: {TextAlign textAlign = TextAlign.start} , defaultValue:PrefixedIdentifier
    TextAlign textAlign = TextAlign.start,

    /// optionalParameters: {TextDirection? textDirection} , defaultValue:none
    TextDirection? textDirection,

    /// optionalParameters: {Locale? locale} , defaultValue:none
    Locale? locale,

    /// optionalParameters: {double? textScaleFactor} , defaultValue:none
    double? textScaleFactor,

    /// optionalParameters: {int? maxLines = 1} , defaultValue:Literal
    int? maxLines = 1,

    /// optionalParameters: {int? minLines} , defaultValue:none
    int? minLines,

    /// optionalParameters: {bool expands = false} , defaultValue:Literal
    bool expands = false,

    /// optionalParameters: {bool forceLine = true} , defaultValue:Literal
    bool forceLine = true,

    /// optionalParameters: {TextHeightBehavior? textHeightBehavior} , defaultValue:none
    TextHeightBehavior? textHeightBehavior,

    /// optionalParameters: {TextWidthBasis textWidthBasis = TextWidthBasis.parent} , defaultValue:PrefixedIdentifier
    TextWidthBasis textWidthBasis = TextWidthBasis.parent,

    /// optionalParameters: {bool autofocus = false} , defaultValue:Literal
    bool autofocus = false,

    /// optionalParameters: {bool? showCursor} , defaultValue:none
    bool? showCursor,

    /// optionalParameters: {bool showSelectionHandles = false} , defaultValue:Literal
    bool showSelectionHandles = false,

    /// optionalParameters: {Color? selectionColor} , defaultValue:none
    Color? selectionColor,

    /// optionalParameters: {TextSelectionControls? selectionControls} , defaultValue:none
    TextSelectionControls? selectionControls,

    /// optionalParameters: {TextInputType? keyboardType} , defaultValue:none
    TextInputType? keyboardType,

    /// optionalParameters: {TextInputAction? textInputAction} , defaultValue:none
    TextInputAction? textInputAction,

    /// optionalParameters: {TextCapitalization textCapitalization = TextCapitalization.none} , defaultValue:PrefixedIdentifier
    TextCapitalization textCapitalization = TextCapitalization.none,

    /// optionalParameters: {void Function(String)? onChanged} , defaultValue:none
    ValueChanged<String>? onChanged,

    /// optionalParameters: {void Function()? onEditingComplete} , defaultValue:none
    VoidCallback? onEditingComplete,

    /// optionalParameters: {void Function(String)? onSubmitted} , defaultValue:none
    ValueChanged<String>? onSubmitted,

    /// optionalParameters: {void Function(String, Map<String, dynamic>)? onAppPrivateCommand} , defaultValue:none
    AppPrivateCommandCallback? onAppPrivateCommand,

    /// optionalParameters: {void Function(TextSelection, SelectionChangedCause?)? onSelectionChanged} , defaultValue:none
    SelectionChangedCallback? onSelectionChanged,

    /// optionalParameters: {void Function()? onSelectionHandleTapped} , defaultValue:none
    VoidCallback? onSelectionHandleTapped,

    /// optionalParameters: {void Function(PointerDownEvent)? onTapOutside} , defaultValue:none
    TapRegionCallback? onTapOutside,

    /// optionalParameters: {List<TextInputFormatter>? inputFormatters} , defaultValue:none
    List<TextInputFormatter>? inputFormatters,

    /// optionalParameters: {MouseCursor? mouseCursor} , defaultValue:none
    MouseCursor? mouseCursor,

    /// optionalParameters: {bool rendererIgnoresPointer = false} , defaultValue:Literal
    bool rendererIgnoresPointer = false,

    /// optionalParameters: {double cursorWidth = 2.0} , defaultValue:Literal
    double cursorWidth = 2.0,

    /// optionalParameters: {double? cursorHeight} , defaultValue:none
    double? cursorHeight,

    /// optionalParameters: {Radius? cursorRadius} , defaultValue:none
    Radius? cursorRadius,

    /// optionalParameters: {bool cursorOpacityAnimates = false} , defaultValue:Literal
    bool cursorOpacityAnimates = false,

    /// optionalParameters: {Offset? cursorOffset} , defaultValue:none
    Offset? cursorOffset,

    /// optionalParameters: {bool paintCursorAboveText = false} , defaultValue:Literal
    bool paintCursorAboveText = false,

    /// optionalParameters: {BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight} , defaultValue:unprocessed
    required BoxHeightStyle selectionHeightStyle,

    /// optionalParameters: {BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight} , defaultValue:unprocessed
    required BoxWidthStyle selectionWidthStyle,

    /// optionalParameters: {EdgeInsets scrollPadding = const EdgeInsets.all(20.0)} , defaultValue:unprocessed
    required EdgeInsets scrollPadding,

    /// optionalParameters: {Brightness keyboardAppearance = Brightness.light} , defaultValue:PrefixedIdentifier
    Brightness keyboardAppearance = Brightness.light,

    /// optionalParameters: {DragStartBehavior dragStartBehavior = DragStartBehavior.start} , defaultValue:PrefixedIdentifier
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,

    /// optionalParameters: {bool? enableInteractiveSelection} , defaultValue:none
    bool? enableInteractiveSelection,

    /// optionalParameters: {ScrollController? scrollController} , defaultValue:none
    ScrollController? scrollController,

    /// optionalParameters: {ScrollPhysics? scrollPhysics} , defaultValue:none
    ScrollPhysics? scrollPhysics,

    /// optionalParameters: {Color? autocorrectionTextRectColor} , defaultValue:none
    Color? autocorrectionTextRectColor,

    /// optionalParameters: {Iterable<String>? autofillHints = const <String>[]} , defaultValue:unprocessed
    Iterable<String>? autofillHints,

    /// optionalParameters: {AutofillClient? autofillClient} , defaultValue:none
    AutofillClient? autofillClient,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , defaultValue:PrefixedIdentifier
    Clip clipBehavior = Clip.hardEdge,

    /// optionalParameters: {String? restorationId} , defaultValue:none
    String? restorationId,

    /// optionalParameters: {ScrollBehavior? scrollBehavior} , defaultValue:none
    ScrollBehavior? scrollBehavior,

    /// optionalParameters: {bool scribbleEnabled = true} , defaultValue:Literal
    bool scribbleEnabled = true,

    /// optionalParameters: {bool enableIMEPersonalizedLearning = true} , defaultValue:Literal
    bool enableIMEPersonalizedLearning = true,

    /// optionalParameters: {ContentInsertionConfiguration? contentInsertionConfiguration} , defaultValue:none
    ContentInsertionConfiguration? contentInsertionConfiguration,

    /// optionalParameters: {Widget Function(BuildContext, EditableTextState)? contextMenuBuilder} , defaultValue:none
    EditableTextContextMenuBuilder? contextMenuBuilder,

    /// optionalParameters: {SpellCheckConfiguration? spellCheckConfiguration} , defaultValue:none
    SpellCheckConfiguration? spellCheckConfiguration,

    /// optionalParameters: {TextMagnifierConfiguration magnifierConfiguration = TextMagnifierConfiguration.disabled} , defaultValue:PrefixedIdentifier
    TextMagnifierConfiguration magnifierConfiguration = TextMagnifierConfiguration.disabled,
  }) : super(
          key: key,
          controller: controller,
          focusNode: focusNode,
          readOnly: readOnly,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          style: style,
          strutStyle: strutStyle,
          cursorColor: cursorColor,
          backgroundCursorColor: backgroundCursorColor,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          forceLine: forceLine,
          textHeightBehavior: textHeightBehavior,
          textWidthBasis: textWidthBasis,
          autofocus: autofocus,
          showCursor: showCursor,
          showSelectionHandles: showSelectionHandles,
          selectionColor: selectionColor,
          selectionControls: selectionControls,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          onAppPrivateCommand: onAppPrivateCommand,
          onSelectionChanged: onSelectionChanged,
          onSelectionHandleTapped: onSelectionHandleTapped,
          onTapOutside: onTapOutside,
          inputFormatters: inputFormatters,
          mouseCursor: mouseCursor,
          rendererIgnoresPointer: rendererIgnoresPointer,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorOpacityAnimates: cursorOpacityAnimates,
          cursorOffset: cursorOffset,
          paintCursorAboveText: paintCursorAboveText,
          selectionHeightStyle: selectionHeightStyle,
          selectionWidthStyle: selectionWidthStyle,
          scrollPadding: scrollPadding,
          keyboardAppearance: keyboardAppearance,
          dragStartBehavior: dragStartBehavior,
          enableInteractiveSelection: enableInteractiveSelection,
          scrollController: scrollController,
          scrollPhysics: scrollPhysics,
          autocorrectionTextRectColor: autocorrectionTextRectColor,
          autofillHints: autofillHints,
          autofillClient: autofillClient,
          clipBehavior: clipBehavior,
          restorationId: restorationId,
          scrollBehavior: scrollBehavior,
          scribbleEnabled: scribbleEnabled,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          contentInsertionConfiguration: contentInsertionConfiguration,
          contextMenuBuilder: contextMenuBuilder,
          spellCheckConfiguration: spellCheckConfiguration,
          magnifierConfiguration: magnifierConfiguration,
        ) {
    mateCreateName = 'EditableText';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => EditableText$Mate(
          key: p.get('key').build(),
          controller: p.get('controller').build(),
          focusNode: p.get('focusNode').build(),
          readOnly: p.get('readOnly').build(),
          obscuringCharacter: p.get('obscuringCharacter').build(),
          obscureText: p.get('obscureText').build(),
          autocorrect: p.get('autocorrect').build(),
          smartDashesType: p.get('smartDashesType').build(),
          smartQuotesType: p.get('smartQuotesType').build(),
          enableSuggestions: p.get('enableSuggestions').build(),
          style: p.get('style').build(),
          strutStyle: p.get('strutStyle').build(),
          cursorColor: p.get('cursorColor').build(),
          backgroundCursorColor: p.get('backgroundCursorColor').build(),
          textAlign: p.get('textAlign').build(),
          textDirection: p.get('textDirection').build(),
          locale: p.get('locale').build(),
          textScaleFactor: p.get('textScaleFactor').build(),
          maxLines: p.get('maxLines').build(),
          minLines: p.get('minLines').build(),
          expands: p.get('expands').build(),
          forceLine: p.get('forceLine').build(),
          textHeightBehavior: p.get('textHeightBehavior').build(),
          textWidthBasis: p.get('textWidthBasis').build(),
          autofocus: p.get('autofocus').build(),
          showCursor: p.get('showCursor').build(),
          showSelectionHandles: p.get('showSelectionHandles').build(),
          selectionColor: p.get('selectionColor').build(),
          selectionControls: p.get('selectionControls').build(),
          keyboardType: p.get('keyboardType').build(),
          textInputAction: p.get('textInputAction').build(),
          textCapitalization: p.get('textCapitalization').build(),
          onChanged: p.get('onChanged').build(),
          onEditingComplete: p.get('onEditingComplete').build(),
          onSubmitted: p.get('onSubmitted').build(),
          onAppPrivateCommand: p.get('onAppPrivateCommand').build(),
          onSelectionChanged: p.get('onSelectionChanged').build(),
          onSelectionHandleTapped: p.get('onSelectionHandleTapped').build(),
          onTapOutside: p.get('onTapOutside').build(),
          inputFormatters: p.get('inputFormatters').build(),
          mouseCursor: p.get('mouseCursor').build(),
          rendererIgnoresPointer: p.get('rendererIgnoresPointer').build(),
          cursorWidth: p.get('cursorWidth').build(),
          cursorHeight: p.get('cursorHeight').build(),
          cursorRadius: p.get('cursorRadius').build(),
          cursorOpacityAnimates: p.get('cursorOpacityAnimates').build(),
          cursorOffset: p.get('cursorOffset').build(),
          paintCursorAboveText: p.get('paintCursorAboveText').build(),
          selectionHeightStyle: p.get('selectionHeightStyle').build(),
          selectionWidthStyle: p.get('selectionWidthStyle').build(),
          scrollPadding: p.get('scrollPadding').build(),
          keyboardAppearance: p.get('keyboardAppearance').build(),
          dragStartBehavior: p.get('dragStartBehavior').build(),
          enableInteractiveSelection: p.get('enableInteractiveSelection').build(),
          scrollController: p.get('scrollController').build(),
          scrollPhysics: p.get('scrollPhysics').build(),
          autocorrectionTextRectColor: p.get('autocorrectionTextRectColor').build(),
          autofillHints: p.get('autofillHints').build(),
          autofillClient: p.get('autofillClient').build(),
          clipBehavior: p.get('clipBehavior').build(),
          restorationId: p.get('restorationId').build(),
          scrollBehavior: p.get('scrollBehavior').build(),
          scribbleEnabled: p.get('scribbleEnabled').build(),
          enableIMEPersonalizedLearning: p.get('enableIMEPersonalizedLearning').build(),
          contentInsertionConfiguration: p.get('contentInsertionConfiguration').build(),
          contextMenuBuilder: p.get('contextMenuBuilder').build(),
          spellCheckConfiguration: p.get('spellCheckConfiguration').build(),
          magnifierConfiguration: p.get('magnifierConfiguration').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('controller', controller, isNamed: true);
    mateUse('focusNode', focusNode, isNamed: true);
    mateUse('readOnly', readOnly, isNamed: true);
    mateUse('obscuringCharacter', obscuringCharacter, isNamed: true);
    mateUse('obscureText', obscureText, isNamed: true);
    mateUse('autocorrect', autocorrect, isNamed: true);
    mateUse('smartDashesType', smartDashesType, isNamed: true);
    mateUse('smartQuotesType', smartQuotesType, isNamed: true);
    mateUse('enableSuggestions', enableSuggestions, isNamed: true);
    mateUse('style', style, isNamed: true);
    mateUse('strutStyle', strutStyle, isNamed: true);
    mateUse('cursorColor', cursorColor, isNamed: true);
    mateUse('backgroundCursorColor', backgroundCursorColor, isNamed: true);
    mateUse('textAlign', textAlign, isNamed: true);
    mateUse('textDirection', textDirection, isNamed: true);
    mateUse('locale', locale, isNamed: true);
    mateUse('textScaleFactor', textScaleFactor, isNamed: true);
    mateUse('maxLines', maxLines, isNamed: true);
    mateUse('minLines', minLines, isNamed: true);
    mateUse('expands', expands, isNamed: true);
    mateUse('forceLine', forceLine, isNamed: true);
    mateUse('textHeightBehavior', textHeightBehavior, isNamed: true);
    mateUse('textWidthBasis', textWidthBasis, isNamed: true);
    mateUse('autofocus', autofocus, isNamed: true);
    mateUse('showCursor', showCursor, isNamed: true);
    mateUse('showSelectionHandles', showSelectionHandles, isNamed: true);
    mateUse('selectionColor', selectionColor, isNamed: true);
    mateUse('selectionControls', selectionControls, isNamed: true);
    mateUse('keyboardType', keyboardType, isNamed: true);
    mateUse('textInputAction', textInputAction, isNamed: true);
    mateUse('textCapitalization', textCapitalization, isNamed: true);
    mateUse('onChanged', onChanged, isNamed: true);
    mateUse('onEditingComplete', onEditingComplete, isNamed: true);
    mateUse('onSubmitted', onSubmitted, isNamed: true);
    mateUse('onAppPrivateCommand', onAppPrivateCommand, isNamed: true);
    mateUse('onSelectionChanged', onSelectionChanged, isNamed: true);
    mateUse('onSelectionHandleTapped', onSelectionHandleTapped, isNamed: true);
    mateUse('onTapOutside', onTapOutside, isNamed: true);
    mateUseList('inputFormatters', inputFormatters, isNamed: true);
    mateUse('mouseCursor', mouseCursor, isNamed: true);
    mateUse('rendererIgnoresPointer', rendererIgnoresPointer, isNamed: true);
    mateUse('cursorWidth', cursorWidth, isNamed: true);
    mateUse('cursorHeight', cursorHeight, isNamed: true);
    mateUse('cursorRadius', cursorRadius, isNamed: true);
    mateUse('cursorOpacityAnimates', cursorOpacityAnimates, isNamed: true);
    mateUse('cursorOffset', cursorOffset, isNamed: true);
    mateUse('paintCursorAboveText', paintCursorAboveText, isNamed: true);
    mateUse('selectionHeightStyle', selectionHeightStyle, isNamed: true);
    mateUse('selectionWidthStyle', selectionWidthStyle, isNamed: true);
    mateUse('scrollPadding', scrollPadding, isNamed: true);
    mateUse('keyboardAppearance', keyboardAppearance, isNamed: true);
    mateUse('dragStartBehavior', dragStartBehavior, isNamed: true);
    mateUse('enableInteractiveSelection', enableInteractiveSelection, isNamed: true);
    mateUse('scrollController', scrollController, isNamed: true);
    mateUse('scrollPhysics', scrollPhysics, isNamed: true);
    mateUse('autocorrectionTextRectColor', autocorrectionTextRectColor, isNamed: true);
    mateUse('autofillHints', autofillHints, isNamed: true);
    mateUse('autofillClient', autofillClient, isNamed: true);
    mateUse('clipBehavior', clipBehavior, isNamed: true);
    mateUse('restorationId', restorationId, isNamed: true);
    mateUse('scrollBehavior', scrollBehavior, isNamed: true);
    mateUse('scribbleEnabled', scribbleEnabled, isNamed: true);
    mateUse('enableIMEPersonalizedLearning', enableIMEPersonalizedLearning, isNamed: true);
    mateUse('contentInsertionConfiguration', contentInsertionConfiguration, isNamed: true);
    mateUse('contextMenuBuilder', contextMenuBuilder, isNamed: true);
    mateUse('spellCheckConfiguration', spellCheckConfiguration, isNamed: true);
    mateUse('magnifierConfiguration', magnifierConfiguration, isNamed: true);
  }
}
