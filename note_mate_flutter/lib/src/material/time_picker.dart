// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/material/time_picker.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/material/time.dart';
import 'dart:core';
import 'package:flutter/src/widgets/media_query.dart';
import 'package:note/mate.dart';

/// class TimePickerDialog extends StatefulWidget
class TimePickerDialog$Mate extends TimePickerDialog with WidgetMate<TimePickerDialog$Mate> {
  /// TimePickerDialog TimePickerDialog({Key? key, required TimeOfDay initialTime, String? cancelText, String? confirmText, String? helpText, String? errorInvalidText, String? hourLabelText, String? minuteLabelText, String? restorationId, TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial, Orientation? orientation, void Function(TimePickerEntryMode)? onEntryModeChanged})
  TimePickerDialog$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required TimeOfDay initialTime}
    required TimeOfDay initialTime,

    /// param: {String? cancelText}
    String? cancelText,

    /// param: {String? confirmText}
    String? confirmText,

    /// param: {String? helpText}
    String? helpText,

    /// param: {String? errorInvalidText}
    String? errorInvalidText,

    /// param: {String? hourLabelText}
    String? hourLabelText,

    /// param: {String? minuteLabelText}
    String? minuteLabelText,

    /// param: {String? restorationId}
    String? restorationId,

    /// param: {TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial}
    required TimePickerEntryMode initialEntryMode,

    /// param: {Orientation? orientation}
    Orientation? orientation,

    /// param: {void Function(TimePickerEntryMode)? onEntryModeChanged}
    EntryModeChangeCallback? onEntryModeChanged,
  }) : super(
          key: key,
          initialTime: initialTime,
          cancelText: cancelText,
          confirmText: confirmText,
          helpText: helpText,
          errorInvalidText: errorInvalidText,
          hourLabelText: hourLabelText,
          minuteLabelText: minuteLabelText,
          restorationId: restorationId,
          initialEntryMode: initialEntryMode,
          orientation: orientation,
          onEntryModeChanged: onEntryModeChanged,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => TimePickerDialog$Mate(
        key: p.getValue('key'),
        initialTime: p.getValue('initialTime'),
        cancelText: p.getValue('cancelText'),
        confirmText: p.getValue('confirmText'),
        helpText: p.getValue('helpText'),
        errorInvalidText: p.getValue('errorInvalidText'),
        hourLabelText: p.getValue('hourLabelText'),
        minuteLabelText: p.getValue('minuteLabelText'),
        restorationId: p.getValue('restorationId'),
        initialEntryMode: p.getValue('initialEntryMode'),
        orientation: p.getValue('orientation'),
        onEntryModeChanged: p.getValue('onEntryModeChanged'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'initialTime', init: initialTime);
    mateParams.set(name: 'cancelText', init: cancelText);
    mateParams.set(name: 'confirmText', init: confirmText);
    mateParams.set(name: 'helpText', init: helpText);
    mateParams.set(name: 'errorInvalidText', init: errorInvalidText);
    mateParams.set(name: 'hourLabelText', init: hourLabelText);
    mateParams.set(name: 'minuteLabelText', init: minuteLabelText);
    mateParams.set(name: 'restorationId', init: restorationId);
    mateParams.set(name: 'initialEntryMode', init: initialEntryMode);
    mateParams.set(name: 'orientation', init: orientation);
    mateParams.set(name: 'onEntryModeChanged', init: onEntryModeChanged);
  }
}