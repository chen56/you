// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/notification_listener.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class NotificationListener<T extends Notification> extends ProxyWidget
class NotificationListener$Mate<T extends Notification> extends NotificationListener<T>
    with WidgetMate<NotificationListener$Mate> {
  /// NotificationListener<T> NotificationListener({Key? key, required Widget child, bool Function(T)? onNotification})
  NotificationListener$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,

    /// optionalParameters: {bool Function(T)? onNotification} , hasDefaultValue:false, defaultValueCode:null
    NotificationListenerCallback<T>? onNotification,
  }) : super(
          key: key,
          child: child,
          onNotification: onNotification,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => NotificationListener$Mate(
        key: p.getValue('key'),
        child: p.getValue('child'),
        onNotification: p.getValue('onNotification'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'child', init: child);
    mateParams.set(name: 'onNotification', init: onNotification);
  }
}
