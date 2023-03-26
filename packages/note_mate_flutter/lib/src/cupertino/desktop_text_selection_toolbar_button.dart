// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/desktop_text_selection_toolbar_button.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';
import 'package:flutter/src/widgets/context_menu_button_item.dart';

/// class CupertinoDesktopTextSelectionToolbarButton extends StatefulWidget
class CupertinoDesktopTextSelectionToolbarButton$Mate extends CupertinoDesktopTextSelectionToolbarButton with Mate {
  /// CupertinoDesktopTextSelectionToolbarButton CupertinoDesktopTextSelectionToolbarButton({Key? key, required void Function() onPressed, required Widget child})
  CupertinoDesktopTextSelectionToolbarButton$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required void Function() onPressed} , defaultValue:none
    required VoidCallback onPressed,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: child,
        ) {
    mateCreateName = 'CupertinoDesktopTextSelectionToolbarButton';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoDesktopTextSelectionToolbarButton$Mate(
          key: p.get('key').build(),
          onPressed: p.get('onPressed').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key);
    mateUse('onPressed', onPressed);
    mateUse('child', child);
  }

  /// CupertinoDesktopTextSelectionToolbarButton CupertinoDesktopTextSelectionToolbarButton.text({Key? key, required BuildContext context, required void Function() onPressed, required String text})
  CupertinoDesktopTextSelectionToolbarButton$Mate.text({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required BuildContext context} , defaultValue:none
    required BuildContext context,

    /// optionalParameters: {required void Function() onPressed} , defaultValue:none
    required VoidCallback onPressed,

    /// optionalParameters: {required String text} , defaultValue:none
    required String text,
  }) : super.text(
          key: key,
          context: context,
          onPressed: onPressed,
          text: text,
        ) {
    mateCreateName = 'CupertinoDesktopTextSelectionToolbarButton.text';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoDesktopTextSelectionToolbarButton$Mate.text(
          key: p.get('key').build(),
          context: p.get('context').build(),
          onPressed: p.get('onPressed').build(),
          text: p.get('text').build(),
        );
    mateUse('key', key);
    mateUse('context', context);
    mateUse('onPressed', onPressed);
    mateUse('text', text);
  }

  /// CupertinoDesktopTextSelectionToolbarButton CupertinoDesktopTextSelectionToolbarButton.buttonItem({Key? key, required ContextMenuButtonItem buttonItem})
  CupertinoDesktopTextSelectionToolbarButton$Mate.buttonItem({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required ContextMenuButtonItem buttonItem} , defaultValue:none
    required ContextMenuButtonItem buttonItem,
  }) : super.buttonItem(
          key: key,
          buttonItem: buttonItem,
        ) {
    mateCreateName = 'CupertinoDesktopTextSelectionToolbarButton.buttonItem';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoDesktopTextSelectionToolbarButton$Mate.buttonItem(
          key: p.get('key').build(),
          buttonItem: p.get('buttonItem').build(),
        );
    mateUse('key', key);
    mateUse('buttonItem', buttonItem);
  }
}
