// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/view.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class View extends StatelessWidget
class View$Mate extends View with WidgetMate<View$Mate> {
  /// View View({required FlutterView view, required Widget child})
  View$Mate({
    /// optionalParameters: {required FlutterView view} , hasDefaultValue:false, defaultValueCode:null
    required FlutterView view,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          view: view,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => View$Mate(
        view: p.getValue('view'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'view', init: view);
    mateParams.set(name: 'child', init: child);
  }
}
