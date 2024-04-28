import 'package:args/command_runner.dart';
import 'package:code_builder/code_builder.dart' as code;
import 'package:code_builder/code_builder.dart';

import 'package:dart_style/dart_style.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path/path.dart' as path;
import 'package:you_cli/src/cli_core.dart';

import 'dart:io' as io;

main(List<String> args) async {
  _log("Platform.script  : ${io.Platform.script}");
  _log("Directory.current: ${io.Directory.current}");
  FileSystem fs = const LocalFileSystem();

  var runner = CommandRunner("note", "you page tools.");
  runner.addCommand(
    Cmd_gen(fs: fs)
      ..addSubcommand(Cmd_gen_all(fs: fs))
      ..addSubcommand(Cmd_gen_routes_g_dart(fs: fs)),
  );

  await runner.run(args);
}

// ignore: camel_case_types
class Cmd_gen_all extends Command {
  // The [name] and [description] properties must be defined by every
  // subclass.
  Cmd_gen_all({required this.fs}) {
    argParser.addOption("dir", mandatory: true, help: "要生成的flutter note项目根目录");
  }

  final FileSystem fs;
  @override
  final name = "all";
  @override
  final description = "gen all .";

  // [run] may also return a Future.
  @override
  Future<void> run() async {}
}

// ignore: camel_case_types
class Cmd_gen extends Command {
  Cmd_gen({required this.fs});

  final FileSystem fs;
  @override
  final name = "gen";
  @override
  final description = "gen management .";

  // [run] may also return a Future.
  @override
  Future<void> run() async {}
}

// ignore: camel_case_types
class Cmd_gen_routes_g_dart extends Command {
  Cmd_gen_routes_g_dart({required this.fs}) : libMode = false {
    argParser.addOption("dir", mandatory: true, help: "要生成的flutter note项目根目录");
    argParser.addFlag("async", help: "import deferred as模式生成(默认同步加载)，web环境下异步加载资源可减少首屏下载");
  }

  Cmd_gen_routes_g_dart.libMode({
    required this.fs,
    required this.async,
    required this.dir,
  }) : libMode = true;

  bool libMode;
  bool async = false;
  late Directory dir;

  @override
  final name = "routes.g.dart";
  @override
  final description = "gen routes.g.dart .";
  final FileSystem fs;
  final Allocator _allocator=Allocator();
  YouCli? _cli;

  YouCli get cli => _cli != null ? _cli! : _cli = YouCli(projectDir: dir);

  // example:
  //   - async page:
  //     (context, print) async => await notes_i18n_.loadLibrary().then((_) => notes_i18n_.build(context, print))
  //   - async layout + page :
  //     notes_layout.layout((context, print) async => await notes_i18n_.loadLibrary().then((_) => notes_i18n_.build(context, print)))
  @Deprecated("已废弃，待完成重构后删除")
  code.Expression? builderExpression(RouteNode node) {
    if (!node.file_page_dart.existsSync()) {
      return null;
    }
    code.Expression builder = code.refer("${node.flatName}_").property("build");
    RouteNode? layout = node.findLayoutSync();
    if (layout != null) {
      builder = refer("${layout.flatName}__").property("layout2").call([builder]);
    }

    if (async) {
      return code.Method((b) => b
        ..modifier = MethodModifier.async
        ..body = code.Block.of(
          [
            code.refer("${node.flatName}_").property("loadLibrary").call([]).awaited.statement,
            if (layout != null) code.refer("${layout.flatName}__").property("loadLibrary").call([]).awaited.statement,
            builder.returned.statement,
          ],
        )).closure;
    } else {
      return builder;
    }
  }

  // 没用code_builder是因为它会格式化换行，很多换行，很乱。
  Future<String> _genRouteTreeCode(RouteNode node) async {
    String buildArg = !node.file_page_dart.existsSync() ? "" : ",builder:${node.flatName}_.build";
    String layoutArg = !node.file_layout_dart.existsSync() ? "" : ",layout:${node.flatName}__.layout";
    String padding = "".padLeft(node.level, '  ');
    var toType = node.findToType();
    if (node.children.isEmpty) {
      return '''$padding${_allocator.allocate(toType)}${async ? ".lazy" : ""}("${node.dir.basename}" $layoutArg $buildArg) ''';
    }
    List<String> children=await  Future.wait(node.children.map((child) async => await _genRouteTreeCode(child)));

    return '''$padding${_allocator.allocate(toType)}${async ? ".lazy" : ""}("${node.dir.basename}" $layoutArg $buildArg, children:[
${children.map((e) => "$e,").join("\n")}
$padding])''';
  }

  @override
  Future<void> run() async {
    if (!libMode) {
      String dirOpt = argResults!["dir"];
      dir = fs.directory(path.absolute(dirOpt));
      async = argResults!.flag("async");
    }
    if (!dir.existsSync()) {
      throw AssertionError("【--dir $dir】 not exists");
    }

    var rootRoute = await cli.rootRoute;
    Iterable<RouteNode> routes = rootRoute.toList();

    var nameMaxLen = routes.map((e) => e.flatName.length).reduce((value, element) => value > element ? value : element);
    // 因我们要自己Padding,所以没用code_builder
    var newRoutes = routes.where((e) => e.file_page_dart.existsSync()).map((routeDir) {
      var varWithPadding = routeDir.flatName.padRight(nameMaxLen);
      return """  final $varWithPadding = root.find("${routeDir.routePath}")! ;  """;
    }).join("\n");

    var routeTreeCode=await _genRouteTreeCode(rootRoute);

    Library all = Library(
      (b) => b
        ..generatedByComment = """
// Generated by https://github.com/chen56/you
//  - This file setup routes tree and strong type `routes` reference
//  - This file should be version controlled and should not be manually edited
//
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: library_prefixes
// ignore_for_file: non_constant_identifier_names
            """
        ..directives.addAll(
          routes.where((e) => e.file_page_dart.existsSync()).map((lib) {
            if (async) {
              return Directive.importDeferredAs(lib.pageImportUri(cli.pubspec.name, cli.dir_lib), "${lib.flatName}_");
            } else {
              return Directive.import(lib.pageImportUri(cli.pubspec.name, cli.dir_lib), as: "${lib.flatName}_");
            }
          }),
        )
        ..directives.addAll(
          routes.where((e) => e.file_layout_dart.existsSync()).map((lib) {
            if (async) {
              return Directive.importDeferredAs(lib.layoutImportUri(cli.pubspec.name, cli.dir_lib), "${lib.flatName}__");
            } else {
              return Directive.import(lib.layoutImportUri(cli.pubspec.name, cli.dir_lib), as: "${lib.flatName}__");
            }
          }),
        )
        ..body.add(
          Code("""

var root=$routeTreeCode ;

final Routes routes=Routes();

class Routes{
$newRoutes
}
          """),
        ),
    );

    var fmt = DartFormatter(pageWidth: 200);
    var dartEmitter = DartEmitter(allocator: _allocator, orderDirectives: false, useNullSafetySyntax: true);
    var allCode ='${all.accept(dartEmitter)}';
    _log("gen: ${cli.file_routes_g_dart.path} : $allCode");
    allCode = fmt.format(allCode);
    await cli.file_routes_g_dart.writeAsString(allCode);
    // 暂时不格式化，因为要保持变量名后的padding，对齐变量更好看
    // file.writeAsString(_fmt.format(toCode));
  }
}

_log(Object? o) {
  // ignore: avoid_print
  print("${DateTime.now()} - $o");
}
