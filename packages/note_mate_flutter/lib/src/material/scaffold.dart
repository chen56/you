// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/scaffold.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter/src/material/floating_action_button_location.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/material/drawer.dart';
import 'package:flutter/src/gestures/recognizer.dart';
import 'package:flutter/gestures.dart';

/// class ScaffoldMessenger extends StatefulWidget
class ScaffoldMessenger$Mate extends ScaffoldMessenger with Mate {
  /// ScaffoldMessenger ScaffoldMessenger({Key? key, required Widget child})
  ScaffoldMessenger$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          child: child,
        ) {
    mateCreateName = 'ScaffoldMessenger';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ScaffoldMessenger$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}

/// class ScaffoldPrelayoutGeometry
class ScaffoldPrelayoutGeometry$Mate extends ScaffoldPrelayoutGeometry with Mate {
  /// ScaffoldPrelayoutGeometry ScaffoldPrelayoutGeometry({required Size bottomSheetSize, required double contentBottom, required double contentTop, required Size floatingActionButtonSize, required EdgeInsets minInsets, required EdgeInsets minViewPadding, required Size scaffoldSize, required Size snackBarSize, required Size materialBannerSize, required TextDirection textDirection})
  ScaffoldPrelayoutGeometry$Mate({
    /// optionalParameters: {required Size bottomSheetSize} , defaultValue:none
    required Size bottomSheetSize,

    /// optionalParameters: {required double contentBottom} , defaultValue:none
    required double contentBottom,

    /// optionalParameters: {required double contentTop} , defaultValue:none
    required double contentTop,

    /// optionalParameters: {required Size floatingActionButtonSize} , defaultValue:none
    required Size floatingActionButtonSize,

    /// optionalParameters: {required EdgeInsets minInsets} , defaultValue:none
    required EdgeInsets minInsets,

    /// optionalParameters: {required EdgeInsets minViewPadding} , defaultValue:none
    required EdgeInsets minViewPadding,

    /// optionalParameters: {required Size scaffoldSize} , defaultValue:none
    required Size scaffoldSize,

    /// optionalParameters: {required Size snackBarSize} , defaultValue:none
    required Size snackBarSize,

    /// optionalParameters: {required Size materialBannerSize} , defaultValue:none
    required Size materialBannerSize,

    /// optionalParameters: {required TextDirection textDirection} , defaultValue:none
    required TextDirection textDirection,
  }) : super(
          bottomSheetSize: bottomSheetSize,
          contentBottom: contentBottom,
          contentTop: contentTop,
          floatingActionButtonSize: floatingActionButtonSize,
          minInsets: minInsets,
          minViewPadding: minViewPadding,
          scaffoldSize: scaffoldSize,
          snackBarSize: snackBarSize,
          materialBannerSize: materialBannerSize,
          textDirection: textDirection,
        ) {
    mateCreateName = 'ScaffoldPrelayoutGeometry';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ScaffoldPrelayoutGeometry$Mate(
          bottomSheetSize: p.get('bottomSheetSize').build(),
          contentBottom: p.get('contentBottom').build(),
          contentTop: p.get('contentTop').build(),
          floatingActionButtonSize: p.get('floatingActionButtonSize').build(),
          minInsets: p.get('minInsets').build(),
          minViewPadding: p.get('minViewPadding').build(),
          scaffoldSize: p.get('scaffoldSize').build(),
          snackBarSize: p.get('snackBarSize').build(),
          materialBannerSize: p.get('materialBannerSize').build(),
          textDirection: p.get('textDirection').build(),
        );
    mateUse('bottomSheetSize', bottomSheetSize, isNamed: true);
    mateUse('contentBottom', contentBottom, isNamed: true);
    mateUse('contentTop', contentTop, isNamed: true);
    mateUse('floatingActionButtonSize', floatingActionButtonSize, isNamed: true);
    mateUse('minInsets', minInsets, isNamed: true);
    mateUse('minViewPadding', minViewPadding, isNamed: true);
    mateUse('scaffoldSize', scaffoldSize, isNamed: true);
    mateUse('snackBarSize', snackBarSize, isNamed: true);
    mateUse('materialBannerSize', materialBannerSize, isNamed: true);
    mateUse('textDirection', textDirection, isNamed: true);
  }
}

/// class ScaffoldGeometry
class ScaffoldGeometry$Mate extends ScaffoldGeometry with Mate {
  /// ScaffoldGeometry ScaffoldGeometry({double? bottomNavigationBarTop, Rect? floatingActionButtonArea})
  ScaffoldGeometry$Mate({
    /// optionalParameters: {double? bottomNavigationBarTop} , defaultValue:none
    double? bottomNavigationBarTop,

    /// optionalParameters: {Rect? floatingActionButtonArea} , defaultValue:none
    Rect? floatingActionButtonArea,
  }) : super(
          bottomNavigationBarTop: bottomNavigationBarTop,
          floatingActionButtonArea: floatingActionButtonArea,
        ) {
    mateCreateName = 'ScaffoldGeometry';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => ScaffoldGeometry$Mate(
          bottomNavigationBarTop: p.get('bottomNavigationBarTop').build(),
          floatingActionButtonArea: p.get('floatingActionButtonArea').build(),
        );
    mateUse('bottomNavigationBarTop', bottomNavigationBarTop, isNamed: true);
    mateUse('floatingActionButtonArea', floatingActionButtonArea, isNamed: true);
  }
}

/// class Scaffold extends StatefulWidget
class Scaffold$Mate extends Scaffold with Mate {
  /// Scaffold Scaffold({Key? key, PreferredSizeWidget? appBar, Widget? body, Widget? floatingActionButton, FloatingActionButtonLocation? floatingActionButtonLocation, FloatingActionButtonAnimator? floatingActionButtonAnimator, List<Widget>? persistentFooterButtons, AlignmentDirectional persistentFooterAlignment = AlignmentDirectional.centerEnd, Widget? drawer, void Function(bool)? onDrawerChanged, Widget? endDrawer, void Function(bool)? onEndDrawerChanged, Widget? bottomNavigationBar, Widget? bottomSheet, Color? backgroundColor, bool? resizeToAvoidBottomInset, bool primary = true, DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start, bool extendBody = false, bool extendBodyBehindAppBar = false, Color? drawerScrimColor, double? drawerEdgeDragWidth, bool drawerEnableOpenDragGesture = true, bool endDrawerEnableOpenDragGesture = true, String? restorationId})
  Scaffold$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {PreferredSizeWidget? appBar} , defaultValue:none
    PreferredSizeWidget? appBar,

    /// optionalParameters: {Widget? body} , defaultValue:none
    Widget? body,

    /// optionalParameters: {Widget? floatingActionButton} , defaultValue:none
    Widget? floatingActionButton,

    /// optionalParameters: {FloatingActionButtonLocation? floatingActionButtonLocation} , defaultValue:none
    FloatingActionButtonLocation? floatingActionButtonLocation,

    /// optionalParameters: {FloatingActionButtonAnimator? floatingActionButtonAnimator} , defaultValue:none
    FloatingActionButtonAnimator? floatingActionButtonAnimator,

    /// optionalParameters: {List<Widget>? persistentFooterButtons} , defaultValue:none
    List<Widget>? persistentFooterButtons,

    /// optionalParameters: {AlignmentDirectional persistentFooterAlignment = AlignmentDirectional.centerEnd} , defaultValue:PrefixedIdentifier
    AlignmentDirectional persistentFooterAlignment = AlignmentDirectional.centerEnd,

    /// optionalParameters: {Widget? drawer} , defaultValue:none
    Widget? drawer,

    /// optionalParameters: {void Function(bool)? onDrawerChanged} , defaultValue:none
    DrawerCallback? onDrawerChanged,

    /// optionalParameters: {Widget? endDrawer} , defaultValue:none
    Widget? endDrawer,

    /// optionalParameters: {void Function(bool)? onEndDrawerChanged} , defaultValue:none
    DrawerCallback? onEndDrawerChanged,

    /// optionalParameters: {Widget? bottomNavigationBar} , defaultValue:none
    Widget? bottomNavigationBar,

    /// optionalParameters: {Widget? bottomSheet} , defaultValue:none
    Widget? bottomSheet,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {bool? resizeToAvoidBottomInset} , defaultValue:none
    bool? resizeToAvoidBottomInset,

    /// optionalParameters: {bool primary = true} , defaultValue:Literal
    bool primary = true,

    /// optionalParameters: {DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start} , defaultValue:PrefixedIdentifier
    DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start,

    /// optionalParameters: {bool extendBody = false} , defaultValue:Literal
    bool extendBody = false,

    /// optionalParameters: {bool extendBodyBehindAppBar = false} , defaultValue:Literal
    bool extendBodyBehindAppBar = false,

    /// optionalParameters: {Color? drawerScrimColor} , defaultValue:none
    Color? drawerScrimColor,

    /// optionalParameters: {double? drawerEdgeDragWidth} , defaultValue:none
    double? drawerEdgeDragWidth,

    /// optionalParameters: {bool drawerEnableOpenDragGesture = true} , defaultValue:Literal
    bool drawerEnableOpenDragGesture = true,

    /// optionalParameters: {bool endDrawerEnableOpenDragGesture = true} , defaultValue:Literal
    bool endDrawerEnableOpenDragGesture = true,

    /// optionalParameters: {String? restorationId} , defaultValue:none
    String? restorationId,
  }) : super(
          key: key,
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          persistentFooterAlignment: persistentFooterAlignment,
          drawer: drawer,
          onDrawerChanged: onDrawerChanged,
          endDrawer: endDrawer,
          onEndDrawerChanged: onEndDrawerChanged,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
        ) {
    mateCreateName = 'Scaffold';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => Scaffold$Mate(
          key: p.get('key').build(),
          appBar: p.get('appBar').build(),
          body: p.get('body').build(),
          floatingActionButton: p.get('floatingActionButton').build(),
          floatingActionButtonLocation: p.get('floatingActionButtonLocation').build(),
          floatingActionButtonAnimator: p.get('floatingActionButtonAnimator').build(),
          persistentFooterButtons: p.get('persistentFooterButtons').build(),
          persistentFooterAlignment: p.get('persistentFooterAlignment').build(),
          drawer: p.get('drawer').build(),
          onDrawerChanged: p.get('onDrawerChanged').build(),
          endDrawer: p.get('endDrawer').build(),
          onEndDrawerChanged: p.get('onEndDrawerChanged').build(),
          bottomNavigationBar: p.get('bottomNavigationBar').build(),
          bottomSheet: p.get('bottomSheet').build(),
          backgroundColor: p.get('backgroundColor').build(),
          resizeToAvoidBottomInset: p.get('resizeToAvoidBottomInset').build(),
          primary: p.get('primary').build(),
          drawerDragStartBehavior: p.get('drawerDragStartBehavior').build(),
          extendBody: p.get('extendBody').build(),
          extendBodyBehindAppBar: p.get('extendBodyBehindAppBar').build(),
          drawerScrimColor: p.get('drawerScrimColor').build(),
          drawerEdgeDragWidth: p.get('drawerEdgeDragWidth').build(),
          drawerEnableOpenDragGesture: p.get('drawerEnableOpenDragGesture').build(),
          endDrawerEnableOpenDragGesture: p.get('endDrawerEnableOpenDragGesture').build(),
          restorationId: p.get('restorationId').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('appBar', appBar, isNamed: true);
    mateUse('body', body, isNamed: true);
    mateUse('floatingActionButton', floatingActionButton, isNamed: true);
    mateUse('floatingActionButtonLocation', floatingActionButtonLocation, isNamed: true);
    mateUse('floatingActionButtonAnimator', floatingActionButtonAnimator, isNamed: true);
    mateUseList('persistentFooterButtons', persistentFooterButtons, isNamed: true);
    mateUse('persistentFooterAlignment', persistentFooterAlignment, isNamed: true);
    mateUse('drawer', drawer, isNamed: true);
    mateUse('onDrawerChanged', onDrawerChanged, isNamed: true);
    mateUse('endDrawer', endDrawer, isNamed: true);
    mateUse('onEndDrawerChanged', onEndDrawerChanged, isNamed: true);
    mateUse('bottomNavigationBar', bottomNavigationBar, isNamed: true);
    mateUse('bottomSheet', bottomSheet, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('resizeToAvoidBottomInset', resizeToAvoidBottomInset, isNamed: true);
    mateUse('primary', primary, isNamed: true);
    mateUse('drawerDragStartBehavior', drawerDragStartBehavior, isNamed: true);
    mateUse('extendBody', extendBody, isNamed: true);
    mateUse('extendBodyBehindAppBar', extendBodyBehindAppBar, isNamed: true);
    mateUse('drawerScrimColor', drawerScrimColor, isNamed: true);
    mateUse('drawerEdgeDragWidth', drawerEdgeDragWidth, isNamed: true);
    mateUse('drawerEnableOpenDragGesture', drawerEnableOpenDragGesture, isNamed: true);
    mateUse('endDrawerEnableOpenDragGesture', endDrawerEnableOpenDragGesture, isNamed: true);
    mateUse('restorationId', restorationId, isNamed: true);
  }
}
