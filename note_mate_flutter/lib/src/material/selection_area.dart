// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/selection_area.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/widgets/text_selection.dart';
import 'package:flutter/src/widgets/selectable_region.dart';
import 'package:flutter/src/widgets/magnifier.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/rendering/selection.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class SelectionArea extends StatefulWidget
class SelectionArea$Mate extends SelectionArea with WidgetMate<SelectionArea$Mate> {
  /// SelectionArea SelectionArea({Key? key, FocusNode? focusNode, TextSelectionControls? selectionControls, Widget Function(BuildContext, SelectableRegionState)? contextMenuBuilder = _defaultContextMenuBuilder, TextMagnifierConfiguration? magnifierConfiguration, void Function(SelectedContent?)? onSelectionChanged, required Widget child})
  SelectionArea$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {FocusNode? focusNode} , hasDefaultValue:false, defaultValueCode:null
    FocusNode? focusNode,

    /// optionalParameters: {TextSelectionControls? selectionControls} , hasDefaultValue:false, defaultValueCode:null
    TextSelectionControls? selectionControls,

    /// optionalParameters: {Widget Function(BuildContext, SelectableRegionState)? contextMenuBuilder = _defaultContextMenuBuilder} , hasDefaultValue:true, defaultValueCode:_defaultContextMenuBuilder
    SelectableRegionContextMenuBuilder? contextMenuBuilder,

    /// optionalParameters: {TextMagnifierConfiguration? magnifierConfiguration} , hasDefaultValue:false, defaultValueCode:null
    TextMagnifierConfiguration? magnifierConfiguration,

    /// optionalParameters: {void Function(SelectedContent?)? onSelectionChanged} , hasDefaultValue:false, defaultValueCode:null
    ValueChanged<SelectedContent?>? onSelectionChanged,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
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
    mateParams = Params(
      init: this,
      builder: (p) => SelectionArea$Mate(
        key: p.getValue('key'),
        focusNode: p.getValue('focusNode'),
        selectionControls: p.getValue('selectionControls'),
        contextMenuBuilder: p.getValue('contextMenuBuilder'),
        magnifierConfiguration: p.getValue('magnifierConfiguration'),
        onSelectionChanged: p.getValue('onSelectionChanged'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'focusNode', init: focusNode);
    mateParams.set(name: 'selectionControls', init: selectionControls);
    mateParams.set(name: 'contextMenuBuilder', init: contextMenuBuilder);
    mateParams.set(name: 'magnifierConfiguration', init: magnifierConfiguration);
    mateParams.set(name: 'onSelectionChanged', init: onSelectionChanged);
    mateParams.set(name: 'child', init: child);
  }
}
