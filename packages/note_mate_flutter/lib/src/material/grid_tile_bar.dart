// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/grid_tile_bar.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';

/// class GridTileBar extends StatelessWidget
class GridTileBar$Mate extends GridTileBar with Mate {
  /// GridTileBar GridTileBar({Key? key, Color? backgroundColor, Widget? leading, Widget? title, Widget? subtitle, Widget? trailing})
  GridTileBar$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {Widget? leading} , defaultValue:none
    Widget? leading,

    /// optionalParameters: {Widget? title} , defaultValue:none
    Widget? title,

    /// optionalParameters: {Widget? subtitle} , defaultValue:none
    Widget? subtitle,

    /// optionalParameters: {Widget? trailing} , defaultValue:none
    Widget? trailing,
  }) : super(
          key: key,
          backgroundColor: backgroundColor,
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
        ) {
    mateCreateName = 'GridTileBar';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => GridTileBar$Mate(
          key: p.get('key').build(),
          backgroundColor: p.get('backgroundColor').build(),
          leading: p.get('leading').build(),
          title: p.get('title').build(),
          subtitle: p.get('subtitle').build(),
          trailing: p.get('trailing').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('leading', leading, isNamed: true);
    mateUse('title', title, isNamed: true);
    mateUse('subtitle', subtitle, isNamed: true);
    mateUse('trailing', trailing, isNamed: true);
  }
}
