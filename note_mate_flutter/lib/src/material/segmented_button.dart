// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/segmented_button.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/material/button_style.dart';

/// class ButtonSegment<T>
class ButtonSegment$Mate<T> extends ButtonSegment<T> with Mate<ButtonSegment$Mate> {
  /// ButtonSegment<T> ButtonSegment({required T value, Widget? icon, Widget? label, bool enabled = true})
  ButtonSegment$Mate({
    /// optionalParameters: {required T value} , hasDefaultValue:false, defaultValueCode:null
    required T value,

    /// optionalParameters: {Widget? icon} , hasDefaultValue:false, defaultValueCode:null
    Widget? icon,

    /// optionalParameters: {Widget? label} , hasDefaultValue:false, defaultValueCode:null
    Widget? label,

    /// optionalParameters: {bool enabled = true} , hasDefaultValue:true, defaultValueCode:true
    required bool enabled,
  }) : super(
          value: value,
          icon: icon,
          label: label,
          enabled: enabled,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => ButtonSegment$Mate(
        value: p.get('value').value,
        icon: p.get('icon').value,
        label: p.get('label').value,
        enabled: p.get('enabled').value,
      ),
    );
    mateParams.put('value', value);
    mateParams.put('icon', icon);
    mateParams.put('label', label);
    mateParams.put('enabled', enabled);
  }
}

/// class SegmentedButton<T> extends StatelessWidget
class SegmentedButton$Mate<T> extends SegmentedButton<T> with WidgetMate<SegmentedButton$Mate> {
  /// SegmentedButton<T> SegmentedButton({Key? key, required List<ButtonSegment<T>> segments, required Set<T> selected, void Function(Set<T>)? onSelectionChanged, bool multiSelectionEnabled = false, bool emptySelectionAllowed = false, ButtonStyle? style, bool showSelectedIcon = true, Widget? selectedIcon})
  SegmentedButton$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required List<ButtonSegment<T>> segments} , hasDefaultValue:false, defaultValueCode:null
    required List<ButtonSegment<T>> segments,

    /// optionalParameters: {required Set<T> selected} , hasDefaultValue:false, defaultValueCode:null
    required Set<T> selected,

    /// optionalParameters: {void Function(Set<T>)? onSelectionChanged} , hasDefaultValue:false, defaultValueCode:null
    void Function(Set<T>)? onSelectionChanged,

    /// optionalParameters: {bool multiSelectionEnabled = false} , hasDefaultValue:true, defaultValueCode:false
    required bool multiSelectionEnabled,

    /// optionalParameters: {bool emptySelectionAllowed = false} , hasDefaultValue:true, defaultValueCode:false
    required bool emptySelectionAllowed,

    /// optionalParameters: {ButtonStyle? style} , hasDefaultValue:false, defaultValueCode:null
    ButtonStyle? style,

    /// optionalParameters: {bool showSelectedIcon = true} , hasDefaultValue:true, defaultValueCode:true
    required bool showSelectedIcon,

    /// optionalParameters: {Widget? selectedIcon} , hasDefaultValue:false, defaultValueCode:null
    Widget? selectedIcon,
  }) : super(
          key: key,
          segments: segments,
          selected: selected,
          onSelectionChanged: onSelectionChanged,
          multiSelectionEnabled: multiSelectionEnabled,
          emptySelectionAllowed: emptySelectionAllowed,
          style: style,
          showSelectedIcon: showSelectedIcon,
          selectedIcon: selectedIcon,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => SegmentedButton$Mate(
        key: p.get('key').value,
        segments: p.get('segments').value,
        selected: p.get('selected').value,
        onSelectionChanged: p.get('onSelectionChanged').value,
        multiSelectionEnabled: p.get('multiSelectionEnabled').value,
        emptySelectionAllowed: p.get('emptySelectionAllowed').value,
        style: p.get('style').value,
        showSelectedIcon: p.get('showSelectedIcon').value,
        selectedIcon: p.get('selectedIcon').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.putList('segments', segments);
    mateParams.put('selected', selected);
    mateParams.put('onSelectionChanged', onSelectionChanged);
    mateParams.put('multiSelectionEnabled', multiSelectionEnabled);
    mateParams.put('emptySelectionAllowed', emptySelectionAllowed);
    mateParams.put('style', style);
    mateParams.put('showSelectedIcon', showSelectedIcon);
    mateParams.put('selectedIcon', selectedIcon);
  }
}
