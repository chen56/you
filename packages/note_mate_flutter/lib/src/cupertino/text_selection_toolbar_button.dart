// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/text_selection_toolbar_button.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';
import 'package:flutter/src/widgets/context_menu_button_item.dart';

/// class CupertinoTextSelectionToolbarButton extends StatelessWidget
class CupertinoTextSelectionToolbarButton$Mate extends CupertinoTextSelectionToolbarButton with Mate {
  /// CupertinoTextSelectionToolbarButton CupertinoTextSelectionToolbarButton({Key? key, void Function()? onPressed, required Widget child})
  CupertinoTextSelectionToolbarButton$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {void Function()? onPressed} , defaultValue:none
    VoidCallback? onPressed,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
        ) {
    mateCreateName = 'CupertinoTextSelectionToolbarButton';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoTextSelectionToolbarButton$Mate(
          key: p.get('key').build(),
          onPressed: p.get('onPressed').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key);
    mateUse('onPressed', onPressed);
    mateUse('child', child);
  }

  /// CupertinoTextSelectionToolbarButton CupertinoTextSelectionToolbarButton.text({Key? key, void Function()? onPressed, required String? text})
  CupertinoTextSelectionToolbarButton$Mate.text({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {void Function()? onPressed} , defaultValue:none
    VoidCallback? onPressed,

    /// optionalParameters: {required String? text} , defaultValue:none
    required String? text,
  }) : super.text(
          key: key,
          onPressed: onPressed,
          text: text,
        ) {
    mateCreateName = 'CupertinoTextSelectionToolbarButton.text';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoTextSelectionToolbarButton$Mate.text(
          key: p.get('key').build(),
          onPressed: p.get('onPressed').build(),
          text: p.get('text').build(),
        );
    mateUse('key', key);
    mateUse('onPressed', onPressed);
    mateUse('text', text);
  }

  /// CupertinoTextSelectionToolbarButton CupertinoTextSelectionToolbarButton.buttonItem({Key? key, required ContextMenuButtonItem buttonItem})
  CupertinoTextSelectionToolbarButton$Mate.buttonItem({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required ContextMenuButtonItem buttonItem} , defaultValue:none
    required ContextMenuButtonItem buttonItem,
  }) : super.buttonItem(
          key: key,
          buttonItem: buttonItem,
        ) {
    mateCreateName = 'CupertinoTextSelectionToolbarButton.buttonItem';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoTextSelectionToolbarButton$Mate.buttonItem(
          key: p.get('key').build(),
          buttonItem: p.get('buttonItem').build(),
        );
    mateUse('key', key);
    mateUse('buttonItem', buttonItem);
  }
}
