// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/size_changed_layout_notifier.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// class SizeChangedLayoutNotifier extends SingleChildRenderObjectWidget
class SizeChangedLayoutNotifier$Mate extends SizeChangedLayoutNotifier with Mate {
  /// SizeChangedLayoutNotifier SizeChangedLayoutNotifier({Key? key, Widget? child})
  SizeChangedLayoutNotifier$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Widget? child} , hasDefaultValue:false, defaultValueCode:null
    Widget? child,
  }) : super(
          key: key,
          child: child,
        ) {
    mateBuilder = (p) => SizeChangedLayoutNotifier$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
        );
    matePut('key', key);
    matePut('child', child);
  }
}