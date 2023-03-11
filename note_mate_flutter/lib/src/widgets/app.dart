// /// Generated by mate_flutter, please don't edit!

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
export 'dart:ui' show Locale;

/// class WidgetsApp extends StatefulWidget
class WidgetsApp$Mate extends WidgetsApp with WidgetMate<WidgetsApp$Mate> {
  /// WidgetsApp WidgetsApp({Key? key, GlobalKey<NavigatorState>? navigatorKey, Route<dynamic>? Function(RouteSettings)? onGenerateRoute, List<Route<dynamic>> Function(String)? onGenerateInitialRoutes, Route<dynamic>? Function(RouteSettings)? onUnknownRoute, List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[], String? initialRoute, PageRoute<T> Function<T>(RouteSettings, Widget Function(BuildContext))? pageRouteBuilder, Widget? home, Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}, Widget Function(BuildContext, Widget?)? builder, String title = '', String Function(BuildContext)? onGenerateTitle, TextStyle? textStyle, required Color color, Locale? locale, Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates, Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback, Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowWidgetInspector = false, bool debugShowCheckedModeBanner = true, Widget Function(BuildContext, void Function())? inspectorSelectButtonBuilder, Map<ShortcutActivator, Intent>? shortcuts, Map<Type, Action<Intent>>? actions, String? restorationScopeId, bool useInheritedMediaQuery = false})
  WidgetsApp$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {GlobalKey<NavigatorState>? navigatorKey}
    GlobalKey<NavigatorState>? navigatorKey,

    /// param: {Route<dynamic>? Function(RouteSettings)? onGenerateRoute}
    RouteFactory? onGenerateRoute,

    /// param: {List<Route<dynamic>> Function(String)? onGenerateInitialRoutes}
    InitialRouteListFactory? onGenerateInitialRoutes,

    /// param: {Route<dynamic>? Function(RouteSettings)? onUnknownRoute}
    RouteFactory? onUnknownRoute,

    /// param: {List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[]}
    required List<NavigatorObserver> navigatorObservers,

    /// param: {String? initialRoute}
    String? initialRoute,

    /// param: {PageRoute<T> Function<T>(RouteSettings, Widget Function(BuildContext))? pageRouteBuilder}
    PageRouteFactory? pageRouteBuilder,

    /// param: {Widget? home}
    Widget? home,

    /// param: {Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}}
    required Map<String, WidgetBuilder> routes,

    /// param: {Widget Function(BuildContext, Widget?)? builder}
    TransitionBuilder? builder,

    /// param: {String title = ''}
    required String title,

    /// param: {String Function(BuildContext)? onGenerateTitle}
    GenerateAppTitle? onGenerateTitle,

    /// param: {TextStyle? textStyle}
    TextStyle? textStyle,

    /// param: {required Color color}
    required Color color,

    /// param: {Locale? locale}
    Locale? locale,

    /// param: {Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates}
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,

    /// param: {Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback}
    LocaleListResolutionCallback? localeListResolutionCallback,

    /// param: {Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback}
    LocaleResolutionCallback? localeResolutionCallback,

    /// param: {Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')]}
    required Iterable<Locale> supportedLocales,

    /// param: {bool showPerformanceOverlay = false}
    required bool showPerformanceOverlay,

    /// param: {bool checkerboardRasterCacheImages = false}
    required bool checkerboardRasterCacheImages,

    /// param: {bool checkerboardOffscreenLayers = false}
    required bool checkerboardOffscreenLayers,

    /// param: {bool showSemanticsDebugger = false}
    required bool showSemanticsDebugger,

    /// param: {bool debugShowWidgetInspector = false}
    required bool debugShowWidgetInspector,

    /// param: {bool debugShowCheckedModeBanner = true}
    required bool debugShowCheckedModeBanner,

    /// param: {Widget Function(BuildContext, void Function())? inspectorSelectButtonBuilder}
    InspectorSelectButtonBuilder? inspectorSelectButtonBuilder,

    /// param: {Map<ShortcutActivator, Intent>? shortcuts}
    Map<ShortcutActivator, Intent>? shortcuts,

    /// param: {Map<Type, Action<Intent>>? actions}
    Map<Type, Action<Intent>>? actions,

    /// param: {String? restorationScopeId}
    String? restorationScopeId,

    /// param: {bool useInheritedMediaQuery = false}
    required bool useInheritedMediaQuery,
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
          useInheritedMediaQuery: useInheritedMediaQuery,
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
        useInheritedMediaQuery: p.getValue('useInheritedMediaQuery'),
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
    mateParams.set(name: 'useInheritedMediaQuery', init: useInheritedMediaQuery);
  }

  /// WidgetsApp WidgetsApp.router({Key? key, RouteInformationProvider? routeInformationProvider, RouteInformationParser<Object>? routeInformationParser, RouterDelegate<Object>? routerDelegate, RouterConfig<Object>? routerConfig, BackButtonDispatcher? backButtonDispatcher, Widget Function(BuildContext, Widget?)? builder, String title = '', String Function(BuildContext)? onGenerateTitle, TextStyle? textStyle, required Color color, Locale? locale, Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates, Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback, Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowWidgetInspector = false, bool debugShowCheckedModeBanner = true, Widget Function(BuildContext, void Function())? inspectorSelectButtonBuilder, Map<ShortcutActivator, Intent>? shortcuts, Map<Type, Action<Intent>>? actions, String? restorationScopeId, bool useInheritedMediaQuery = false})
  WidgetsApp$Mate.router({
    /// param: {Key? key}
    Key? key,

    /// param: {RouteInformationProvider? routeInformationProvider}
    RouteInformationProvider? routeInformationProvider,

    /// param: {RouteInformationParser<Object>? routeInformationParser}
    RouteInformationParser<Object>? routeInformationParser,

    /// param: {RouterDelegate<Object>? routerDelegate}
    RouterDelegate<Object>? routerDelegate,

    /// param: {RouterConfig<Object>? routerConfig}
    RouterConfig<Object>? routerConfig,

    /// param: {BackButtonDispatcher? backButtonDispatcher}
    BackButtonDispatcher? backButtonDispatcher,

    /// param: {Widget Function(BuildContext, Widget?)? builder}
    TransitionBuilder? builder,

    /// param: {String title = ''}
    required String title,

    /// param: {String Function(BuildContext)? onGenerateTitle}
    GenerateAppTitle? onGenerateTitle,

    /// param: {TextStyle? textStyle}
    TextStyle? textStyle,

    /// param: {required Color color}
    required Color color,

    /// param: {Locale? locale}
    Locale? locale,

    /// param: {Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates}
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,

    /// param: {Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback}
    LocaleListResolutionCallback? localeListResolutionCallback,

    /// param: {Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback}
    LocaleResolutionCallback? localeResolutionCallback,

    /// param: {Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')]}
    required Iterable<Locale> supportedLocales,

    /// param: {bool showPerformanceOverlay = false}
    required bool showPerformanceOverlay,

    /// param: {bool checkerboardRasterCacheImages = false}
    required bool checkerboardRasterCacheImages,

    /// param: {bool checkerboardOffscreenLayers = false}
    required bool checkerboardOffscreenLayers,

    /// param: {bool showSemanticsDebugger = false}
    required bool showSemanticsDebugger,

    /// param: {bool debugShowWidgetInspector = false}
    required bool debugShowWidgetInspector,

    /// param: {bool debugShowCheckedModeBanner = true}
    required bool debugShowCheckedModeBanner,

    /// param: {Widget Function(BuildContext, void Function())? inspectorSelectButtonBuilder}
    InspectorSelectButtonBuilder? inspectorSelectButtonBuilder,

    /// param: {Map<ShortcutActivator, Intent>? shortcuts}
    Map<ShortcutActivator, Intent>? shortcuts,

    /// param: {Map<Type, Action<Intent>>? actions}
    Map<Type, Action<Intent>>? actions,

    /// param: {String? restorationScopeId}
    String? restorationScopeId,

    /// param: {bool useInheritedMediaQuery = false}
    required bool useInheritedMediaQuery,
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
          useInheritedMediaQuery: useInheritedMediaQuery,
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
        useInheritedMediaQuery: p.getValue('useInheritedMediaQuery'),
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
    mateParams.set(name: 'useInheritedMediaQuery', init: useInheritedMediaQuery);
  }
}
