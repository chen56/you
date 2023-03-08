// /// Generated by mat_flutter, please don't edit! Created time: 2023-03-09 00:16:01.575975

library;

import 'dart:core';
import 'package:flutter/src/services/text_input.dart';
import 'package:flutter/src/services/keyboard_inserted_content.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/painting/strut_style.dart';
import 'dart:ui';
import 'package:flutter/src/painting/text_painter.dart';
import 'package:flutter/src/widgets/text_selection.dart';
import 'package:flutter/src/services/text_editing.dart';
import 'package:flutter/src/gestures/events.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:flutter/src/services/mouse_cursor.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/gestures/recognizer.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:flutter/src/widgets/scroll_physics.dart';
import 'package:flutter/src/services/autofill.dart';
import 'package:flutter/src/widgets/scroll_configuration.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/spell_check.dart';
import 'package:flutter/src/widgets/magnifier.dart';
export 'package:flutter/services.dart'
    show
        KeyboardInsertedContent,
        SelectionChangedCause,
        SmartDashesType,
        SmartQuotesType,
        TextEditingValue,
        TextInputType,
        TextSelection;

/// class TextEditingController extends ValueNotifier<TextEditingValue>
class TextEditingControllerMate {
  /// TextEditingController TextEditingController({String? text})
  TextEditingControllerMate(
      {
// param: {String? text}
      String? text}) {}

  /// TextEditingController TextEditingController.fromValue(TextEditingValue? value)
  TextEditingControllerMate.fromValue(
// param: TextEditingValue? value
      TextEditingValue? value) {}
}

/// class ToolbarOptions
class ToolbarOptionsMate {
  /// ToolbarOptions ToolbarOptions({bool copy = false, bool cut = false, bool paste = false, bool selectAll = false})
  ToolbarOptionsMate({
// param: {bool copy = false}
    required bool copy,
// param: {bool cut = false}
    required bool cut,
// param: {bool paste = false}
    required bool paste,
// param: {bool selectAll = false}
    required bool selectAll,
  }) {}
}

/// class ContentInsertionConfiguration
class ContentInsertionConfigurationMate {
  /// ContentInsertionConfiguration ContentInsertionConfiguration({required void Function(KeyboardInsertedContent) onContentInserted, List<String> allowedMimeTypes = kDefaultContentInsertionMimeTypes})
  ContentInsertionConfigurationMate({
// param: {required void Function(KeyboardInsertedContent) onContentInserted}
    required void Function(
      KeyboardInsertedContent, [
      KeyboardInsertedContent,
    ])
        onContentInserted,
// param: {List<String> allowedMimeTypes = kDefaultContentInsertionMimeTypes}
    required List<String> allowedMimeTypes,
  }) {}
}

/// class EditableText extends StatefulWidget
class EditableTextMate {
  /// EditableText EditableText({Key? key, required TextEditingController controller, required FocusNode focusNode, bool readOnly = false, String obscuringCharacter = '•', bool obscureText = false, bool autocorrect = true, SmartDashesType? smartDashesType, SmartQuotesType? smartQuotesType, bool enableSuggestions = true, required TextStyle style, StrutStyle? strutStyle, required Color cursorColor, required Color backgroundCursorColor, TextAlign textAlign = TextAlign.start, TextDirection? textDirection, Locale? locale, double? textScaleFactor, int? maxLines = 1, int? minLines, bool expands = false, bool forceLine = true, TextHeightBehavior? textHeightBehavior, TextWidthBasis textWidthBasis = TextWidthBasis.parent, bool autofocus = false, bool? showCursor, bool showSelectionHandles = false, Color? selectionColor, TextSelectionControls? selectionControls, TextInputType? keyboardType, TextInputAction? textInputAction, TextCapitalization textCapitalization = TextCapitalization.none, void Function(String)? onChanged, void Function()? onEditingComplete, void Function(String)? onSubmitted, void Function(String, Map<String, dynamic>)? onAppPrivateCommand, void Function(TextSelection, SelectionChangedCause?)? onSelectionChanged, void Function()? onSelectionHandleTapped, void Function(PointerDownEvent)? onTapOutside, List<TextInputFormatter>? inputFormatters, MouseCursor? mouseCursor, bool rendererIgnoresPointer = false, double cursorWidth = 2.0, double? cursorHeight, Radius? cursorRadius, bool cursorOpacityAnimates = false, Offset? cursorOffset, bool paintCursorAboveText = false, BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight, BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight, EdgeInsets scrollPadding = const EdgeInsets.all(20.0), Brightness keyboardAppearance = Brightness.light, DragStartBehavior dragStartBehavior = DragStartBehavior.start, bool? enableInteractiveSelection, ScrollController? scrollController, ScrollPhysics? scrollPhysics, Color? autocorrectionTextRectColor, ToolbarOptions? toolbarOptions, Iterable<String>? autofillHints = const <String>[], AutofillClient? autofillClient, Clip clipBehavior = Clip.hardEdge, String? restorationId, ScrollBehavior? scrollBehavior, bool scribbleEnabled = true, bool enableIMEPersonalizedLearning = true, ContentInsertionConfiguration? contentInsertionConfiguration, Widget Function(BuildContext, EditableTextState)? contextMenuBuilder, SpellCheckConfiguration? spellCheckConfiguration, TextMagnifierConfiguration magnifierConfiguration = TextMagnifierConfiguration.disabled})
  EditableTextMate({
// param: {Key? key}
    Key? key,
// param: {required TextEditingController controller}
    required TextEditingController controller,
// param: {required FocusNode focusNode}
    required FocusNode focusNode,
// param: {bool readOnly = false}
    required bool readOnly,
// param: {String obscuringCharacter = '•'}
    required String obscuringCharacter,
// param: {bool obscureText = false}
    required bool obscureText,
// param: {bool autocorrect = true}
    required bool autocorrect,
// param: {SmartDashesType? smartDashesType}
    SmartDashesType? smartDashesType,
// param: {SmartQuotesType? smartQuotesType}
    SmartQuotesType? smartQuotesType,
// param: {bool enableSuggestions = true}
    required bool enableSuggestions,
// param: {required TextStyle style}
    required TextStyle style,
// param: {StrutStyle? strutStyle}
    StrutStyle? strutStyle,
// param: {required Color cursorColor}
    required Color cursorColor,
// param: {required Color backgroundCursorColor}
    required Color backgroundCursorColor,
// param: {TextAlign textAlign = TextAlign.start}
    required TextAlign textAlign,
// param: {TextDirection? textDirection}
    TextDirection? textDirection,
// param: {Locale? locale}
    Locale? locale,
// param: {double? textScaleFactor}
    double? textScaleFactor,
// param: {int? maxLines = 1}
    int? maxLines,
// param: {int? minLines}
    int? minLines,
// param: {bool expands = false}
    required bool expands,
// param: {bool forceLine = true}
    required bool forceLine,
// param: {TextHeightBehavior? textHeightBehavior}
    TextHeightBehavior? textHeightBehavior,
// param: {TextWidthBasis textWidthBasis = TextWidthBasis.parent}
    required TextWidthBasis textWidthBasis,
// param: {bool autofocus = false}
    required bool autofocus,
// param: {bool? showCursor}
    bool? showCursor,
// param: {bool showSelectionHandles = false}
    required bool showSelectionHandles,
// param: {Color? selectionColor}
    Color? selectionColor,
// param: {TextSelectionControls? selectionControls}
    TextSelectionControls? selectionControls,
// param: {TextInputType? keyboardType}
    TextInputType? keyboardType,
// param: {TextInputAction? textInputAction}
    TextInputAction? textInputAction,
// param: {TextCapitalization textCapitalization = TextCapitalization.none}
    required TextCapitalization textCapitalization,
// param: {void Function(String)? onChanged}
    void Function(
      String, [
      String,
    ])?
        onChanged,
// param: {void Function()? onEditingComplete}
    void Function()? onEditingComplete,
// param: {void Function(String)? onSubmitted}
    void Function(
      String, [
      String,
    ])?
        onSubmitted,
// param: {void Function(String, Map<String, dynamic>)? onAppPrivateCommand}
    void Function(
      String,
      Map<String, dynamic>, [
      String,
      Map<String, dynamic>,
    ])?
        onAppPrivateCommand,
// param: {void Function(TextSelection, SelectionChangedCause?)? onSelectionChanged}
    void Function(
      TextSelection,
      SelectionChangedCause?, [
      TextSelection,
      SelectionChangedCause?,
    ])?
        onSelectionChanged,
// param: {void Function()? onSelectionHandleTapped}
    void Function()? onSelectionHandleTapped,
// param: {void Function(PointerDownEvent)? onTapOutside}
    void Function(
      PointerDownEvent, [
      PointerDownEvent,
    ])?
        onTapOutside,
// param: {List<TextInputFormatter>? inputFormatters}
    List<TextInputFormatter>? inputFormatters,
// param: {MouseCursor? mouseCursor}
    MouseCursor? mouseCursor,
// param: {bool rendererIgnoresPointer = false}
    required bool rendererIgnoresPointer,
// param: {double cursorWidth = 2.0}
    required double cursorWidth,
// param: {double? cursorHeight}
    double? cursorHeight,
// param: {Radius? cursorRadius}
    Radius? cursorRadius,
// param: {bool cursorOpacityAnimates = false}
    required bool cursorOpacityAnimates,
// param: {Offset? cursorOffset}
    Offset? cursorOffset,
// param: {bool paintCursorAboveText = false}
    required bool paintCursorAboveText,
// param: {BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight}
    required BoxHeightStyle selectionHeightStyle,
// param: {BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight}
    required BoxWidthStyle selectionWidthStyle,
// param: {EdgeInsets scrollPadding = const EdgeInsets.all(20.0)}
    required EdgeInsets scrollPadding,
// param: {Brightness keyboardAppearance = Brightness.light}
    required Brightness keyboardAppearance,
// param: {DragStartBehavior dragStartBehavior = DragStartBehavior.start}
    required DragStartBehavior dragStartBehavior,
// param: {bool? enableInteractiveSelection}
    bool? enableInteractiveSelection,
// param: {ScrollController? scrollController}
    ScrollController? scrollController,
// param: {ScrollPhysics? scrollPhysics}
    ScrollPhysics? scrollPhysics,
// param: {Color? autocorrectionTextRectColor}
    Color? autocorrectionTextRectColor,
// param: {ToolbarOptions? toolbarOptions}
    ToolbarOptions? toolbarOptions,
// param: {Iterable<String>? autofillHints = const <String>[]}
    Iterable<String>? autofillHints,
// param: {AutofillClient? autofillClient}
    AutofillClient? autofillClient,
// param: {Clip clipBehavior = Clip.hardEdge}
    required Clip clipBehavior,
// param: {String? restorationId}
    String? restorationId,
// param: {ScrollBehavior? scrollBehavior}
    ScrollBehavior? scrollBehavior,
// param: {bool scribbleEnabled = true}
    required bool scribbleEnabled,
// param: {bool enableIMEPersonalizedLearning = true}
    required bool enableIMEPersonalizedLearning,
// param: {ContentInsertionConfiguration? contentInsertionConfiguration}
    ContentInsertionConfiguration? contentInsertionConfiguration,
// param: {Widget Function(BuildContext, EditableTextState)? contextMenuBuilder}
    Widget Function(
      BuildContext,
      EditableTextState, [
      BuildContext,
      EditableTextState,
    ])?
        contextMenuBuilder,
// param: {SpellCheckConfiguration? spellCheckConfiguration}
    SpellCheckConfiguration? spellCheckConfiguration,
// param: {TextMagnifierConfiguration magnifierConfiguration = TextMagnifierConfiguration.disabled}
    required TextMagnifierConfiguration magnifierConfiguration,
  }) {}
}

/// class EditableTextState extends State<EditableText> with AutomaticKeepAliveClientMixin<EditableText>, WidgetsBindingObserver, TickerProviderStateMixin<EditableText>, TextSelectionDelegate, TextInputClient implements AutofillClient
class EditableTextStateMate {
  /// EditableTextState EditableTextState()
  EditableTextStateMate() {}
}
