import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:meta/meta_meta.dart';
import 'package:path/path.dart' as path_;
import 'package:you_flutter/src/log.dart';

/*
ref:
- https://flutter.cn/community/tutorials/understanding-navigator-v2
- https://github.com/react-navigation/react-navigation


## 关于自动化push选择的问题，是否能在大多数情况下减少由客户程序员选择pop,push,replace等等？
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
typedef PageBodyBuilder = WidgetBuilder;
typedef PageLayoutBuilder = Widget Function(BuildContext context, Widget child);
typedef LazyPageBodyBuilder = Future<PageBodyBuilder> Function();

/// annotation to page  [build] function
@Target({
  TargetKind.function,
})
class PageMeta {
  const PageMeta({
    required this.label,
    this.publish = false,
    this.toType ,
  });

  /// 每个节点单独设置，子节点不继承
  final String label;

  /// 每个节点单独设置，子节点不继承
  final bool publish;

  /// 子节点若未设置此属性，则继承父节点
  final Type? toType;
}

final class NotFoundError extends ArgumentError {
  NotFoundError({required Uri invalidValue, String name = "uri", String message = "Not Found"}) : super.value(invalidValue.toString(), name, message);
}

class ToType {
  final Type type;

  const ToType({this.type = Null});
}

mixin RouterMixin {
  YouRouter get router;

  To get root => router.root;

  @nonVirtual
  RouteUri match(Uri uri) {
    var root = router.root;
    assert(uri.path.startsWith("/"));
    if (uri.path == "/") return RouteUri._(uri: uri, to: root, routeParameters: const {});

    Map<String, String> params = {};
    return root._match(uri: uri, segments: uri.pathSegments, params: params);
  }

  @nonVirtual
  void to(Uri uri) {
    RouteUri to = match(uri);
    var result = router._routerDelegate.setNewRoutePath(to);
    bool completed = false;
    result.whenComplete(() => completed = true);
    assert(completed, "bug: internal ensure routerDelegate.setNewRoutePath is sync implement");
  }
}

final class RouteContext with RouterMixin {
  RouteContext._(this.router, this.uri);

  @override
  final YouRouter router;
  final RouteUri uri;
}

/// TODO P1 应针对2种flutter 支持的route模式进行适配：
///   path base: https://example.com/product/1
///   fragment base: https://example.com/base-harf/#/product/1
///
final class YouRouter with RouterMixin {
  YouRouter({
    required this.root,

    /// [PlatformRouteInformationProvider.initialRouteInformation]
    required Uri initial,
    required GlobalKey<NavigatorState> navigatorKey,
  })  : _navigatorKey = navigatorKey,
        assert(root.templatePath == "/") {
    _routerDelegate = LoggableRouterDelegate(logger: logger, delegate: _RouterDelegate(navigatorKey: _navigatorKey, router: this));
    _config = RouterConfig<Object>(
      routeInformationProvider: PlatformRouteInformationProvider(initialRouteInformation: RouteInformation(uri: initial)),
      routerDelegate: _routerDelegate,
      routeInformationParser: _RouteInformationParser(router: this),
    );
  }

  @override
  final To root;
  final GlobalKey<NavigatorState> _navigatorKey;
  late final RouterConfig<Object> _config;
  late final RouterDelegate<Object> _routerDelegate;

  static RouteContext of(BuildContext context) {
    var result = context.findAncestorWidgetOfExactType<_RouteScope>();
    assert(result != null, "YouRouter not found, please: MaterialApp.router(routerConfig:YouRouter(...).config())");
    return RouteContext._(result!.router, result.uri);
  }

  RouterConfig<Object> config() => _config;

  @override
  @visibleForTesting
  YouRouter get router => this;
}

enum ToPartType {
  /// static path : /settings
  static,

  /// dynamic param single part:  /user/[id]  :
  ///     /user/1 -> id==1
  dynamic,

  /// dynamic param rest parts:  /file/[...path]  :
  ///     /file/a.txt  ->  path==a.txt
  ///     /file/a/b/c.txt -> path==a/b/c.txt
  dynamicRest;

  static ToPartType? parse(String name) {
    for (var i in values) {
      if (i.name == name) {
        return i;
      }
    }
    return null;
  }
}

/// To == go_router.GoRoute
/// 官方的go_router内部略显复杂，且没有我们想要的layout等功能，所以自定一个简化版的to_router
base class To {
  // TODO P1 root Node的part是routes，有问题！
  To(
    this.part, {
    PageBodyBuilder? page,
    PageBodyBuilder? notFound,
    PageLayoutBuilder? layout,
    this.children = const [],
  })  : assert(part == "/" || !part.contains("/"), "part:'$part' should be '/' or legal directory name"),
        _layout = layout,
        _page = page,
        _notFound = notFound {
    var parsed = _parse(part);
    _name = parsed.$1;
    _type = parsed.$2;

    for (var route in children) {
      route._parent = this;
    }
  }

  /// part may be a template
  /// /[user]/[repository]
  ///    - /dart-lang/sdk    => {"user":"dart-lang","repository":"sdk"}
  ///    - /flutter/flutter  => {"user":"flutter","repository":"flutter"}
  @nonVirtual
  final String part;

  late final String _name;
  late final ToPartType _type;

  late To _parent = this;

  @nonVirtual
  final List<To> children;

  final PageBodyBuilder? _page;
  final PageBodyBuilder? _notFound;
  final PageLayoutBuilder? _layout;

  @nonVirtual
  To get parent => _parent;

  @nonVirtual
  bool get isRoot => _parent == this;

  @nonVirtual
  bool get isLeaf {
    return children.isEmpty;
  }

  bool get isValid {
    if (isPage) return true;
    return isChildrenValid;
  }

  bool get isLeafPage {
    return isValid && !isChildrenValid;
  }

  bool get isChildrenValid {
    for (var c in children) {
      if (c.isValid) return true;
    }
    return false;
  }

  @nonVirtual
  bool get isNonLeaf => !isLeaf;

  @nonVirtual
  To get root => isRoot ? this : _parent.root;

  @nonVirtual
  int get level => isRoot ? 0 : _parent.level + 1;

  @nonVirtual
  bool get isPage => _page != null;

  @nonVirtual
  bool get hasNotFound => _notFound != null;

  @nonVirtual
  bool get hasLayout => _layout != null;

  // 对于page目录树：
  // - /              -> uriTemplate: /
  //   - users        -> uriTemplate: /users
  //     - [user]     -> uriTemplate: /users/[user]
  @nonVirtual
  String get templatePath => isRoot ? "/" : path_.join(_parent.templatePath, part);

  @nonVirtual
  List<To> get ancestors => isRoot ? [] : [_parent, ..._parent.ancestors];

  /// return Strictly equal ancestors of type
  @nonVirtual
  Iterable<T> findAncestorsOfSameType<T>() sync* {
    for (var a in ancestors) {
      if (a.runtimeType == runtimeType) {
        yield a as T;
      }
    }
  }

  @nonVirtual
  Uri toUri({Map<String, String> routeParameters = const {}, Map<String, List<String>> queryParameters = const {}}) {
    // TODO 临时实现，需要增加模版参数
    return Uri.parse(templatePath);
  }

  ///  framework invoke this method if [isPage]
  @nonVirtual
  Widget _buildBody(BuildContext context) {
    return _build(context, _page!);
  }

  static Widget _build(BuildContext context, PageBodyBuilder page) {
    return page(context);
  }

  ///  framework invoke this method if [hasLayout]
  /// downstream results warp to => new result
  @nonVirtual
  Widget _warpLayout(BuildContext context, Widget child) {
    return _layout!(context, child);
  }

  RouteUri _match({
    required Uri uri,
    required List<String> segments,
    required Map<String, String> params,
  }) {
    assert(segments.isNotEmpty);

    var [next, ...rest] = segments;

    // 忽略后缀'/'
    // next=="" 代表最后以 '/' 结尾,当前 segments==[""]
    if (_type == ToPartType.static && next == "") {
      return RouteUri._(uri: uri, to: this, routeParameters: params);
    }

    To? matchChild({required String segment}) {
      To? matched = children.where((e) => e._type == ToPartType.static).where((e) => segment == e._name).firstOrNull;
      if (matched != null) return matched;
      matched = children.where((e) => e._type == ToPartType.dynamic || e._type == ToPartType.dynamicRest).firstOrNull;
      if (matched != null) return matched;
      return null;
    }

    To? matchedNext = matchChild(segment: next);
    if (matchedNext == null) {
      /// FIXME NotFoundError如何处理
      throw NotFoundError(invalidValue: uri);
    }

    if (matchedNext._type == ToPartType.dynamicRest) {
      // /tree/[...file]
      //     /tree/x/y   --> {"file":"x/y"}
      //     /tree/x/y/  --> {"file":"x/y/"}
      // dynamicAll param must be last
      params[matchedNext._name] = segments.join("/");
      return RouteUri._(uri: uri, to: matchedNext, routeParameters: params);
    } else {
      if (next == "") {
        return RouteUri._(uri: uri, to: this, routeParameters: params);
      }
      if (matchedNext._type == ToPartType.dynamic) {
        params[matchedNext._name] = next;
      }
    }

    if (rest.isEmpty) {
      return RouteUri._(uri: uri, to: matchedNext, routeParameters: params);
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
  @nonVirtual
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
  static (String, ToPartType) _parse(String pattern) {
    assert(pattern.isNotEmpty);

    if (pattern[0] != "[" || pattern[pattern.length - 1] != "]") {
      return (pattern, ToPartType.static);
    }

    assert(pattern != "[]");
    assert(pattern != "[...]");

    // name 现在是[...xxx]或[xx]

    final removeBrackets = pattern.substring(1, pattern.length - 1);

    if (removeBrackets.startsWith("...")) {
      return (removeBrackets.substring(3), ToPartType.dynamicRest);
    } else {
      return (removeBrackets, ToPartType.dynamic);
    }
  }

  @nonVirtual
  To? find(String templatePath) {
    return _findBySegments(Uri.parse(templatePath).pathSegments.where((e) => e.isNotEmpty).toList());
  }

  To? _findBySegments(List<String> segments) {
    if (segments.isEmpty) return this;
    var [first, ...rest] = segments;
    for (var c in children) {
      if (c.part == first) {
        return c._findBySegments(rest);
      }
    }
    return null;
  }

  // ignore: unused_element
  static PageBodyBuilder? _asyncToSync(LazyPageBodyBuilder? builder) {
    if (builder == null) {
      return null;
    }
    return (BuildContext context) => FutureBuilder<Widget>(
          future: builder().then((b) => b(context)),
          builder: (context, snapshot) {
            final route = YouRouter.of(context);
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('page load error(${route.uri}): ${snapshot.error} \n${snapshot.stackTrace}');
              }
              return snapshot.data!;
            }
            return const CircularProgressIndicator();
          },
        );
  }

  @nonVirtual
  Widget _buildPage(BuildContext context, RouteUri uri) {
    var result = _buildBody(context);

    final List<To> chain = [this, ...ancestors];

    for (var node in chain) {
      if (!node.hasLayout) continue;
      result = node._warpLayout(context, result);
    }
    return result;
  }

  @override
  String toString({bool deep = false}) {
    if (!deep) return "<Route path='$templatePath' children.length=${children.length} />";
    return _toStringDeep(level: 0);
  }

  String _toStringDeep({int level = 0}) {
    if (children.isEmpty) {
      return "${"  " * level}<Route path='$templatePath' />";
    }

    return '''${"  " * level}<Route path='$templatePath' >
${children.map((e) => e._toStringDeep(level: level + 1)).join("\n")}
${"  " * level}</Route>''';
  }
}

// TODO TOUri 设计的还不完善，
//  - 没有处理removeFragment、replace等更新操作，没有在path变化时更新_routeParameters
//  - 桌面和web的Uri是不一样的，web上有域名，且有fragment和path base路由2种情况，未明确处理
final class RouteUri implements Uri {
  final To to;
  final Uri _uri;
  final Map<String, String> _routeParameters;

  RouteUri._({
    required Uri uri,
    required this.to,
    required Map<String, String> routeParameters,
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
    return other is RouteUri && _uri == other;
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
  Uri removeFragment() => RouteUri._(uri: _uri.removeFragment(), to: to, routeParameters: routeParameters);

  @override
  RouteUri replace({
    String? scheme,
    String? userInfo,
    String? host,
    int? port,
    String? path,
    Iterable<String>? pathSegments,
    String? query,
    Map<String, dynamic>? queryParameters,
    String? fragment,
  }) {
    return RouteUri._(to: to, routeParameters: routeParameters, uri: _uri.replace(scheme: scheme, userInfo: userInfo, host: host, port: port, path: path, pathSegments: pathSegments, query: query, queryParameters: queryParameters, fragment: fragment));
  }

  @override
  RouteUri resolve(String reference) => RouteUri._(uri: _uri.resolve(reference), to: to, routeParameters: routeParameters);

  @override
  RouteUri resolveUri(Uri reference) => RouteUri._(uri: _uri.resolveUri(reference), to: to, routeParameters: routeParameters);

  @override
  String get scheme => _uri.scheme;

  @override
  String toFilePath({bool? windows}) => _uri.toFilePath(windows: windows);

  @override
  String get userInfo => _uri.userInfo;
}

/// this class only use for  [router] ,
/// ref: [YouRouter.of]
class _RouteScope extends StatelessWidget {
  const _RouteScope({
    required this.router,
    required this.builder,
    required this.uri,
  });

  final YouRouter router;
  final WidgetBuilder builder;
  final RouteUri uri;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

class _RouteInformationParser extends RouteInformationParser<RouteUri> {
  final YouRouter router;

  _RouteInformationParser({required this.router});

  // TODO P1 routeInformation.uri 这个在web上是fragments或path base路由，要区分
  @override
  Future<RouteUri> parseRouteInformation(RouteInformation routeInformation) {
    RouteUri location = router.match(routeInformation.uri);
    return SynchronousFuture(location);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteUri configuration) {
    return RouteInformation(uri: configuration._uri);
  }
}

class _RouterDelegate extends RouterDelegate<RouteUri> with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteUri> {
  final YouRouter router;
  final Set<RouteUri> stack;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  _RouterDelegate({
    required this.router,
    required this.navigatorKey,
  }) : stack = {};

  @override
  Future<void> setNewRoutePath(RouteUri configuration) {
    // TODO router暂时这样实现，还未确定Layout和route的配合细节
    stack.clear();
    stack.add(configuration);
    notifyListeners();
    return SynchronousFuture(null);
  }

  @override
  Future<void> setRestoredRoutePath(RouteUri configuration) {
    var result = setNewRoutePath(configuration);
    notifyListeners();
    return result;
  }

  @override
  RouteUri? get currentConfiguration {
    return stack.isEmpty ? null : stack.last;
  }

  @override
  Widget build(BuildContext context) {
    return _RouteScope(
      uri: stack.first,
      router: router,
      builder: (context) {
        return Navigator(
          key: navigatorKey,
          onPopPage: (route, result) {
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
          pages: List.from(
            stack.map(
              (uri) => MaterialPage(key: ValueKey(uri), child: uri.to._buildPage(context, uri)),
            ),
          ),
        );
      },
    );
  }
}
