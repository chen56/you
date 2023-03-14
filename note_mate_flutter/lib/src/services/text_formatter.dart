// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/services/text_formatter.dart';
import 'dart:core';
import 'package:note/mate.dart';

/// class FilteringTextInputFormatter extends TextInputFormatter
class FilteringTextInputFormatter$Mate extends FilteringTextInputFormatter with Mate<FilteringTextInputFormatter$Mate> {
  /// FilteringTextInputFormatter FilteringTextInputFormatter(Pattern filterPattern, {required bool allow, String replacementString = ''})
  FilteringTextInputFormatter$Mate(
    /// requiredParameters: Pattern filterPattern
    Pattern filterPattern, {
    /// optionalParameters: {required bool allow} , hasDefaultValue:false, defaultValueCode:null
    required bool allow,

    /// optionalParameters: {String replacementString = ''} , hasDefaultValue:true, defaultValueCode:''
    required String replacementString,
  }) : super(
          filterPattern,
          allow: allow,
          replacementString: replacementString,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => FilteringTextInputFormatter$Mate(
        p.getValue('filterPattern'),
        allow: p.getValue('allow'),
        replacementString: p.getValue('replacementString'),
      ),
    );
    mateParams.set(name: 'filterPattern', init: filterPattern);
    mateParams.set(name: 'allow', init: allow);
    mateParams.set(name: 'replacementString', init: replacementString);
  }

  /// FilteringTextInputFormatter FilteringTextInputFormatter.allow(Pattern filterPattern, {String replacementString = ''})
  FilteringTextInputFormatter$Mate.allow(
    /// requiredParameters: Pattern filterPattern
    Pattern filterPattern, {
    /// optionalParameters: {String replacementString = ''} , hasDefaultValue:true, defaultValueCode:''
    required String replacementString,
  }) : super.allow(
          filterPattern,
          replacementString: replacementString,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => FilteringTextInputFormatter$Mate.allow(
        p.getValue('filterPattern'),
        replacementString: p.getValue('replacementString'),
      ),
    );
    mateParams.set(name: 'filterPattern', init: filterPattern);
    mateParams.set(name: 'replacementString', init: replacementString);
  }

  /// FilteringTextInputFormatter FilteringTextInputFormatter.deny(Pattern filterPattern, {String replacementString = ''})
  FilteringTextInputFormatter$Mate.deny(
    /// requiredParameters: Pattern filterPattern
    Pattern filterPattern, {
    /// optionalParameters: {String replacementString = ''} , hasDefaultValue:true, defaultValueCode:''
    required String replacementString,
  }) : super.deny(
          filterPattern,
          replacementString: replacementString,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => FilteringTextInputFormatter$Mate.deny(
        p.getValue('filterPattern'),
        replacementString: p.getValue('replacementString'),
      ),
    );
    mateParams.set(name: 'filterPattern', init: filterPattern);
    mateParams.set(name: 'replacementString', init: replacementString);
  }
}

/// class LengthLimitingTextInputFormatter extends TextInputFormatter
class LengthLimitingTextInputFormatter$Mate extends LengthLimitingTextInputFormatter
    with Mate<LengthLimitingTextInputFormatter$Mate> {
  /// LengthLimitingTextInputFormatter LengthLimitingTextInputFormatter(int? maxLength, {MaxLengthEnforcement? maxLengthEnforcement})
  LengthLimitingTextInputFormatter$Mate(
    /// requiredParameters: int? maxLength
    int? maxLength, {
    /// optionalParameters: {MaxLengthEnforcement? maxLengthEnforcement} , hasDefaultValue:false, defaultValueCode:null
    MaxLengthEnforcement? maxLengthEnforcement,
  }) : super(
          maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => LengthLimitingTextInputFormatter$Mate(
        p.getValue('maxLength'),
        maxLengthEnforcement: p.getValue('maxLengthEnforcement'),
      ),
    );
    mateParams.set(name: 'maxLength', init: maxLength);
    mateParams.set(name: 'maxLengthEnforcement', init: maxLengthEnforcement);
  }
}
