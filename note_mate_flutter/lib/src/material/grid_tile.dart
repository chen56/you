// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/material/grid_tile.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class GridTile extends StatelessWidget
class GridTile$Mate extends GridTile with WidgetMate<GridTile$Mate> {
  /// GridTile GridTile({Key? key, Widget? header, Widget? footer, required Widget child})
  GridTile$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {Widget? header}
    Widget? header,

    /// param: {Widget? footer}
    Widget? footer,

    /// param: {required Widget child}
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