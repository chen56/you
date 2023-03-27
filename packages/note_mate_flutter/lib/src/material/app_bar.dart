// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/app_bar.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter/src/widgets/scroll_notification.dart';
import 'dart:ui';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/widgets/icon_theme_data.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/services/system_chrome.dart';
import 'package:flutter/src/foundation/basic_types.dart';

/// class AppBar extends StatefulWidget implements PreferredSizeWidget
class AppBar$Mate extends AppBar with Mate {
  /// AppBar AppBar({Key? key, Widget? leading, bool automaticallyImplyLeading = true, Widget? title, List<Widget>? actions, Widget? flexibleSpace, PreferredSizeWidget? bottom, double? elevation, double? scrolledUnderElevation, bool Function(ScrollNotification) notificationPredicate = defaultScrollNotificationPredicate, Color? shadowColor, Color? surfaceTintColor, ShapeBorder? shape, Color? backgroundColor, Color? foregroundColor, IconThemeData? iconTheme, IconThemeData? actionsIconTheme, bool primary = true, bool? centerTitle, bool excludeHeaderSemantics = false, double? titleSpacing, double toolbarOpacity = 1.0, double bottomOpacity = 1.0, double? toolbarHeight, double? leadingWidth, TextStyle? toolbarTextStyle, TextStyle? titleTextStyle, SystemUiOverlayStyle? systemOverlayStyle, bool forceMaterialTransparency = false})
  AppBar$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Widget? leading} , defaultValue:none
    Widget? leading,

    /// optionalParameters: {bool automaticallyImplyLeading = true} , defaultValue:Literal
    bool automaticallyImplyLeading = true,

    /// optionalParameters: {Widget? title} , defaultValue:none
    Widget? title,

    /// optionalParameters: {List<Widget>? actions} , defaultValue:none
    List<Widget>? actions,

    /// optionalParameters: {Widget? flexibleSpace} , defaultValue:none
    Widget? flexibleSpace,

    /// optionalParameters: {PreferredSizeWidget? bottom} , defaultValue:none
    PreferredSizeWidget? bottom,

    /// optionalParameters: {double? elevation} , defaultValue:none
    double? elevation,

    /// optionalParameters: {double? scrolledUnderElevation} , defaultValue:none
    double? scrolledUnderElevation,

    /// optionalParameters: {bool Function(ScrollNotification) notificationPredicate = defaultScrollNotificationPredicate} , defaultValue:unprocessed
    required ScrollNotificationPredicate notificationPredicate,

    /// optionalParameters: {Color? shadowColor} , defaultValue:none
    Color? shadowColor,

    /// optionalParameters: {Color? surfaceTintColor} , defaultValue:none
    Color? surfaceTintColor,

    /// optionalParameters: {ShapeBorder? shape} , defaultValue:none
    ShapeBorder? shape,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {Color? foregroundColor} , defaultValue:none
    Color? foregroundColor,

    /// optionalParameters: {IconThemeData? iconTheme} , defaultValue:none
    IconThemeData? iconTheme,

    /// optionalParameters: {IconThemeData? actionsIconTheme} , defaultValue:none
    IconThemeData? actionsIconTheme,

    /// optionalParameters: {bool primary = true} , defaultValue:Literal
    bool primary = true,

    /// optionalParameters: {bool? centerTitle} , defaultValue:none
    bool? centerTitle,

    /// optionalParameters: {bool excludeHeaderSemantics = false} , defaultValue:Literal
    bool excludeHeaderSemantics = false,

    /// optionalParameters: {double? titleSpacing} , defaultValue:none
    double? titleSpacing,

    /// optionalParameters: {double toolbarOpacity = 1.0} , defaultValue:Literal
    double toolbarOpacity = 1.0,

    /// optionalParameters: {double bottomOpacity = 1.0} , defaultValue:Literal
    double bottomOpacity = 1.0,

    /// optionalParameters: {double? toolbarHeight} , defaultValue:none
    double? toolbarHeight,

    /// optionalParameters: {double? leadingWidth} , defaultValue:none
    double? leadingWidth,

    /// optionalParameters: {TextStyle? toolbarTextStyle} , defaultValue:none
    TextStyle? toolbarTextStyle,

    /// optionalParameters: {TextStyle? titleTextStyle} , defaultValue:none
    TextStyle? titleTextStyle,

    /// optionalParameters: {SystemUiOverlayStyle? systemOverlayStyle} , defaultValue:none
    SystemUiOverlayStyle? systemOverlayStyle,

    /// optionalParameters: {bool forceMaterialTransparency = false} , defaultValue:Literal
    bool forceMaterialTransparency = false,
  }) : super(
          key: key,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          scrolledUnderElevation: scrolledUnderElevation,
          notificationPredicate: notificationPredicate,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          shape: shape,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          primary: primary,
          centerTitle: centerTitle,
          excludeHeaderSemantics: excludeHeaderSemantics,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
          toolbarHeight: toolbarHeight,
          leadingWidth: leadingWidth,
          toolbarTextStyle: toolbarTextStyle,
          titleTextStyle: titleTextStyle,
          systemOverlayStyle: systemOverlayStyle,
          forceMaterialTransparency: forceMaterialTransparency,
        ) {
    mateCreateName = 'AppBar';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => AppBar$Mate(
          key: p.get('key').build(),
          leading: p.get('leading').build(),
          automaticallyImplyLeading: p.get('automaticallyImplyLeading').build(),
          title: p.get('title').build(),
          actions: p.get('actions').build(),
          flexibleSpace: p.get('flexibleSpace').build(),
          bottom: p.get('bottom').build(),
          elevation: p.get('elevation').build(),
          scrolledUnderElevation: p.get('scrolledUnderElevation').build(),
          notificationPredicate: p.get('notificationPredicate').build(),
          shadowColor: p.get('shadowColor').build(),
          surfaceTintColor: p.get('surfaceTintColor').build(),
          shape: p.get('shape').build(),
          backgroundColor: p.get('backgroundColor').build(),
          foregroundColor: p.get('foregroundColor').build(),
          iconTheme: p.get('iconTheme').build(),
          actionsIconTheme: p.get('actionsIconTheme').build(),
          primary: p.get('primary').build(),
          centerTitle: p.get('centerTitle').build(),
          excludeHeaderSemantics: p.get('excludeHeaderSemantics').build(),
          titleSpacing: p.get('titleSpacing').build(),
          toolbarOpacity: p.get('toolbarOpacity').build(),
          bottomOpacity: p.get('bottomOpacity').build(),
          toolbarHeight: p.get('toolbarHeight').build(),
          leadingWidth: p.get('leadingWidth').build(),
          toolbarTextStyle: p.get('toolbarTextStyle').build(),
          titleTextStyle: p.get('titleTextStyle').build(),
          systemOverlayStyle: p.get('systemOverlayStyle').build(),
          forceMaterialTransparency: p.get('forceMaterialTransparency').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('leading', leading, isNamed: true);
    mateUse('automaticallyImplyLeading', automaticallyImplyLeading, isNamed: true);
    mateUse('title', title, isNamed: true);
    mateUseList('actions', actions, isNamed: true);
    mateUse('flexibleSpace', flexibleSpace, isNamed: true);
    mateUse('bottom', bottom, isNamed: true);
    mateUse('elevation', elevation, isNamed: true);
    mateUse('scrolledUnderElevation', scrolledUnderElevation, isNamed: true);
    mateUse('notificationPredicate', notificationPredicate, isNamed: true);
    mateUse('shadowColor', shadowColor, isNamed: true);
    mateUse('surfaceTintColor', surfaceTintColor, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('foregroundColor', foregroundColor, isNamed: true);
    mateUse('iconTheme', iconTheme, isNamed: true);
    mateUse('actionsIconTheme', actionsIconTheme, isNamed: true);
    mateUse('primary', primary, isNamed: true);
    mateUse('centerTitle', centerTitle, isNamed: true);
    mateUse('excludeHeaderSemantics', excludeHeaderSemantics, isNamed: true);
    mateUse('titleSpacing', titleSpacing, isNamed: true);
    mateUse('toolbarOpacity', toolbarOpacity, isNamed: true);
    mateUse('bottomOpacity', bottomOpacity, isNamed: true);
    mateUse('toolbarHeight', toolbarHeight, isNamed: true);
    mateUse('leadingWidth', leadingWidth, isNamed: true);
    mateUse('toolbarTextStyle', toolbarTextStyle, isNamed: true);
    mateUse('titleTextStyle', titleTextStyle, isNamed: true);
    mateUse('systemOverlayStyle', systemOverlayStyle, isNamed: true);
    mateUse('forceMaterialTransparency', forceMaterialTransparency, isNamed: true);
  }
}

/// class SliverAppBar extends StatefulWidget
class SliverAppBar$Mate extends SliverAppBar with Mate {
  /// SliverAppBar SliverAppBar({Key? key, Widget? leading, bool automaticallyImplyLeading = true, Widget? title, List<Widget>? actions, Widget? flexibleSpace, PreferredSizeWidget? bottom, double? elevation, double? scrolledUnderElevation, Color? shadowColor, Color? surfaceTintColor, bool forceElevated = false, Color? backgroundColor, Color? foregroundColor, IconThemeData? iconTheme, IconThemeData? actionsIconTheme, bool primary = true, bool? centerTitle, bool excludeHeaderSemantics = false, double? titleSpacing, double? collapsedHeight, double? expandedHeight, bool floating = false, bool pinned = false, bool snap = false, bool stretch = false, double stretchTriggerOffset = 100.0, Future<void> Function()? onStretchTrigger, ShapeBorder? shape, double toolbarHeight = kToolbarHeight, double? leadingWidth, TextStyle? toolbarTextStyle, TextStyle? titleTextStyle, SystemUiOverlayStyle? systemOverlayStyle, bool forceMaterialTransparency = false})
  SliverAppBar$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Widget? leading} , defaultValue:none
    Widget? leading,

    /// optionalParameters: {bool automaticallyImplyLeading = true} , defaultValue:Literal
    bool automaticallyImplyLeading = true,

    /// optionalParameters: {Widget? title} , defaultValue:none
    Widget? title,

    /// optionalParameters: {List<Widget>? actions} , defaultValue:none
    List<Widget>? actions,

    /// optionalParameters: {Widget? flexibleSpace} , defaultValue:none
    Widget? flexibleSpace,

    /// optionalParameters: {PreferredSizeWidget? bottom} , defaultValue:none
    PreferredSizeWidget? bottom,

    /// optionalParameters: {double? elevation} , defaultValue:none
    double? elevation,

    /// optionalParameters: {double? scrolledUnderElevation} , defaultValue:none
    double? scrolledUnderElevation,

    /// optionalParameters: {Color? shadowColor} , defaultValue:none
    Color? shadowColor,

    /// optionalParameters: {Color? surfaceTintColor} , defaultValue:none
    Color? surfaceTintColor,

    /// optionalParameters: {bool forceElevated = false} , defaultValue:Literal
    bool forceElevated = false,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {Color? foregroundColor} , defaultValue:none
    Color? foregroundColor,

    /// optionalParameters: {IconThemeData? iconTheme} , defaultValue:none
    IconThemeData? iconTheme,

    /// optionalParameters: {IconThemeData? actionsIconTheme} , defaultValue:none
    IconThemeData? actionsIconTheme,

    /// optionalParameters: {bool primary = true} , defaultValue:Literal
    bool primary = true,

    /// optionalParameters: {bool? centerTitle} , defaultValue:none
    bool? centerTitle,

    /// optionalParameters: {bool excludeHeaderSemantics = false} , defaultValue:Literal
    bool excludeHeaderSemantics = false,

    /// optionalParameters: {double? titleSpacing} , defaultValue:none
    double? titleSpacing,

    /// optionalParameters: {double? collapsedHeight} , defaultValue:none
    double? collapsedHeight,

    /// optionalParameters: {double? expandedHeight} , defaultValue:none
    double? expandedHeight,

    /// optionalParameters: {bool floating = false} , defaultValue:Literal
    bool floating = false,

    /// optionalParameters: {bool pinned = false} , defaultValue:Literal
    bool pinned = false,

    /// optionalParameters: {bool snap = false} , defaultValue:Literal
    bool snap = false,

    /// optionalParameters: {bool stretch = false} , defaultValue:Literal
    bool stretch = false,

    /// optionalParameters: {double stretchTriggerOffset = 100.0} , defaultValue:Literal
    double stretchTriggerOffset = 100.0,

    /// optionalParameters: {Future<void> Function()? onStretchTrigger} , defaultValue:none
    AsyncCallback? onStretchTrigger,

    /// optionalParameters: {ShapeBorder? shape} , defaultValue:none
    ShapeBorder? shape,

    /// optionalParameters: {double toolbarHeight = kToolbarHeight} , defaultValue:unprocessed
    required double toolbarHeight,

    /// optionalParameters: {double? leadingWidth} , defaultValue:none
    double? leadingWidth,

    /// optionalParameters: {TextStyle? toolbarTextStyle} , defaultValue:none
    TextStyle? toolbarTextStyle,

    /// optionalParameters: {TextStyle? titleTextStyle} , defaultValue:none
    TextStyle? titleTextStyle,

    /// optionalParameters: {SystemUiOverlayStyle? systemOverlayStyle} , defaultValue:none
    SystemUiOverlayStyle? systemOverlayStyle,

    /// optionalParameters: {bool forceMaterialTransparency = false} , defaultValue:Literal
    bool forceMaterialTransparency = false,
  }) : super(
          key: key,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          scrolledUnderElevation: scrolledUnderElevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          forceElevated: forceElevated,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          primary: primary,
          centerTitle: centerTitle,
          excludeHeaderSemantics: excludeHeaderSemantics,
          titleSpacing: titleSpacing,
          collapsedHeight: collapsedHeight,
          expandedHeight: expandedHeight,
          floating: floating,
          pinned: pinned,
          snap: snap,
          stretch: stretch,
          stretchTriggerOffset: stretchTriggerOffset,
          onStretchTrigger: onStretchTrigger,
          shape: shape,
          toolbarHeight: toolbarHeight,
          leadingWidth: leadingWidth,
          toolbarTextStyle: toolbarTextStyle,
          titleTextStyle: titleTextStyle,
          systemOverlayStyle: systemOverlayStyle,
          forceMaterialTransparency: forceMaterialTransparency,
        ) {
    mateCreateName = 'SliverAppBar';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => SliverAppBar$Mate(
          key: p.get('key').build(),
          leading: p.get('leading').build(),
          automaticallyImplyLeading: p.get('automaticallyImplyLeading').build(),
          title: p.get('title').build(),
          actions: p.get('actions').build(),
          flexibleSpace: p.get('flexibleSpace').build(),
          bottom: p.get('bottom').build(),
          elevation: p.get('elevation').build(),
          scrolledUnderElevation: p.get('scrolledUnderElevation').build(),
          shadowColor: p.get('shadowColor').build(),
          surfaceTintColor: p.get('surfaceTintColor').build(),
          forceElevated: p.get('forceElevated').build(),
          backgroundColor: p.get('backgroundColor').build(),
          foregroundColor: p.get('foregroundColor').build(),
          iconTheme: p.get('iconTheme').build(),
          actionsIconTheme: p.get('actionsIconTheme').build(),
          primary: p.get('primary').build(),
          centerTitle: p.get('centerTitle').build(),
          excludeHeaderSemantics: p.get('excludeHeaderSemantics').build(),
          titleSpacing: p.get('titleSpacing').build(),
          collapsedHeight: p.get('collapsedHeight').build(),
          expandedHeight: p.get('expandedHeight').build(),
          floating: p.get('floating').build(),
          pinned: p.get('pinned').build(),
          snap: p.get('snap').build(),
          stretch: p.get('stretch').build(),
          stretchTriggerOffset: p.get('stretchTriggerOffset').build(),
          onStretchTrigger: p.get('onStretchTrigger').build(),
          shape: p.get('shape').build(),
          toolbarHeight: p.get('toolbarHeight').build(),
          leadingWidth: p.get('leadingWidth').build(),
          toolbarTextStyle: p.get('toolbarTextStyle').build(),
          titleTextStyle: p.get('titleTextStyle').build(),
          systemOverlayStyle: p.get('systemOverlayStyle').build(),
          forceMaterialTransparency: p.get('forceMaterialTransparency').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('leading', leading, isNamed: true);
    mateUse('automaticallyImplyLeading', automaticallyImplyLeading, isNamed: true);
    mateUse('title', title, isNamed: true);
    mateUseList('actions', actions, isNamed: true);
    mateUse('flexibleSpace', flexibleSpace, isNamed: true);
    mateUse('bottom', bottom, isNamed: true);
    mateUse('elevation', elevation, isNamed: true);
    mateUse('scrolledUnderElevation', scrolledUnderElevation, isNamed: true);
    mateUse('shadowColor', shadowColor, isNamed: true);
    mateUse('surfaceTintColor', surfaceTintColor, isNamed: true);
    mateUse('forceElevated', forceElevated, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('foregroundColor', foregroundColor, isNamed: true);
    mateUse('iconTheme', iconTheme, isNamed: true);
    mateUse('actionsIconTheme', actionsIconTheme, isNamed: true);
    mateUse('primary', primary, isNamed: true);
    mateUse('centerTitle', centerTitle, isNamed: true);
    mateUse('excludeHeaderSemantics', excludeHeaderSemantics, isNamed: true);
    mateUse('titleSpacing', titleSpacing, isNamed: true);
    mateUse('collapsedHeight', collapsedHeight, isNamed: true);
    mateUse('expandedHeight', expandedHeight, isNamed: true);
    mateUse('floating', floating, isNamed: true);
    mateUse('pinned', pinned, isNamed: true);
    mateUse('snap', snap, isNamed: true);
    mateUse('stretch', stretch, isNamed: true);
    mateUse('stretchTriggerOffset', stretchTriggerOffset, isNamed: true);
    mateUse('onStretchTrigger', onStretchTrigger, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('toolbarHeight', toolbarHeight, isNamed: true);
    mateUse('leadingWidth', leadingWidth, isNamed: true);
    mateUse('toolbarTextStyle', toolbarTextStyle, isNamed: true);
    mateUse('titleTextStyle', titleTextStyle, isNamed: true);
    mateUse('systemOverlayStyle', systemOverlayStyle, isNamed: true);
    mateUse('forceMaterialTransparency', forceMaterialTransparency, isNamed: true);
  }
}
