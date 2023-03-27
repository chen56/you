// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/selection_area.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/widgets/text_selection.dart';
import 'package:flutter/src/widgets/selectable_region.dart';
import 'package:flutter/src/widgets/magnifier.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/rendering/selection.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class SelectionArea extends StatefulWidget
class SelectionArea$Mate extends SelectionArea with Mate {
  /// SelectionArea SelectionArea({Key? key, FocusNode? focusNode, TextSelectionControls? selectionControls, Widget Function(BuildContext, SelectableRegionState)? contextMenuBuilder = _defaultContextMenuBuilder, TextMagnifierConfiguration? magnifierConfiguration, void Function(SelectedContent?)? onSelectionChanged, required Widget child})
  SelectionArea$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {FocusNode? focusNode} , defaultValue:none
    FocusNode? focusNode,

    /// optionalParameters: {TextSelectionControls? selectionControls} , defaultValue:none
    TextSelectionControls? selectionControls,

    /// optionalParameters: {Widget Function(BuildContext, SelectableRegionState)? contextMenuBuilder = _defaultContextMenuBuilder} , defaultValue:unprocessed
    SelectableRegionContextMenuBuilder? contextMenuBuilder,

    /// optionalParameters: {TextMagnifierConfiguration? magnifierConfiguration} , defaultValue:none
    TextMagnifierConfiguration? magnifierConfiguration,

    /// optionalParameters: {void Function(SelectedContent?)? onSelectionChanged} , defaultValue:none
    ValueChanged<SelectedContent?>? onSelectionChanged,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          focusNode: focusNode,
          selectionControls: selectionControls,
          contextMenuBuilder: contextMenuBuilder,
          magnifierConfiguration: magnifierConfiguration,
          onSelectionChanged: onSelectionChanged,
          child: child,
        ) {
    mateCreateName = 'SelectionArea';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => SelectionArea$Mate(
          key: p.get('key').build(),
          focusNode: p.get('focusNode').build(),
          selectionControls: p.get('selectionControls').build(),
          contextMenuBuilder: p.get('contextMenuBuilder').build(),
          magnifierConfiguration: p.get('magnifierConfiguration').build(),
          onSelectionChanged: p.get('onSelectionChanged').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('focusNode', focusNode, isNamed: true);
    mateUse('selectionControls', selectionControls, isNamed: true);
    mateUse('contextMenuBuilder', contextMenuBuilder, isNamed: true);
    mateUse('magnifierConfiguration', magnifierConfiguration, isNamed: true);
    mateUse('onSelectionChanged', onSelectionChanged, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}
