// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/app.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'dart:core';
import 'package:flutter/src/painting/text_style.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/localizations.dart';
import 'package:flutter/src/widgets/widget_inspector.dart';
import 'package:flutter/src/widgets/shortcuts.dart';
import 'package:flutter/src/widgets/actions.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/router.dart';

/// class WidgetsApp extends StatefulWidget
class WidgetsApp$Mate extends WidgetsApp with WidgetMate<WidgetsApp$Mate> {
  /// WidgetsApp WidgetsApp({Key? key, GlobalKey<NavigatorState>? navigatorKey, Route<dynamic>? Function(RouteSettings)? onGenerateRoute, List<Route<dynamic>> Function(String)? onGenerateInitialRoutes, Route<dynamic>? Function(RouteSettings)? onUnknownRoute, List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[], String? initialRoute, PageRoute<T> Function<T>(RouteSettings, Widget Function(BuildContext))? pageRouteBuilder, Widget? home, Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}, Widget Function(BuildContext, Widget?)? builder, String title = '', String Function(BuildContext)? onGenerateTitle, TextStyle? textStyle, required Color color, Locale? locale, Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates, Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback, Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowWidgetInspector = false, bool debugShowCheckedModeBanner = true, Widget Function(BuildContext, void Function())? inspectorSelectButtonBuilder, Map<ShortcutActivator, Intent>? shortcuts, Map<Type, Action<Intent>>? actions, String? restorationScopeId, bool useInheritedMediaQuery = false})
  WidgetsApp$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {GlobalKey<NavigatorState>? navigatorKey} , hasDefaultValue:false, defaultValueCode:null
    GlobalKey<NavigatorState>? navigatorKey,

    /// optionalParameters: {Route<dynamic>? Function(RouteSettings)? onGenerateRoute} , hasDefaultValue:false, defaultValueCode:null
    RouteFactory? onGenerateRoute,

    /// optionalParameters: {List<Route<dynamic>> Function(String)? onGenerateInitialRoutes} , hasDefaultValue:false, defaultValueCode:null
    InitialRouteListFactory? onGenerateInitialRoutes,

    /// optionalParameters: {Route<dynamic>? Function(RouteSettings)? onUnknownRoute} , hasDefaultValue:false, defaultValueCode:null
    RouteFactory? onUnknownRoute,

    /// optionalParameters: {List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[]} , hasDefaultValue:true, defaultValueCode:const <NavigatorObserver>[]
    required List<NavigatorObserver> navigatorObservers,

    /// optionalParameters: {String? initialRoute} , hasDefaultValue:false, defaultValueCode:null
    String? initialRoute,

    /// optionalParameters: {PageRoute<T> Function<T>(RouteSettings, Widget Function(BuildContext))? pageRouteBuilder} , hasDefaultValue:false, defaultValueCode:null
    PageRouteFactory? pageRouteBuilder,

    /// optionalParameters: {Widget? home} , hasDefaultValue:false, defaultValueCode:null
    Widget? home,

    /// optionalParameters: {Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}} , hasDefaultValue:true, defaultValueCode:const <String, WidgetBuilder>{}
    required Map<String, WidgetBuilder> routes,

    /// optionalParameters: {Widget Function(BuildContext, Widget?)? builder} , hasDefaultValue:false, defaultValueCode:null
    TransitionBuilder? builder,

    /// optionalParameters: {String title = ''} , hasDefaultValue:true, defaultValueCode:''
    required String title,

    /// optionalParameters: {String Function(BuildContext)? onGenerateTitle} , hasDefaultValue:false, defaultValueCode:null
    GenerateAppTitle? onGenerateTitle,

    /// optionalParameters: {TextStyle? textStyle} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? textStyle,

    /// optionalParameters: {required Color color} , hasDefaultValue:false, defaultValueCode:null
    required Color color,

    /// optionalParameters: {Locale? locale} , hasDefaultValue:false, defaultValueCode:null
    Locale? locale,

    /// optionalParameters: {Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates} , hasDefaultValue:false, defaultValueCode:null
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,

    /// optionalParameters: {Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback} , hasDefaultValue:false, defaultValueCode:null
    LocaleListResolutionCallback? localeListResolutionCallback,

    /// optionalParameters: {Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback} , hasDefaultValue:false, defaultValueCode:null
    LocaleResolutionCallback? localeResolutionCallback,

    /// optionalParameters: {Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')]} , hasDefaultValue:true, defaultValueCode:const <Locale>[Locale('en', 'US')]
    required Iterable<Locale> supportedLocales,

    /// optionalParameters: {bool showPerformanceOverlay = false} , hasDefaultValue:true, defaultValueCode:false
    required bool showPerformanceOverlay,

    /// optionalParameters: {bool checkerboardRasterCacheImages = false} , hasDefaultValue:true, defaultValueCode:false
    required bool checkerboardRasterCacheImages,

    /// optionalParameters: {bool checkerboardOffscreenLayers = false} , hasDefaultValue:true, defaultValueCode:false
    required bool checkerboardOffscreenLayers,

    /// optionalParameters: {bool showSemanticsDebugger = false} , hasDefaultValue:true, defaultValueCode:false
    required bool showSemanticsDebugger,

    /// optionalParameters: {bool debugShowWidgetInspector = false} , hasDefaultValue:true, defaultValueCode:false
    required bool debugShowWidgetInspector,

    /// optionalParameters: {bool debugShowCheckedModeBanner = true} , hasDefaultValue:true, defaultValueCode:true
    required bool debugShowCheckedModeBanner,

    /// optionalParameters: {Widget Function(BuildContext, void Function())? inspectorSelectButtonBuilder} , hasDefaultValue:false, defaultValueCode:null
    InspectorSelectButtonBuilder? inspectorSelectButtonBuilder,

    /// optionalParameters: {Map<ShortcutActivator, Intent>? shortcuts} , hasDefaultValue:false, defaultValueCode:null
    Map<ShortcutActivator, Intent>? shortcuts,

    /// optionalParameters: {Map<Type, Action<Intent>>? actions} , hasDefaultValue:false, defaultValueCode:null
    Map<Type, Action<Intent>>? actions,

    /// optionalParameters: {String? restorationScopeId} , hasDefaultValue:false, defaultValueCode:null
    String? restorationScopeId,
  }) : super(
          key: key,
          navigatorKey: navigatorKey,
          onGenerateRoute: onGenerateRoute,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers,
          initialRoute: initialRoute,
          pageRouteBuilder: pageRouteBuilder,
          home: home,
          routes: routes,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          textStyle: textStyle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowWidgetInspector: debugShowWidgetInspector,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          inspectorSelectButtonBuilder: inspectorSelectButtonBuilder,
          shortcuts: shortcuts,
          actions: actions,
          restorationScopeId: restorationScopeId,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => WidgetsApp$Mate(
        key: p.getValue('key'),
        navigatorKey: p.getValue('navigatorKey'),
        onGenerateRoute: p.getValue('onGenerateRoute'),
        onGenerateInitialRoutes: p.getValue('onGenerateInitialRoutes'),
        onUnknownRoute: p.getValue('onUnknownRoute'),
        navigatorObservers: p.getValue('navigatorObservers'),
        initialRoute: p.getValue('initialRoute'),
        pageRouteBuilder: p.getValue('pageRouteBuilder'),
        home: p.getValue('home'),
        routes: p.getValue('routes'),
        builder: p.getValue('builder'),
        title: p.getValue('title'),
        onGenerateTitle: p.getValue('onGenerateTitle'),
        textStyle: p.getValue('textStyle'),
        color: p.getValue('color'),
        locale: p.getValue('locale'),
        localizationsDelegates: p.getValue('localizationsDelegates'),
        localeListResolutionCallback: p.getValue('localeListResolutionCallback'),
        localeResolutionCallback: p.getValue('localeResolutionCallback'),
        supportedLocales: p.getValue('supportedLocales'),
        showPerformanceOverlay: p.getValue('showPerformanceOverlay'),
        checkerboardRasterCacheImages: p.getValue('checkerboardRasterCacheImages'),
        checkerboardOffscreenLayers: p.getValue('checkerboardOffscreenLayers'),
        showSemanticsDebugger: p.getValue('showSemanticsDebugger'),
        debugShowWidgetInspector: p.getValue('debugShowWidgetInspector'),
        debugShowCheckedModeBanner: p.getValue('debugShowCheckedModeBanner'),
        inspectorSelectButtonBuilder: p.getValue('inspectorSelectButtonBuilder'),
        shortcuts: p.getValue('shortcuts'),
        actions: p.getValue('actions'),
        restorationScopeId: p.getValue('restorationScopeId'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'navigatorKey', init: navigatorKey);
    mateParams.set(name: 'onGenerateRoute', init: onGenerateRoute);
    mateParams.set(name: 'onGenerateInitialRoutes', init: onGenerateInitialRoutes);
    mateParams.set(name: 'onUnknownRoute', init: onUnknownRoute);
    mateParams.set(name: 'navigatorObservers', init: navigatorObservers);
    mateParams.set(name: 'initialRoute', init: initialRoute);
    mateParams.set(name: 'pageRouteBuilder', init: pageRouteBuilder);
    mateParams.set(name: 'home', init: home);
    mateParams.set(name: 'routes', init: routes);
    mateParams.set(name: 'builder', init: builder);
    mateParams.set(name: 'title', init: title);
    mateParams.set(name: 'onGenerateTitle', init: onGenerateTitle);
    mateParams.set(name: 'textStyle', init: textStyle);
    mateParams.set(name: 'color', init: color);
    mateParams.set(name: 'locale', init: locale);
    mateParams.set(name: 'localizationsDelegates', init: localizationsDelegates);
    mateParams.set(name: 'localeListResolutionCallback', init: localeListResolutionCallback);
    mateParams.set(name: 'localeResolutionCallback', init: localeResolutionCallback);
    mateParams.set(name: 'supportedLocales', init: supportedLocales);
    mateParams.set(name: 'showPerformanceOverlay', init: showPerformanceOverlay);
    mateParams.set(name: 'checkerboardRasterCacheImages', init: checkerboardRasterCacheImages);
    mateParams.set(name: 'checkerboardOffscreenLayers', init: checkerboardOffscreenLayers);
    mateParams.set(name: 'showSemanticsDebugger', init: showSemanticsDebugger);
    mateParams.set(name: 'debugShowWidgetInspector', init: debugShowWidgetInspector);
    mateParams.set(name: 'debugShowCheckedModeBanner', init: debugShowCheckedModeBanner);
    mateParams.set(name: 'inspectorSelectButtonBuilder', init: inspectorSelectButtonBuilder);
    mateParams.set(name: 'shortcuts', init: shortcuts);
    mateParams.set(name: 'actions', init: actions);
    mateParams.set(name: 'restorationScopeId', init: restorationScopeId);
  }

  /// WidgetsApp WidgetsApp.router({Key? key, RouteInformationProvider? routeInformationProvider, RouteInformationParser<Object>? routeInformationParser, RouterDelegate<Object>? routerDelegate, RouterConfig<Object>? routerConfig, BackButtonDispatcher? backButtonDispatcher, Widget Function(BuildContext, Widget?)? builder, String title = '', String Function(BuildContext)? onGenerateTitle, TextStyle? textStyle, required Color color, Locale? locale, Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates, Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback, Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowWidgetInspector = false, bool debugShowCheckedModeBanner = true, Widget Function(BuildContext, void Function())? inspectorSelectButtonBuilder, Map<ShortcutActivator, Intent>? shortcuts, Map<Type, Action<Intent>>? actions, String? restorationScopeId, bool useInheritedMediaQuery = false})
  WidgetsApp$Mate.router({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {RouteInformationProvider? routeInformationProvider} , hasDefaultValue:false, defaultValueCode:null
    RouteInformationProvider? routeInformationProvider,

    /// optionalParameters: {RouteInformationParser<Object>? routeInformationParser} , hasDefaultValue:false, defaultValueCode:null
    RouteInformationParser<Object>? routeInformationParser,

    /// optionalParameters: {RouterDelegate<Object>? routerDelegate} , hasDefaultValue:false, defaultValueCode:null
    RouterDelegate<Object>? routerDelegate,

    /// optionalParameters: {RouterConfig<Object>? routerConfig} , hasDefaultValue:false, defaultValueCode:null
    RouterConfig<Object>? routerConfig,

    /// optionalParameters: {BackButtonDispatcher? backButtonDispatcher} , hasDefaultValue:false, defaultValueCode:null
    BackButtonDispatcher? backButtonDispatcher,

    /// optionalParameters: {Widget Function(BuildContext, Widget?)? builder} , hasDefaultValue:false, defaultValueCode:null
    TransitionBuilder? builder,

    /// optionalParameters: {String title = ''} , hasDefaultValue:true, defaultValueCode:''
    required String title,

    /// optionalParameters: {String Function(BuildContext)? onGenerateTitle} , hasDefaultValue:false, defaultValueCode:null
    GenerateAppTitle? onGenerateTitle,

    /// optionalParameters: {TextStyle? textStyle} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? textStyle,

    /// optionalParameters: {required Color color} , hasDefaultValue:false, defaultValueCode:null
    required Color color,

    /// optionalParameters: {Locale? locale} , hasDefaultValue:false, defaultValueCode:null
    Locale? locale,

    /// optionalParameters: {Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates} , hasDefaultValue:false, defaultValueCode:null
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,

    /// optionalParameters: {Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback} , hasDefaultValue:false, defaultValueCode:null
    LocaleListResolutionCallback? localeListResolutionCallback,

    /// optionalParameters: {Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback} , hasDefaultValue:false, defaultValueCode:null
    LocaleResolutionCallback? localeResolutionCallback,

    /// optionalParameters: {Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')]} , hasDefaultValue:true, defaultValueCode:const <Locale>[Locale('en', 'US')]
    required Iterable<Locale> supportedLocales,

    /// optionalParameters: {bool showPerformanceOverlay = false} , hasDefaultValue:true, defaultValueCode:false
    required bool showPerformanceOverlay,

    /// optionalParameters: {bool checkerboardRasterCacheImages = false} , hasDefaultValue:true, defaultValueCode:false
    required bool checkerboardRasterCacheImages,

    /// optionalParameters: {bool checkerboardOffscreenLayers = false} , hasDefaultValue:true, defaultValueCode:false
    required bool checkerboardOffscreenLayers,

    /// optionalParameters: {bool showSemanticsDebugger = false} , hasDefaultValue:true, defaultValueCode:false
    required bool showSemanticsDebugger,

    /// optionalParameters: {bool debugShowWidgetInspector = false} , hasDefaultValue:true, defaultValueCode:false
    required bool debugShowWidgetInspector,

    /// optionalParameters: {bool debugShowCheckedModeBanner = true} , hasDefaultValue:true, defaultValueCode:true
    required bool debugShowCheckedModeBanner,

    /// optionalParameters: {Widget Function(BuildContext, void Function())? inspectorSelectButtonBuilder} , hasDefaultValue:false, defaultValueCode:null
    InspectorSelectButtonBuilder? inspectorSelectButtonBuilder,

    /// optionalParameters: {Map<ShortcutActivator, Intent>? shortcuts} , hasDefaultValue:false, defaultValueCode:null
    Map<ShortcutActivator, Intent>? shortcuts,

    /// optionalParameters: {Map<Type, Action<Intent>>? actions} , hasDefaultValue:false, defaultValueCode:null
    Map<Type, Action<Intent>>? actions,

    /// optionalParameters: {String? restorationScopeId} , hasDefaultValue:false, defaultValueCode:null
    String? restorationScopeId,
  }) : super.router(
          key: key,
          routeInformationProvider: routeInformationProvider,
          routeInformationParser: routeInformationParser,
          routerDelegate: routerDelegate,
          routerConfig: routerConfig,
          backButtonDispatcher: backButtonDispatcher,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          textStyle: textStyle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowWidgetInspector: debugShowWidgetInspector,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          inspectorSelectButtonBuilder: inspectorSelectButtonBuilder,
          shortcuts: shortcuts,
          actions: actions,
          restorationScopeId: restorationScopeId,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => WidgetsApp$Mate.router(
        key: p.getValue('key'),
        routeInformationProvider: p.getValue('routeInformationProvider'),
        routeInformationParser: p.getValue('routeInformationParser'),
        routerDelegate: p.getValue('routerDelegate'),
        routerConfig: p.getValue('routerConfig'),
        backButtonDispatcher: p.getValue('backButtonDispatcher'),
        builder: p.getValue('builder'),
        title: p.getValue('title'),
        onGenerateTitle: p.getValue('onGenerateTitle'),
        textStyle: p.getValue('textStyle'),
        color: p.getValue('color'),
        locale: p.getValue('locale'),
        localizationsDelegates: p.getValue('localizationsDelegates'),
        localeListResolutionCallback: p.getValue('localeListResolutionCallback'),
        localeResolutionCallback: p.getValue('localeResolutionCallback'),
        supportedLocales: p.getValue('supportedLocales'),
        showPerformanceOverlay: p.getValue('showPerformanceOverlay'),
        checkerboardRasterCacheImages: p.getValue('checkerboardRasterCacheImages'),
        checkerboardOffscreenLayers: p.getValue('checkerboardOffscreenLayers'),
        showSemanticsDebugger: p.getValue('showSemanticsDebugger'),
        debugShowWidgetInspector: p.getValue('debugShowWidgetInspector'),
        debugShowCheckedModeBanner: p.getValue('debugShowCheckedModeBanner'),
        inspectorSelectButtonBuilder: p.getValue('inspectorSelectButtonBuilder'),
        shortcuts: p.getValue('shortcuts'),
        actions: p.getValue('actions'),
        restorationScopeId: p.getValue('restorationScopeId'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'routeInformationProvider', init: routeInformationProvider);
    mateParams.set(name: 'routeInformationParser', init: routeInformationParser);
    mateParams.set(name: 'routerDelegate', init: routerDelegate);
    mateParams.set(name: 'routerConfig', init: routerConfig);
    mateParams.set(name: 'backButtonDispatcher', init: backButtonDispatcher);
    mateParams.set(name: 'builder', init: builder);
    mateParams.set(name: 'title', init: title);
    mateParams.set(name: 'onGenerateTitle', init: onGenerateTitle);
    mateParams.set(name: 'textStyle', init: textStyle);
    mateParams.set(name: 'color', init: color);
    mateParams.set(name: 'locale', init: locale);
    mateParams.set(name: 'localizationsDelegates', init: localizationsDelegates);
    mateParams.set(name: 'localeListResolutionCallback', init: localeListResolutionCallback);
    mateParams.set(name: 'localeResolutionCallback', init: localeResolutionCallback);
    mateParams.set(name: 'supportedLocales', init: supportedLocales);
    mateParams.set(name: 'showPerformanceOverlay', init: showPerformanceOverlay);
    mateParams.set(name: 'checkerboardRasterCacheImages', init: checkerboardRasterCacheImages);
    mateParams.set(name: 'checkerboardOffscreenLayers', init: checkerboardOffscreenLayers);
    mateParams.set(name: 'showSemanticsDebugger', init: showSemanticsDebugger);
    mateParams.set(name: 'debugShowWidgetInspector', init: debugShowWidgetInspector);
    mateParams.set(name: 'debugShowCheckedModeBanner', init: debugShowCheckedModeBanner);
    mateParams.set(name: 'inspectorSelectButtonBuilder', init: inspectorSelectButtonBuilder);
    mateParams.set(name: 'shortcuts', init: shortcuts);
    mateParams.set(name: 'actions', init: actions);
    mateParams.set(name: 'restorationScopeId', init: restorationScopeId);
  }
}
