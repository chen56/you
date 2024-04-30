import 'package:checks/checks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_flutter/src/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group("YouRouter.parse ok", () {
    var router = YouRouter(
        initial: Uri.parse("/"),
        navigatorKey: GlobalKey(),
        root: To("/", children: [
          To("settings", children: [
            To("profile"),
          ]),
          To("[user]", children: [
            To("[repository]", children: [
              To("tree", children: [
                To("[branch]", children: [
                  To("[...file]"),
                ]),
              ]),
            ]),
          ]),
        ]));
    // Tos.root.user("chen56").repository("note").tree.branch("main").file("a/b/c.dart");
    // Tos.user_repository_tree_branch_file(user:"chen56",repository:"note",branch:"main",file:"a/b");
    void match(String path, {required ({String location, Map<String, String> routeParameters}) expected}) {
      var match = router.match(path);
      expect(match.to.templatePath, equals(expected.location));
      expect(match.routeParameters, equals(expected.routeParameters));
    }

    test('static', () {
      match("/", expected: (location: "/", routeParameters: {}));

      match("/settings", expected: (location: "/settings", routeParameters: {}));
      // end with '/'
      match("/settings/", expected: (location: "/settings", routeParameters: {}));

      match("/settings/profile", expected: (location: "/settings/profile", routeParameters: {}));
      // end with '/'
      match("/settings/profile/", expected: (location: "/settings/profile", routeParameters: {}));
    });

    test('dynamic', () {
      /// dynamic
      match("/flutter", expected: (location: "/[user]", routeParameters: {"user": "flutter"}));
      // end with '/'
      match("/flutter/", expected: (location: "/[user]", routeParameters: {"user": "flutter"}));

      match("/flutter/flutter",
          expected: (location: "/[user]/[repository]", routeParameters: {"user": "flutter", "repository": "flutter"}));
      match("/flutter/packages",
          expected: (location: "/[user]/[repository]", routeParameters: {"user": "flutter", "repository": "packages"}));

      match("/flutter/packages/tree",
          expected: (location: "/[user]/[repository]/tree", routeParameters: {"user": "flutter", "repository": "packages"}));

      match("/flutter/packages/tree/main", expected: (
        location: "/[user]/[repository]/tree/[branch]",
        routeParameters: {"user": "flutter", "repository": "packages", "branch": "main"}
      ));
    });

    test('dynamicAll', () {
      match("/flutter/packages/tree/main/b/c.dart", expected: (
        location: "/[user]/[repository]/tree/[branch]/[...file]",
        routeParameters: {"user": "flutter", "repository": "packages", "branch": "main", "file": "b/c.dart"}
      ));
      // end with '/'
      match("/flutter/packages/tree/main/b/c.dart/", expected: (
        location: "/[user]/[repository]/tree/[branch]/[...file]",
        routeParameters: {"user": "flutter", "repository": "packages", "branch": "main", "file": "b/c.dart/"}
      ));
    });

    test('priority', () {
      /// static 目录名 优先级高于 dynamic 目录名，同级中既有动态又有静态目录名时，优先匹配static
      match("/settings", expected: (location: "/settings", routeParameters: {}));
      match("/chen56", expected: (location: "/[user]", routeParameters: {"user": "chen56"}));
    });
  });
  group("YouRouter.parse 404", () {
    var router = YouRouter(
      initial: Uri.parse("/"),
      navigatorKey: GlobalKey(),
      root: To("/", children: [
        To("settings", children: [
          To("profile"),
        ]),
      ]),
    );

    void match(String path, {required String matched, required Map<String, String> params}) {
      var match = router.match(path);
      expect(match.to.templatePath, equals(matched));
      expect(match.routeParameters, equals(params));
    }

    void checkNotFound({required String uri}) {
      try {
        router.match(uri);
        fail("Never");
      } catch (e) {
        check(e).isA<NotFoundError>();
      }
    }

    test('404 no_page_found', () {
      // found
      match("/settings", matched: "/settings", params: {});
      match("/settings/profile", matched: "/settings/profile", params: {});
      // notFound
      checkNotFound(uri: "/no_exists_path");
      checkNotFound(uri: "/settings/no_exists_path");
    });
  });
  group("get path", () {
    var router = YouRouter(
      initial: Uri.parse("/"),
      navigatorKey: GlobalKey(),
      root: To("/", children: [
        To("settings", children: [
          To("profile"),
        ]),
      ]),
    );

     test('find', () {
       check(router.root.find("")!.templatePath).equals("/");
       check(router.root.find("/")!.templatePath).equals("/");
       check(router.root.find("settings")!.templatePath).equals("/settings");
       check(router.root.find("/settings/profile")!.templatePath).equals("/settings/profile");
       check(router.root.find("/settings/profile/not_exists")).isNull();
    });
  });
}
