import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:you_note_dart/note.dart';
import 'package:http/http.dart' as http;
import 'package:source_map_stack_trace/source_map_stack_trace.dart' as source_map_stack_trace;
import 'package:path/path.dart' as path;
import 'package:source_maps/source_maps.dart' as source_map;

void build(BuildContext context, CellPrint print) async {
  print(MD("text"));
  StackTrace? catchStack;
  try {
    throwException();
  } catch (_, stack) {
    catchStack = stack;
  }
  var catchStackParsed = Trace.parse(catchStack.toString());

  print.markdown("""
### 原始堆栈StackTrace

我们自己抛一个, 捕获到的堆栈runtimeType:`${catchStack.runtimeType}，内容：

```shell
${catchStack.toString()}
```

### 解析后的堆栈StackTrace

解析工具：<https://pub.dev/packages/stack_trace>：

| package | location | library | line | column | isCore |  member | uri     |
| --      | --       | --      | --   | --     | --     |  --     |  --     |
${catchStackParsed.frames.map((e) => "| ${e.package} | ${e.location} | ${e.library} | ${e.line} | ${e.column} | ${e.isCore} | ${e.member} |${e.uri} |").join("\n")}


### js trace 转 dart trace

kIsWeb && kReleaseMode 时是js堆栈，要对齐为dart，需要解析工具：<https://pub.dev/packages/source_map_stack_trace>：

转换后的 dart stace:

```shell
${await convertDartTraceIfJsTrace(catchStack!)}
####### dartTrace2
${(await print.caller()).dartTrace}

```
  """);

  print.caller();
}

void throwException() {
  throw Exception("my throw");
}

Future<Trace> convertDartTraceIfJsTrace(StackTrace trace) async {
  Uri getJsMapUriFromJsTrace(StackTrace trace) {
    var parsed = Trace.from(trace);
    for (var frame in parsed.frames) {
// 如果遇到解析不了的行(可能发生在测试中或其他情况)
      if (frame.line == null || frame.uri.path == "unparsed") {
        continue;
      }
      if (path.basename(frame.uri.path) != "main.dart.js") {
        return frame.uri.replace(path: "${frame.uri.path}.map");
      }
    }
    throw AssertionError("current only support deferred import page, that uri looks like: http://localhost:8080/you/flutter_web/main.dart.js_24.part.js, but your stack: $trace  ");
  }

  Future<Trace> jsTraceToDartTrace(StackTrace stackTrace) async {
    Uri jsMapUri = getJsMapUriFromJsTrace(trace);
    String sourceMap = (await http.get(jsMapUri)).body;
    var dartTrace = source_map_stack_trace.mapStackTrace(source_map.parse(sourceMap), stackTrace);
    return Trace.from(dartTrace);
  }

  bool isJsTrace = kIsWeb && kReleaseMode;
  return isJsTrace ? await jsTraceToDartTrace(trace) : Trace.from(trace);
}
