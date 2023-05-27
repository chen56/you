import 'package:flutter/widgets.dart';
import 'package:note/note_page.dart';
import 'dart:developer';

NoteConfPart page = NoteConfPart(
  shortTitle: "VM Service",
  builder: build,
);

build(BuildContext context, Pen print) async {
  print.markdown(r'''
# VM Service 

## vmservice URL

vmservice 提供了一种远程调试的方式, 可以用来attach到一个正在运行的app进程, 从而可以在app运行时进行调试，但首先你需要知道这个app的vmservice的url并连接上去

### 方法一命令行获取URL

```bash
flutter run -h -v | grep vmservice-out-file
#    --vmservice-out-file=<project/example/out.txt>      A file to write the attached vmservice URL to after an application is started.

# 用--vmservice-out-file参数run app, flutter会在指定文件内写入vmservice的url
flutter run -d macos --vmservice-out-file vm_url.txt
```

然后可以用文件内的url attach到这个进程

```bash
cat vm_url.txt
# ws://127.0.0.1:61768/hEdm-oGJlDk=

flutter attach -d macos  --debug-url ws://127.0.0.1:61768/hEdm-oGJlDk=/ws
# -------------------------------------------------
# Syncing files to device macOS...                                   25.4s
# Flutter run key commands.
# r Hot reload. 🔥🔥🔥
# ...
# The Flutter DevTools debugger and profiler on macOS is available at: http://127.0.0.1:9103?uri=http://127.0.0.1:61768/hEdm-oGJlDk=/
```

也可用devtools打开工具页面, ref: [Dart DevTools](https://dart.dev/tools/dart-devtools)

当然也可以用json-rpc的方式连接vmservice.

### 方法二主进程内获取URL

> ⚠️ web模式不支持

  ''');

  print.$____________________________________________________________________();
  var serviceInfo = await Service.getInfo();
  print("serviceInfo⚠️: $serviceInfo");
  print("serviceInfo.serverUri: ${serviceInfo.serverUri}");
  print("serviceInfo.serverWebSocketUri: ${serviceInfo.serverWebSocketUri}");
  print("serviceInfo.majorVersion: ${serviceInfo.majorVersion}");
  print("serviceInfo.minorVersion: ${serviceInfo.minorVersion}");
  print('🔥🖼️✗✓🔨💪✏️');
}
