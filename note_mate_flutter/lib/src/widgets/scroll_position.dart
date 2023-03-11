// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/widgets/scroll_position.dart';
import 'package:flutter/src/widgets/scroll_metrics.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';
export 'scroll_activity.dart' show ScrollHoldController;

/// class ScrollMetricsNotification extends Notification with ViewportNotificationMixin
class ScrollMetricsNotification$Mate extends ScrollMetricsNotification with Mate<ScrollMetricsNotification$Mate> {
  /// ScrollMetricsNotification ScrollMetricsNotification({required ScrollMetrics metrics, required BuildContext context})
  ScrollMetricsNotification$Mate({
    /// param: {required ScrollMetrics metrics}
    required ScrollMetrics metrics,

    /// param: {required BuildContext context}
    required BuildContext context,
  }) : super(
          metrics: metrics,
          context: context,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ScrollMetricsNotification$Mate(
        metrics: p.getValue('metrics'),
        context: p.getValue('context'),
      ),
    );
    mateParams.set(name: 'metrics', init: metrics);
    mateParams.set(name: 'context', init: context);
  }
}
