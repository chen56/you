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

  // example:
  //   - async page:
  //     (context, print) async => await notes_i18n_.loadLibrary().then((_) => notes_i18n_.build(context, print))
  //   - async layout + page :
  //     notes_layout.layout((context, print) async => await notes_i18n_.loadLibrary().then((_) => notes_i18n_.build(context, print)))
  code.Expression? builderExpression(RouteNode node) {
    if (!node.page_dart.existsSync()) {
      return null;
    }
    code.Expression builder = code.refer("${node.flatName}_").property("build");
    RouteNode? layout = node.findLayoutSync();
    if (layout != null) {
      builder = code.refer("${layout.flatName}__").property("layout").call([builder]);
    }
    if (async) {
      return code.Method((b) => b
        ..modifier = MethodModifier.async
        ..body = code.Block.of(
          [
            code.refer("${node.flatName}_").property("loadLibrary").call([]).awaited.statement,
            if(layout != null) code.refer("${layout.flatName}__").property("loadLibrary").call([]).awaited.statement,
            builder.returned.statement,
          ],
        )).closure;
    } else {
      return builder;
    }
  }

  String _genRouteTreeCode(RouteNode node) {
    code.Expression? builder=builderExpression(node);
    String builderStr=builder==null?"":builder.accept(code.DartEmitter()).toString().split("\n").join();

    String buildArg = !node.page_dart.existsSync() ? "" : ",builder:$builderStr";
    String padding = "".padLeft(node.level, '  ');
    if (node.children.isEmpty) {
      return '''${padding}To${async?".lazy":""}("${node.dir.basename}" $buildArg) ''';
    }
    return '''${padding}To${async?".lazy":""}("${node.dir.basename}" $buildArg, children:[
${node.children.map((child) => _genRouteTreeCode(child)).map((e) => "$e,").join("\n")}
$padding])''';
  }

  // [run] may also return a Future.
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

    YouCli cli = YouCli(projectDir: fs.directory(dir));
    var rootRoute = RouteNode.fromSync(cli.routeDir);
    Iterable<RouteNode> pageDirs = rootRoute.toList();

    var nameMaxLen = pageDirs.map((e) => e.flatName.length).reduce((value, element) => value > element ? value : element);
    pageDirs.where((e) => e.page_dart.existsSync()).map((pageDir) {
      var varWithPadding = pageDir.flatName.padRight(nameMaxLen);
      return """  final $varWithPadding = put("${pageDir.routePath}", (context,print) async => await ${pageDir.flatName}_.loadLibrary().then((value) => ${pageDir.flatName}_.build(context,print)));  """;
    }).join("\n");

    var newRoutes = pageDirs.where((e) => e.page_dart.existsSync()).map((routeDir) {
      var varWithPadding = routeDir.flatName.padRight(nameMaxLen);
      // final NoteRoute dev_devtool = put("/dev/devtool", (context,print) async => await dev_devtool_.loadLibrary().then((value) => dev_devtool_.build(context,print)));
      return """  final $varWithPadding = root.find("${routeDir.routePath}")! ;  """;
    }).join("\n");

    Library pageImports = Library((b) => b
      ..directives.addAll(
        pageDirs.where((e) => e.page_dart.existsSync()).map((lib) {
          if (async) {
            return code.Directive.importDeferredAs(lib.pageImportUri(cli.pubspec.name, cli.libDir), "${lib.flatName}_");
          } else {
            return code.Directive.import(lib.pageImportUri(cli.pubspec.name, cli.libDir), as: "${lib.flatName}_");
          }
        }),
      ));
    Library layoutImports = Library(
      (b) => b
        ..directives.addAll(
          pageDirs.where((e) => e.layout_dart.existsSync()).map((lib) {
            if (async) {
              return code.Directive.importDeferredAs(lib.layoutImportUri(cli.pubspec.name, cli.libDir), "${lib.flatName}__");
            } else {
              return code.Directive.import(lib.layoutImportUri(cli.pubspec.name, cli.libDir), as: "${lib.flatName}__");
            }
          }),
        ),
    );

    var fmt = DartFormatter(pageWidth: 200);
    var dartEmitter = DartEmitter(allocator: Allocator.none, orderDirectives: true, useNullSafetySyntax: true);
    String pageImportsCode = fmt.format('${pageImports.accept(dartEmitter)}');
    String layoutImportsCode = fmt.format('${layoutImports.accept(dartEmitter)}');

    String routeConfigCode = "var root=${_genRouteTreeCode(rootRoute)} ;";
    // routeConfigCode = fmt.format("var root=${_genRouteTreeCode(rootRoute)} ;");

    String allCode = """
// Generated by https://github.com/chen56/you
//  - This file setup routes tree and strong type `routes` reference
//  - This file should be version controlled and should not be manually edited
//
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'package:you_flutter/router.dart';

// ###########################################
// ## routes
// ###########################################
$pageImportsCode

// ###########################################
// ## layouts
// ###########################################
$layoutImportsCode

$routeConfigCode

final Routes routes=Routes();

class Routes{
$newRoutes
}

""";

    await cli.projectDir.childFile("lib/routes.g.dart").writeAsString(allCode);
    // 暂时不格式化，因为要保持变量名后的padding，对齐变量更好看
    // file.writeAsString(_fmt.format(toCode));
  }
}

_log(Object? o) {
  // ignore: avoid_print
  print("${DateTime.now()} - $o");
}
