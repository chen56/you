import 'package:flutter/material.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:you_note_dart/note.dart';
// import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
build(BuildContext context, Pen print) {
  print.markdown("""
# exception

| expression | value | comment |
| :--:       | :--: | :--: |
| Uri.base          | ${Uri.base} | web == `window.location.href` |

## exception stacktrace

""");
  StackTrace? catchStack;
  try {
    throwException();
  } catch (_, stack) {
    catchStack = stack;
  }
  var catchStackParsed = Trace.parse(catchStack.toString());
  catchStackParsed.frames.forEach((e) => print("| ${e.package} | ${e.location} | ${e.library} | ${e.line} |  \n"));
  // var client =   http.Client();
  print("${parseStackGetJsMapUri(catchStack.toString())}");
  print("xxxxx:   ${Uri.base.replace(path:path.join(path.dirname(Uri.base.path),".map"))}");
  // http.get(Uri.base.replace(path:path.dirname(Uri.base.path)));
  // var request =   http.Request('GET', Uri.parse('http://example.com/somefile.txt'));
  // var response = await client.send(request);
  // var responseBody = await response.stream.bytesToString();
  // print(responseBody);
  // client.close();

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


### web堆栈解析

web环境会显示js堆栈，要对齐为dart，需要解析工具：<https://pub.dev/packages/source_map_stack_trace>：



""");
}

void throwException() {
  throw Exception("my throw");
}
Uri parseStackGetJsMapUri(String stack) {
  var parsed = Trace.parse(stack);
  for (var frame in parsed.frames) {
    assert(frame.line==null||frame.library!="unparsed","your stack format can no parse");
    if (frame.library != "main.dart.js") {
      return frame.uri.replace(path: "${frame.uri.path}.map");
    }
  }
  throw AssertionError("current only support deferred import page, that uri looks like: http://localhost:8080/you/flutter_web/main.dart.js_24.part.js, but your stack: $stack  ");
}
