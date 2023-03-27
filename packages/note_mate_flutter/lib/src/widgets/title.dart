// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/title.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';

/// class Title extends StatelessWidget
class Title$Mate extends Title with Mate {
  /// Title Title({Key? key, String title = '', required Color color, required Widget child})
  Title$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {String title = ''} , defaultValue:Literal
    String title = '',

    /// optionalParameters: {required Color color} , defaultValue:none
    required Color color,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          title: title,
          color: color,
          child: child,
        ) {
    mateCreateName = 'Title';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => Title$Mate(
          key: p.get('key').build(),
          title: p.get('title').build(),
          color: p.get('color').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('title', title, isNamed: true);
    mateUse('color', color, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}
