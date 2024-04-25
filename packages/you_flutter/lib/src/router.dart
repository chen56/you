import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path_;
import 'package:you_flutter/src/log.dart';

/*
ref:
- https://flutter.cn/community/tutorials/understanding-navigator-v2
- https://github.com/react-navigation/react-navigation


## 用例：聊天窗口在
  手机屏：push新page
  桌面屏：层级展示（没有push新page）
  旷世难题：通过route 的tree配置，而不是push等接口来决定是否增加page栈
### 方案1:
/
  main layout:MainWindowLayout
    chat layout:ChatsLayout page:chatsPage(空页面)  // windows:默认， mobile:/pushUpPage/main/chat/1 ,
      [user_id] page: chatPage
    通讯录
    发现
    我
  pushUpPage newRouteBehaviour:pop  // 切换新路由，pop弹出有返回按钮的页面
    main
      chat
        [user_id]  ref-> /main/chat/user_id

### 方案2:
/
  main layout:MainWindowLayout
    chat layout:ChatsLayout page:chatsPage(空页面)  // windows:默认， mobile:/pushUpPage/main/chat/1 ,
      [user_id] page:chatPage , layoutRetry:LayoutRetry.up   // fallStrategy: 页面踏空策略，如果页面没有被上游layout处理，则用此此略push一个新page
    通讯录
    发现
    我
 */

/// static type route instance
// mixin PageMixin on Widget {
//   Uri get uri;
// }

typedef PageBuilder = Widget Function(BuildContext context, ToUri uri);
typedef PageBuilderAsync = Future<Widget> Function(BuildContext context, ToUri uri);

class NotFoundError extends ArgumentError {
  NotFoundError({required Uri invalidValue, String name = "uri", String message = "Not Found"}) : super.value(invalidValue, name, message);
}

extension UriExt on Uri {
  /// Creates a new `Uri` based on this one, but with some parts replaced.
  Uri join(String child) => replace(pathSegments: ["", ...pathSegments, child]);
}

class YouRouter {
  YouRouter({
    required this.root,
    // [PlatformRouteInformationProvider.initialRouteInformation]
    required this.initial,
    required this.navigatorKey,
  }) : assert(root.uriTemplate == "/") {
    routerDelegate = LoggableRouterDelegate(logger: logger, delegate: _RouterDelegate(navigatorKey: navigatorKey, router: this));
    config = RouterConfig<Object>(
      routeInformationProvider: PlatformRouteInformationProvider(initialRouteInformation: RouteInformation(uri: initial)),
      routerDelegate: routerDelegate,
      routeInformationParser: _RouteInformationParser(router: this),
    );
  }

  final To root;
  final Uri initial;
  final GlobalKey<NavigatorState> navigatorKey;
  late final RouterConfig<Object> config;
  late final RouterDelegate<Object> routerDelegate;

  static YouRouter of(BuildContext context) {
    var result = context.findAncestorWidgetOfExactType<_RouterScope>();
    assert(result != null, "应把ToRouter配置到您的App中: MaterialApp.router(routerConfig:ToRouter(...))");
    return result!.router;
  }

  ToUri matchUri(Uri uri) {
    return root.match(uri);
    // assert(uri.path.startsWith("/"));
    // if (uri.path == "/") return ToUri._(uri: uri, to: root);
    //
    // Map<String, String> params = {};
    // return root._match(uri: uri, segments: uri.pathSegments, params: params);
  }

  ToUri match(String uri) => matchUri(Uri.parse(uri));

  RouterConfig<Object> toRouterConfig() => config;

  void to(Uri uri) {
    ToUri to = matchUri(uri);
    var result = routerDelegate.setNewRoutePath(to);
    bool completed = false;
    result.whenComplete(() => completed = true);
    assert(completed, "确保routerDelegate.setNewRoutePath内部实现是同步的，我们应该用其他方案来做Route结果，异步不好操纵");
  }
}

/// Layout失败重试策略
enum LayoutRetry {
  /// 失败后, 直接放弃layout，push 此页面自己的内容
  none,

  /// 失败后, 再尝试用上层layout处理
  up;
}

/// 路由类型
enum RouteType {
  /// 正常路径片段: /settings
  static,

  /// 动态参数  /user/[id]  :
  ///     /user/1 -> id==1
  dynamic,

  /// 动态参数  /file/[...path]  :
  ///     /file/a.txt  ->  path==a.txt
  ///     /file/a/b/c.txt -> path==a/b/c.txt
  dynamicAll;

  static RouteType parse(String name) {
    /// FIXME what??
    return RouteType.static;
  }
}

/// To == go_router.GoRoute
/// 官方的go_router内部略显复杂，且没有我们想要的layout等功能，所以自定一个简化版的to_router
base class To {
  /// pattern is a uri path segment template
  /// /[user]/[repository]
  ///    - /dart-lang/sdk    => {"user":"dart-lang","repository":"sdk"}
  ///    - /flutter/flutter  => {"user":"flutter","repository":"flutter"}
  final String pattern;
  late final String _name;
  late final RouteType _type;

  // TODO 可以使之非空，改为root指向自己
  To? _parent;

  final LayoutRetry layoutRetry;
  final List<To> children;
  final PageBuilder? builder;
  final PageBuilderAsync? builderAsync;

  To(
    this.pattern, {
    this.builder,
    this.builderAsync,
    this.layoutRetry = LayoutRetry.none,
    this.children = const [],
  }) : assert(pattern == "/" || !pattern.contains("/"), "part:'$pattern' should be '/' or legal directory name") {
    var parsed = _parse(pattern);
    _name = parsed.$1;
    _type = parsed.$2;

    for (var route in children) {
      route._parent = this;
    }
  }

  bool get isRoot => _parent == null;

  // 对于page目录树：
  // - /              -> uriTemplate: /
  //   - users        -> uriTemplate: /users
  //     - [user]     -> uriTemplate: /users/[user]
  String get uriTemplate => isRoot ? "/" : path_.join(_parent!.uriTemplate, pattern);

  List<To> get ancestors => isRoot ? [] : [_parent!, ..._parent!.ancestors];

  To get root => isRoot ? this : _parent!.root;

  To? _matchChild({required String segment}) {
    To? matched = children.where((e) => e._type == RouteType.static).where((e) => segment == e._name).firstOrNull;
    if (matched != null) return matched;
    matched = children.where((e) => e._type == RouteType.dynamic || e._type == RouteType.dynamicAll).firstOrNull;
    if (matched != null) return matched;
    return null;
  }

  ToUri match(Uri uri) {
    assert(uri.path.startsWith("/"));
    if (uri.path == "/") return ToUri._(uri: uri, to: root);

    Map<String, String> params = {};
    return _match(uri: uri, segments: uri.pathSegments, params: params);
  }

  ToUri _match({
    required Uri uri,
    required List<String> segments,
    required Map<String, String> params,
  }) {
    assert(segments.isNotEmpty);

    var [next, ...rest] = segments;

    // 忽略后缀'/'
    // next=="" 代表最后以 '/' 结尾,当前 segments==[""]
    if (_type == RouteType.static && next == "") {
      return ToUri._(uri: uri, to: this, routeParameters: params);
    }

    To? matchedNext = _matchChild(segment: next);
    if (matchedNext == null) {
      throw NotFoundError(invalidValue: uri);
    }

    if (matchedNext._type == RouteType.dynamicAll) {
      // /tree/[...file]
      //     /tree/x/y   --> {"file":"x/y"}
      //     /tree/x/y/  --> {"file":"x/y/"}
      // dynamicAll param must be last
      params[matchedNext._name] = segments.join("/");
      return ToUri._(uri: uri, to: matchedNext, routeParameters: params);
    } else {
      if (next == "") {
        return ToUri._(uri: uri, to: this, routeParameters: params);
      }
      if (matchedNext._type == RouteType.dynamic) {
        params[matchedNext._name] = next;
      }
    }

    if (rest.isEmpty) {
      return ToUri._(uri: uri, to: matchedNext, routeParameters: params);
    }

    return matchedNext._match(uri: uri, segments: rest, params: params);
  }

  /// tree to list
  /// /a
  ///   - /a/1
  ///   - /a/2
  ///
  /// a.toList(includeThis:true)
  ///          => [/a,/a/1,/a/2]
  List<To> toList({
    bool includeThis = true,
    bool Function(To path)? where,
    Comparator<To>? sortBy,
  }) {
    where = where ?? (e) => true;
    if (!where(this)) {
      return [];
    }
    List<To> sorted = List.from(children);
    if (sortBy != null) {
      sorted.sort(sortBy);
    }

    var flatChildren = sorted.expand((child) {
      return child.toList(includeThis: true, where: where, sortBy: sortBy);
    }).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  /// parse("user")       -->  (name:"user",type:ToNodeType.normal)
  /// parse("[id]")       -->  (name:"id",  type:ToNodeType.dynamic)
  /// parse("[...path]")  -->  (name:"path",type:ToNodeType.dynamicAll)
  static (String, RouteType) _parse(String pattern) {
    assert(pattern.isNotEmpty);

    if (pattern[0] != "[" || pattern[pattern.length - 1] != "]") {
      return (pattern, RouteType.static);
    }

    assert(pattern != "[]");
    assert(pattern != "[...]");

    // name 现在是[...xxx]或[xx]

    final removeBrackets = pattern.substring(1, pattern.length - 1);

    if (removeBrackets.startsWith("...")) {
      return (removeBrackets.substring(3), RouteType.dynamicAll);
    } else {
      return (removeBrackets, RouteType.dynamic);
    }
  }

  @override
  String toString({bool deep = false}) {
    if (!deep) return "<Route path='$uriTemplate' children.length=${children.length} />";
    return _toStringDeep(level: 0);
  }

  String _toStringDeep({int level = 0}) {
    if (children.isEmpty) {
      return "${"  " * level}<Route path='$uriTemplate' />";
    }

    return '''${"  " * level}<Route path='$uriTemplate' >
${children.map((e) => e._toStringDeep(level: level + 1)).join("\n")}
${"  " * level}</Route>''';
  }
}

class ToUri implements Uri {
  final To to;
  final Uri _uri;
  final Map<String, String> _routeParameters;

  ToUri._({
    required Uri uri,
    required this.to,
    Map<String, String> routeParameters = const {},
  })  : _uri = uri,
        _routeParameters = /*safe copy*/ Map.from(routeParameters);

  Map<String, String> get routeParameters {
    return UnmodifiableMapView<String, String>(_routeParameters);
  }

  @override
  int get hashCode => _uri.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ToUri && _uri == other;
  }

  @override
  String toString() {
    return _uri.toString();
  }

  @override
  String get authority => _uri.authority;

  @override
  UriData? get data => _uri.data;

  @override
  String get fragment => _uri.fragment;

  @override
  bool get hasAbsolutePath => _uri.hasAbsolutePath;

  @override
  bool get hasAuthority => _uri.hasAuthority;

  @override
  bool get hasEmptyPath => _uri.hasEmptyPath;

  @override
  bool get hasFragment => _uri.hasFragment;

  @override
  bool get hasPort => _uri.hasPort;

  @override
  bool get hasQuery => _uri.hasQuery;

  @override
  bool get hasScheme => _uri.hasScheme;

  @override
  String get host => _uri.host;

  @override
  bool get isAbsolute => _uri.isAbsolute;

  @override
  bool isScheme(String scheme) => _uri.isScheme(scheme);

  @override
  Uri normalizePath() => _uri.normalizePath();

  @override
  String get origin => _uri.origin;

  @override
  String get path => _uri.path;

  @override
  List<String> get pathSegments => _uri.pathSegments;

  @override
  int get port => _uri.port;

  @override
  String get query => _uri.query;

  @override
  Map<String, String> get queryParameters => _uri.queryParameters;

  @override
  Map<String, List<String>> get queryParametersAll => _uri.queryParametersAll;

  @override
  Uri removeFragment() => ToUri._(uri: _uri.removeFragment(), to: to, routeParameters: routeParameters);

  @override
  ToUri replace({
    String? scheme,
    String? userInfo,
    String? host,
    int? port,
    String? path,
    Iterable<String>? pathSegments,
    String? query,
    Map<String, dynamic>? queryParameters,
    String? fragment,
    Map<String, String>? routeParameters,
  }) {
    return ToUri._(to: to, routeParameters: routeParameters ?? this.routeParameters, uri: _uri.replace(scheme: scheme, userInfo: userInfo, host: host, port: port, path: path, pathSegments: pathSegments, query: query, queryParameters: queryParameters, fragment: fragment));
  }

  @override
  ToUri resolve(String reference) => ToUri._(uri: _uri.resolve(reference), to: to, routeParameters: routeParameters);

  @override
  ToUri resolveUri(Uri reference) => ToUri._(uri: _uri.resolveUri(reference), to: to, routeParameters: routeParameters);

  @override
  String get scheme => _uri.scheme;

  @override
  String toFilePath({bool? windows}) => _uri.toFilePath(windows: windows);

  @override
  String get userInfo => _uri.userInfo;
}

/// this class only use for  [router] ,
/// ref: [YouRouter.of]
class _RouterScope extends StatelessWidget {
  const _RouterScope({
    required this.router,
    required this.builder,
    required this.routerDelegate,
  });

  final YouRouter router;
  final WidgetBuilder builder;
  final _RouterDelegate routerDelegate;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

class _RouteInformationParser extends RouteInformationParser<ToUri> {
  final YouRouter router;

  _RouteInformationParser({required this.router});

  @override
  Future<ToUri> parseRouteInformation(RouteInformation routeInformation) {
    ToUri location = router.matchUri(routeInformation.uri);
    return SynchronousFuture(location);
  }

  @override
  RouteInformation? restoreRouteInformation(ToUri configuration) {
    return RouteInformation(uri: configuration._uri);
  }
}

class _RouterDelegate extends RouterDelegate<ToUri> with ChangeNotifier, PopNavigatorRouterDelegateMixin<ToUri> {
  final YouRouter router;
  final Set<ToUri> stack;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  _RouterDelegate({
    required this.router,
    required this.navigatorKey,
  }) : stack = {};

  @override
  Future<void> setNewRoutePath(ToUri configuration) {
    // TODO router暂时这样实现，还未确定Layout和route的配合细节
    stack.clear();
    stack.add(configuration);
    notifyListeners();
    return SynchronousFuture(null);
  }

  @override
  Future<void> setRestoredRoutePath(ToUri configuration) {
    var result = setNewRoutePath(configuration);
    notifyListeners();
    return result;
  }

  @override
  ToUri? get currentConfiguration {
    return stack.isEmpty ? null : stack.last;
  }

  @override
  Widget build(BuildContext context) {
    Page<dynamic> buildPage(ToUri location) {
      Widget pageContent = switch (location.to) {
        To(builder: var builder) when builder != null => builder(context, location),
        To(builderAsync: var builder) when builder != null => FutureBuilder<Widget>(
            future: builder(context, location),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('page load error($location): ${snapshot.error} \n${snapshot.stackTrace}');
                }
                return snapshot.data!;
              }
              return const CircularProgressIndicator();
            },
          ),
        _ => throw NotFoundError(invalidValue: location),
      };

      // 在本router api稳定下来之前，不暴露flutter Page 相关api
      return MaterialPage(key: ValueKey(location.toString()), child: pageContent);
    }

    return _RouterScope(
      routerDelegate: this,
      router: router,
      builder: (context) {
        return Navigator(
          key: navigatorKey,
          onPopPage: (route, result) {
            debugPrint("onPopPage> $route");
            if (!route.didPop(result)) {
              return false;
            }
            if (stack.isEmpty) {
              return true;
            }
            stack.remove(stack.last);
            notifyListeners();
            return true;
          },
          pages: List.from(stack.map((e) => buildPage(e))),
        );
      },
    );
  }
}
