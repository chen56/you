// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/widgets/automatic_keep_alive.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/foundation/key.dart' as _i3;
import 'package:flutter/src/widgets/framework.dart' as _i4;
import 'package:flutter/src/foundation/change_notifier.dart' as _i5;

/// class AutomaticKeepAlive extends StatefulWidget
class AutomaticKeepAlive$Mate extends _i1.AutomaticKeepAlive with _i2.Mate {
  /// AutomaticKeepAlive AutomaticKeepAlive({Key? key, required Widget child})
  AutomaticKeepAlive$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {required Widget child} , default:none
    required super.child,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i3.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'child': _i2.BuilderArg<_i4.Widget>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'AutomaticKeepAlive';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => AutomaticKeepAlive$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class KeepAliveNotification extends Notification
class KeepAliveNotification$Mate extends _i1.KeepAliveNotification
    with _i2.Mate {
  /// KeepAliveNotification KeepAliveNotification(Listenable handle)
  KeepAliveNotification$Mate(

      /// requiredParameters: Listenable handle
      super.handle)
      : mateParams = {
          'handle': _i2.BuilderArg<_i5.Listenable>(
            name: 'handle',
            init: handle,
            isNamed: false,
          )
        },
        super() {
    mateBuilderName = 'KeepAliveNotification';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => KeepAliveNotification$Mate(p.get('handle').value);
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}