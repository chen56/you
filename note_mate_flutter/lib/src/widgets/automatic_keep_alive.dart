// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/widgets/automatic_keep_alive.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/change_notifier.dart';

/// class AutomaticKeepAlive extends StatefulWidget
class AutomaticKeepAlive$Mate extends AutomaticKeepAlive with WidgetMate<AutomaticKeepAlive$Mate> {
  /// AutomaticKeepAlive AutomaticKeepAlive({Key? key, required Widget child})
  AutomaticKeepAlive$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {required Widget child}
    required Widget child,
  }) : super(
          key: key,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => AutomaticKeepAlive$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
  }
}

/// class KeepAliveNotification extends Notification
class KeepAliveNotification$Mate extends KeepAliveNotification with Mate<KeepAliveNotification$Mate> {
  /// KeepAliveNotification KeepAliveNotification(Listenable handle)
  KeepAliveNotification$Mate(

      /// param: Listenable handle
      Listenable handle)
      : super(handle) {
    mateParams = Params(
      init: this,
      builder: (p) => KeepAliveNotification$Mate(p.getValue('handle')),
    );
    mateParams.set(name: 'handle', init: handle);
  }
}
