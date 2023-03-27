// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/form.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'dart:ui';
import 'dart:core';

/// class Form extends StatefulWidget
class Form$Mate extends Form with Mate {
  /// Form Form({Key? key, required Widget child, Future<bool> Function()? onWillPop, void Function()? onChanged, AutovalidateMode? autovalidateMode})
  Form$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {Future<bool> Function()? onWillPop} , defaultValue:none
    WillPopCallback? onWillPop,

    /// optionalParameters: {void Function()? onChanged} , defaultValue:none
    VoidCallback? onChanged,

    /// optionalParameters: {AutovalidateMode? autovalidateMode} , defaultValue:none
    AutovalidateMode? autovalidateMode,
  }) : super(
          key: key,
          child: child,
          onWillPop: onWillPop,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
        ) {
    mateCreateName = 'Form';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => Form$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          onWillPop: p.get('onWillPop').build(),
          onChanged: p.get('onChanged').build(),
          autovalidateMode: p.get('autovalidateMode').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('child', child, isNamed: true);
    mateUse('onWillPop', onWillPop, isNamed: true);
    mateUse('onChanged', onChanged, isNamed: true);
    mateUse('autovalidateMode', autovalidateMode, isNamed: true);
  }
}

/// class FormField<T> extends StatefulWidget
class FormField$Mate<T> extends FormField<T> with Mate {
  /// FormField<T> FormField({Key? key, required Widget Function(FormFieldState<T>) builder, void Function(T?)? onSaved, String? Function(T?)? validator, T? initialValue, bool enabled = true, AutovalidateMode? autovalidateMode, String? restorationId})
  FormField$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget Function(FormFieldState<T>) builder} , defaultValue:none
    required FormFieldBuilder<T> builder,

    /// optionalParameters: {void Function(T?)? onSaved} , defaultValue:none
    FormFieldSetter<T>? onSaved,

    /// optionalParameters: {String? Function(T?)? validator} , defaultValue:none
    FormFieldValidator<T>? validator,

    /// optionalParameters: {T? initialValue} , defaultValue:none
    T? initialValue,

    /// optionalParameters: {bool enabled = true} , defaultValue:Literal
    bool enabled = true,

    /// optionalParameters: {AutovalidateMode? autovalidateMode} , defaultValue:none
    AutovalidateMode? autovalidateMode,

    /// optionalParameters: {String? restorationId} , defaultValue:none
    String? restorationId,
  }) : super(
          key: key,
          builder: builder,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          enabled: enabled,
          autovalidateMode: autovalidateMode,
          restorationId: restorationId,
        ) {
    mateCreateName = 'FormField';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => FormField$Mate<T>(
          key: p.get('key').build(),
          builder: p.get('builder').build(),
          onSaved: p.get('onSaved').build(),
          validator: p.get('validator').build(),
          initialValue: p.get('initialValue').build(),
          enabled: p.get('enabled').build(),
          autovalidateMode: p.get('autovalidateMode').build(),
          restorationId: p.get('restorationId').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('builder', builder, isNamed: true);
    mateUse('onSaved', onSaved, isNamed: true);
    mateUse('validator', validator, isNamed: true);
    mateUse('initialValue', initialValue, isNamed: true);
    mateUse('enabled', enabled, isNamed: true);
    mateUse('autovalidateMode', autovalidateMode, isNamed: true);
    mateUse('restorationId', restorationId, isNamed: true);
  }
}
