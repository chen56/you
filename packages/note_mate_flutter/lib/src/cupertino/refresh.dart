// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/refresh.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';

/// class CupertinoSliverRefreshControl extends StatefulWidget
class CupertinoSliverRefreshControl$Mate extends CupertinoSliverRefreshControl with Mate {
  /// CupertinoSliverRefreshControl CupertinoSliverRefreshControl({Key? key, double refreshTriggerPullDistance = _defaultRefreshTriggerPullDistance, double refreshIndicatorExtent = _defaultRefreshIndicatorExtent, Widget Function(BuildContext, RefreshIndicatorMode, double, double, double)? builder = buildRefreshIndicator, Future<void> Function()? onRefresh})
  CupertinoSliverRefreshControl$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {double refreshTriggerPullDistance = _defaultRefreshTriggerPullDistance} , defaultValue:unprocessed
    required double refreshTriggerPullDistance,

    /// optionalParameters: {double refreshIndicatorExtent = _defaultRefreshIndicatorExtent} , defaultValue:unprocessed
    required double refreshIndicatorExtent,

    /// optionalParameters: {Widget Function(BuildContext, RefreshIndicatorMode, double, double, double)? builder = buildRefreshIndicator} , defaultValue:unprocessed
    RefreshControlIndicatorBuilder? builder,

    /// optionalParameters: {Future<void> Function()? onRefresh} , defaultValue:none
    RefreshCallback? onRefresh,
  }) : super(
          key: key,
          refreshTriggerPullDistance: refreshTriggerPullDistance,
          refreshIndicatorExtent: refreshIndicatorExtent,
          builder: builder,
          onRefresh: onRefresh,
        ) {
    mateCreateName = 'CupertinoSliverRefreshControl';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoSliverRefreshControl$Mate(
          key: p.get('key').build(),
          refreshTriggerPullDistance: p.get('refreshTriggerPullDistance').build(),
          refreshIndicatorExtent: p.get('refreshIndicatorExtent').build(),
          builder: p.get('builder').build(),
          onRefresh: p.get('onRefresh').build(),
        );
    mateUse('key', key);
    mateUse('refreshTriggerPullDistance', refreshTriggerPullDistance);
    mateUse('refreshIndicatorExtent', refreshIndicatorExtent);
    mateUse('builder', builder);
    mateUse('onRefresh', onRefresh);
  }
}
