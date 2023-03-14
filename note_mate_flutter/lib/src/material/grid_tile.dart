// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/grid_tile.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class GridTile extends StatelessWidget
class GridTile$Mate extends GridTile with WidgetMate<GridTile$Mate> {
  /// GridTile GridTile({Key? key, Widget? header, Widget? footer, required Widget child})
  GridTile$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {Widget? header} , hasDefaultValue:false, defaultValueCode:null
    Widget? header,

    /// optionalParameters: {Widget? footer} , hasDefaultValue:false, defaultValueCode:null
    Widget? footer,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          header: header,
          footer: footer,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => GridTile$Mate(
        key: p.getValue('key'),
        header: p.getValue('header'),
        footer: p.getValue('footer'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'header', init: header);
    mateParams.set(name: 'footer', init: footer);
    mateParams.set(name: 'child', init: child);
  }
}
