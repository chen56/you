// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';

/// class PreferredSize extends StatelessWidget implements PreferredSizeWidget
class PreferredSize$Mate extends PreferredSize with Mate {
  /// PreferredSize PreferredSize({Key? key, required Widget child, required Size preferredSize})
  PreferredSize$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {required Size preferredSize} , defaultValue:none
    required Size preferredSize,
  }) : super(
          key: key,
          child: child,
          preferredSize: preferredSize,
        ) {
    mateCreateName = 'PreferredSize';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => PreferredSize$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          preferredSize: p.get('preferredSize').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('child', child, isNamed: true);
    mateUse('preferredSize', preferredSize, isNamed: true);
  }
}
