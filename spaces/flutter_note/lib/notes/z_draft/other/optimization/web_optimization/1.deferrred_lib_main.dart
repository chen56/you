import 'package:flutter/material.dart';

// path类库延迟加载
import "package:path/path.dart" deferred as path;

/// deferred的类库资源动态下载，可减少初始页面的大小
/// ref: https://docs.flutter.dev/perf/deferred-components
/// deferred在web环境直接生效，不需要上面文档中android配置
main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: FutureBuilder<Map>(
          future: asyncDataFromServer(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return Text("async data loaded: ${snapshot.data}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    ),
  );
}

Future<Map> asyncDataFromServer() async {
  await path.loadLibrary(); //deferred lib need lazy load ,then use
  return {"serverPath": path.join("a", "b")};
}
