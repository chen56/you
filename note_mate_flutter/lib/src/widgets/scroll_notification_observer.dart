// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/scroll_notification_observer.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class ScrollNotificationObserver extends StatefulWidget
class ScrollNotificationObserver$Mate extends ScrollNotificationObserver
    with WidgetMate<ScrollNotificationObserver$Mate> {
  /// ScrollNotificationObserver ScrollNotificationObserver({Key? key, required Widget child})
  ScrollNotificationObserver$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ScrollNotificationObserver$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
  }
}
