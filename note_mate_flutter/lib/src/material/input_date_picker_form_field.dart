// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/input_date_picker_form_field.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/material/date.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:note/mate.dart';

/// class InputDatePickerFormField extends StatefulWidget
class InputDatePickerFormField$Mate extends InputDatePickerFormField with WidgetMate<InputDatePickerFormField$Mate> {
  /// InputDatePickerFormField InputDatePickerFormField({Key? key, DateTime? initialDate, required DateTime firstDate, required DateTime lastDate, void Function(DateTime)? onDateSubmitted, void Function(DateTime)? onDateSaved, bool Function(DateTime)? selectableDayPredicate, String? errorFormatText, String? errorInvalidText, String? fieldHintText, String? fieldLabelText, TextInputType? keyboardType, bool autofocus = false})
  InputDatePickerFormField$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {DateTime? initialDate} , hasDefaultValue:false, defaultValueCode:null
    DateTime? initialDate,

    /// optionalParameters: {required DateTime firstDate} , hasDefaultValue:false, defaultValueCode:null
    required DateTime firstDate,

    /// optionalParameters: {required DateTime lastDate} , hasDefaultValue:false, defaultValueCode:null
    required DateTime lastDate,

    /// optionalParameters: {void Function(DateTime)? onDateSubmitted} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<DateTime>? onDateSubmitted,

    /// optionalParameters: {void Function(DateTime)? onDateSaved} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<DateTime>? onDateSaved,

    /// optionalParameters: {bool Function(DateTime)? selectableDayPredicate} , hasDefaultValue:false, defaultValueCode:null
    SelectableDayPredicate? selectableDayPredicate,

    /// optionalParameters: {String? errorFormatText} , hasDefaultValue:false, defaultValueCode:null
    String? errorFormatText,

    /// optionalParameters: {String? errorInvalidText} , hasDefaultValue:false, defaultValueCode:null
    String? errorInvalidText,

    /// optionalParameters: {String? fieldHintText} , hasDefaultValue:false, defaultValueCode:null
    String? fieldHintText,

    /// optionalParameters: {String? fieldLabelText} , hasDefaultValue:false, defaultValueCode:null
    String? fieldLabelText,

    /// optionalParameters: {TextInputType? keyboardType} , hasDefaultValue:false, defaultValueCode:null
    TextInputType? keyboardType,

    /// optionalParameters: {bool autofocus = false} , hasDefaultValue:true, defaultValueCode:false
    required bool autofocus,
  }) : super(
          key: key,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          onDateSubmitted: onDateSubmitted,
          onDateSaved: onDateSaved,
          selectableDayPredicate: selectableDayPredicate,
          errorFormatText: errorFormatText,
          errorInvalidText: errorInvalidText,
          fieldHintText: fieldHintText,
          fieldLabelText: fieldLabelText,
          keyboardType: keyboardType,
          autofocus: autofocus,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => InputDatePickerFormField$Mate(
        key: p.getValue('key'),
        initialDate: p.getValue('initialDate'),
        firstDate: p.getValue('firstDate'),
        lastDate: p.getValue('lastDate'),
        onDateSubmitted: p.getValue('onDateSubmitted'),
        onDateSaved: p.getValue('onDateSaved'),
        selectableDayPredicate: p.getValue('selectableDayPredicate'),
        errorFormatText: p.getValue('errorFormatText'),
        errorInvalidText: p.getValue('errorInvalidText'),
        fieldHintText: p.getValue('fieldHintText'),
        fieldLabelText: p.getValue('fieldLabelText'),
        keyboardType: p.getValue('keyboardType'),
        autofocus: p.getValue('autofocus'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'initialDate', init: initialDate);
    mateParams.set(name: 'firstDate', init: firstDate);
    mateParams.set(name: 'lastDate', init: lastDate);
    mateParams.set(name: 'onDateSubmitted', init: onDateSubmitted);
    mateParams.set(name: 'onDateSaved', init: onDateSaved);
    mateParams.set(name: 'selectableDayPredicate', init: selectableDayPredicate);
    mateParams.set(name: 'errorFormatText', init: errorFormatText);
    mateParams.set(name: 'errorInvalidText', init: errorInvalidText);
    mateParams.set(name: 'fieldHintText', init: fieldHintText);
    mateParams.set(name: 'fieldLabelText', init: fieldLabelText);
    mateParams.set(name: 'keyboardType', init: keyboardType);
    mateParams.set(name: 'autofocus', init: autofocus);
  }
}
