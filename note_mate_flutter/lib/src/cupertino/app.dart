// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/app.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter/src/cupertino/theme.dart';
import 'dart:core';
import 'package:flutter/src/widgets/app.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/localizations.dart';
import 'package:flutter/src/widgets/shortcuts.dart';
import 'package:flutter/src/widgets/actions.dart';
import 'package:flutter/src/widgets/scroll_configuration.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/widgets/router.dart';

/// class CupertinoApp extends StatefulWidget
class CupertinoApp$Mate extends CupertinoApp with WidgetMate<CupertinoApp$Mate> {
  /// CupertinoApp CupertinoApp({Key? key, GlobalKey<NavigatorState>? navigatorKey, Widget? home, CupertinoThemeData? theme, Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}, String? initialRoute, Route<dynamic>? Function(RouteSettings)? onGenerateRoute, List<Route<dynamic>> Function(String)? onGenerateInitialRoutes, Route<dynamic>? Function(RouteSettings)? onUnknownRoute, List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[], Widget Function(BuildContext, Widget?)? builder, String title = '', String Function(BuildContext)? onGenerateTitle, Color? color, Locale? locale, Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates, Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback, Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowCheckedModeBanner = true, Map<ShortcutActivator, Intent>? shortcuts, Map<Type, Action<Intent>>? actions, String? restorationScopeId, ScrollBehavior? scrollBehavior, bool useInheritedMediaQuery = false})
  CupertinoApp$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {GlobalKey<NavigatorState>? navigatorKey} , hasDefaultValue:false, defaultValueCode:null
    GlobalKey<NavigatorState>? navigatorKey,

    /// optionalParameters: {Widget? home} , hasDefaultValue:false, defaultValueCode:null
    Widget? home,

    /// optionalParameters: {CupertinoThemeData? theme} , hasDefaultValue:false, defaultValueCode:null
    CupertinoThemeData? theme,

    /// optionalParameters: {Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}} , hasDefaultValue:true, defaultValueCode:const <String, WidgetBuilder>{}
    required Map<String, Widget Function(BuildContext)> routes,

    /// optionalParameters: {String? initialRoute} , hasDefaultValue:false, defaultValueCode:null
    String? initialRoute,

    /// optionalParameters: {Route<dynamic>? Function(RouteSettings)? onGenerateRoute} , hasDefaultValue:false, defaultValueCode:null
    RouteFactory? onGenerateRoute,

    /// optionalParameters: {List<Route<dynamic>> Function(String)? onGenerateInitialRoutes} , hasDefaultValue:false, defaultValueCode:null
    InitialRouteListFactory? onGenerateInitialRoutes,

    /// optionalParameters: {Route<dynamic>? Function(RouteSettings)? onUnknownRoute} , hasDefaultValue:false, defaultValueCode:null
    RouteFactory? onUnknownRoute,

    /// optionalParameters: {List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[]} , hasDefaultValue:true, defaultValueCode:const <NavigatorObserver>[]
    required List<NavigatorObserver> navigatorObservers,

    /// optionalParameters: {Widget Function(BuildContext, Widget?)? builder} , hasDefaultValue:false, defaultValueCode:null
    TransitionBuilder? builder,

    /// optionalParameters: {String title = ''} , hasDefaultValue:true, defaultValueCode:''
    required String title,

    /// optionalParameters: {String Function(BuildContext)? onGenerateTitle} , hasDefaultValue:false, defaultValueCode:null
    GenerateAppTitle? onGenerateTitle,

    /// optionalParameters: {Color? color} , hasDefaultValue:false, defaultValueCode:null
    Color? color,

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

    /// optionalParameters: {bool debugShowCheckedModeBanner = true} , hasDefaultValue:true, defaultValueCode:true
    required bool debugShowCheckedModeBanner,

    /// optionalParameters: {Map<ShortcutActivator, Intent>? shortcuts} , hasDefaultValue:false, defaultValueCode:null
    Map<ShortcutActivator, Intent>? shortcuts,

    /// optionalParameters: {Map<Type, Action<Intent>>? actions} , hasDefaultValue:false, defaultValueCode:null
    Map<Type, Action<Intent>>? actions,

    /// optionalParameters: {String? restorationScopeId} , hasDefaultValue:false, defaultValueCode:null
    String? restorationScopeId,

    /// optionalParameters: {ScrollBehavior? scrollBehavior} , hasDefaultValue:false, defaultValueCode:null
    ScrollBehavior? scrollBehavior,
  }) : super(
          key: key,
          navigatorKey: navigatorKey,
          home: home,
          theme: theme,
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
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
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          restorationScopeId: restorationScopeId,
          scrollBehavior: scrollBehavior,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => CupertinoApp$Mate(
        key: p.get('key').value,
        navigatorKey: p.get('navigatorKey').value,
        home: p.get('home').value,
        theme: p.get('theme').value,
        routes: p.get('routes').value,
        initialRoute: p.get('initialRoute').value,
        onGenerateRoute: p.get('onGenerateRoute').value,
        onGenerateInitialRoutes: p.get('onGenerateInitialRoutes').value,
        onUnknownRoute: p.get('onUnknownRoute').value,
        navigatorObservers: p.get('navigatorObservers').value,
        builder: p.get('builder').value,
        title: p.get('title').value,
        onGenerateTitle: p.get('onGenerateTitle').value,
        color: p.get('color').value,
        locale: p.get('locale').value,
        localizationsDelegates: p.get('localizationsDelegates').value,
        localeListResolutionCallback: p.get('localeListResolutionCallback').value,
        localeResolutionCallback: p.get('localeResolutionCallback').value,
        supportedLocales: p.get('supportedLocales').value,
        showPerformanceOverlay: p.get('showPerformanceOverlay').value,
        checkerboardRasterCacheImages: p.get('checkerboardRasterCacheImages').value,
        checkerboardOffscreenLayers: p.get('checkerboardOffscreenLayers').value,
        showSemanticsDebugger: p.get('showSemanticsDebugger').value,
        debugShowCheckedModeBanner: p.get('debugShowCheckedModeBanner').value,
        shortcuts: p.get('shortcuts').value,
        actions: p.get('actions').value,
        restorationScopeId: p.get('restorationScopeId').value,
        scrollBehavior: p.get('scrollBehavior').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('navigatorKey', navigatorKey);
    mateParams.put('home', home);
    mateParams.put('theme', theme);
    mateParams.put('routes', routes);
    mateParams.put('initialRoute', initialRoute);
    mateParams.put('onGenerateRoute', onGenerateRoute);
    mateParams.put('onGenerateInitialRoutes', onGenerateInitialRoutes);
    mateParams.put('onUnknownRoute', onUnknownRoute);
    mateParams.putList('navigatorObservers', navigatorObservers);
    mateParams.put('builder', builder);
    mateParams.put('title', title);
    mateParams.put('onGenerateTitle', onGenerateTitle);
    mateParams.put('color', color);
    mateParams.put('locale', locale);
    mateParams.put('localizationsDelegates', localizationsDelegates);
    mateParams.put('localeListResolutionCallback', localeListResolutionCallback);
    mateParams.put('localeResolutionCallback', localeResolutionCallback);
    mateParams.put('supportedLocales', supportedLocales);
    mateParams.put('showPerformanceOverlay', showPerformanceOverlay);
    mateParams.put('checkerboardRasterCacheImages', checkerboardRasterCacheImages);
    mateParams.put('checkerboardOffscreenLayers', checkerboardOffscreenLayers);
    mateParams.put('showSemanticsDebugger', showSemanticsDebugger);
    mateParams.put('debugShowCheckedModeBanner', debugShowCheckedModeBanner);
    mateParams.put('shortcuts', shortcuts);
    mateParams.put('actions', actions);
    mateParams.put('restorationScopeId', restorationScopeId);
    mateParams.put('scrollBehavior', scrollBehavior);
  }

  /// CupertinoApp CupertinoApp.router({Key? key, RouteInformationProvider? routeInformationProvider, RouteInformationParser<Object>? routeInformationParser, RouterDelegate<Object>? routerDelegate, BackButtonDispatcher? backButtonDispatcher, RouterConfig<Object>? routerConfig, CupertinoThemeData? theme, Widget Function(BuildContext, Widget?)? builder, String title = '', String Function(BuildContext)? onGenerateTitle, Color? color, Locale? locale, Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates, Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback, Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowCheckedModeBanner = true, Map<ShortcutActivator, Intent>? shortcuts, Map<Type, Action<Intent>>? actions, String? restorationScopeId, ScrollBehavior? scrollBehavior, bool useInheritedMediaQuery = false})
  CupertinoApp$Mate.router({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {RouteInformationProvider? routeInformationProvider} , hasDefaultValue:false, defaultValueCode:null
    RouteInformationProvider? routeInformationProvider,

    /// optionalParameters: {RouteInformationParser<Object>? routeInformationParser} , hasDefaultValue:false, defaultValueCode:null
    RouteInformationParser<Object>? routeInformationParser,

    /// optionalParameters: {RouterDelegate<Object>? routerDelegate} , hasDefaultValue:false, defaultValueCode:null
    RouterDelegate<Object>? routerDelegate,

    /// optionalParameters: {BackButtonDispatcher? backButtonDispatcher} , hasDefaultValue:false, defaultValueCode:null
    BackButtonDispatcher? backButtonDispatcher,

    /// optionalParameters: {RouterConfig<Object>? routerConfig} , hasDefaultValue:false, defaultValueCode:null
    RouterConfig<Object>? routerConfig,

    /// optionalParameters: {CupertinoThemeData? theme} , hasDefaultValue:false, defaultValueCode:null
    CupertinoThemeData? theme,

    /// optionalParameters: {Widget Function(BuildContext, Widget?)? builder} , hasDefaultValue:false, defaultValueCode:null
    TransitionBuilder? builder,

    /// optionalParameters: {String title = ''} , hasDefaultValue:true, defaultValueCode:''
    required String title,

    /// optionalParameters: {String Function(BuildContext)? onGenerateTitle} , hasDefaultValue:false, defaultValueCode:null
    GenerateAppTitle? onGenerateTitle,

    /// optionalParameters: {Color? color} , hasDefaultValue:false, defaultValueCode:null
    Color? color,

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

    /// optionalParameters: {bool debugShowCheckedModeBanner = true} , hasDefaultValue:true, defaultValueCode:true
    required bool debugShowCheckedModeBanner,

    /// optionalParameters: {Map<ShortcutActivator, Intent>? shortcuts} , hasDefaultValue:false, defaultValueCode:null
    Map<ShortcutActivator, Intent>? shortcuts,

    /// optionalParameters: {Map<Type, Action<Intent>>? actions} , hasDefaultValue:false, defaultValueCode:null
    Map<Type, Action<Intent>>? actions,

    /// optionalParameters: {String? restorationScopeId} , hasDefaultValue:false, defaultValueCode:null
    String? restorationScopeId,

    /// optionalParameters: {ScrollBehavior? scrollBehavior} , hasDefaultValue:false, defaultValueCode:null
    ScrollBehavior? scrollBehavior,
  }) : super.router(
          key: key,
          routeInformationProvider: routeInformationProvider,
          routeInformationParser: routeInformationParser,
          routerDelegate: routerDelegate,
          backButtonDispatcher: backButtonDispatcher,
          routerConfig: routerConfig,
          theme: theme,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
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
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          restorationScopeId: restorationScopeId,
          scrollBehavior: scrollBehavior,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => CupertinoApp$Mate.router(
        key: p.get('key').value,
        routeInformationProvider: p.get('routeInformationProvider').value,
        routeInformationParser: p.get('routeInformationParser').value,
        routerDelegate: p.get('routerDelegate').value,
        backButtonDispatcher: p.get('backButtonDispatcher').value,
        routerConfig: p.get('routerConfig').value,
        theme: p.get('theme').value,
        builder: p.get('builder').value,
        title: p.get('title').value,
        onGenerateTitle: p.get('onGenerateTitle').value,
        color: p.get('color').value,
        locale: p.get('locale').value,
        localizationsDelegates: p.get('localizationsDelegates').value,
        localeListResolutionCallback: p.get('localeListResolutionCallback').value,
        localeResolutionCallback: p.get('localeResolutionCallback').value,
        supportedLocales: p.get('supportedLocales').value,
        showPerformanceOverlay: p.get('showPerformanceOverlay').value,
        checkerboardRasterCacheImages: p.get('checkerboardRasterCacheImages').value,
        checkerboardOffscreenLayers: p.get('checkerboardOffscreenLayers').value,
        showSemanticsDebugger: p.get('showSemanticsDebugger').value,
        debugShowCheckedModeBanner: p.get('debugShowCheckedModeBanner').value,
        shortcuts: p.get('shortcuts').value,
        actions: p.get('actions').value,
        restorationScopeId: p.get('restorationScopeId').value,
        scrollBehavior: p.get('scrollBehavior').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('routeInformationProvider', routeInformationProvider);
    mateParams.put('routeInformationParser', routeInformationParser);
    mateParams.put('routerDelegate', routerDelegate);
    mateParams.put('backButtonDispatcher', backButtonDispatcher);
    mateParams.put('routerConfig', routerConfig);
    mateParams.put('theme', theme);
    mateParams.put('builder', builder);
    mateParams.put('title', title);
    mateParams.put('onGenerateTitle', onGenerateTitle);
    mateParams.put('color', color);
    mateParams.put('locale', locale);
    mateParams.put('localizationsDelegates', localizationsDelegates);
    mateParams.put('localeListResolutionCallback', localeListResolutionCallback);
    mateParams.put('localeResolutionCallback', localeResolutionCallback);
    mateParams.put('supportedLocales', supportedLocales);
    mateParams.put('showPerformanceOverlay', showPerformanceOverlay);
    mateParams.put('checkerboardRasterCacheImages', checkerboardRasterCacheImages);
    mateParams.put('checkerboardOffscreenLayers', checkerboardOffscreenLayers);
    mateParams.put('showSemanticsDebugger', showSemanticsDebugger);
    mateParams.put('debugShowCheckedModeBanner', debugShowCheckedModeBanner);
    mateParams.put('shortcuts', shortcuts);
    mateParams.put('actions', actions);
    mateParams.put('restorationScopeId', restorationScopeId);
    mateParams.put('scrollBehavior', scrollBehavior);
  }
}
