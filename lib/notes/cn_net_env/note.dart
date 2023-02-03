import 'package:learn_flutter/note/note.dart';

Note note = Note(
   "Text",
);

build() {
  note.markdown(r'''
# 国内网络环境问题
  
## flutter pub镜像

linux 配置.bashrc:

```bash
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```
## web 模式的问题

### canvaskit-wasm 下载地址 

参考文档：<https://docs.flutter.dev/development/platform-integration/web/initialization#initializing-the-engine>
配置相关源码: <https://github.com/flutter/engine/blob/3.8.0-2.0.pre/lib/web_ui/lib/src/engine/configuration.dart>

#### 方法1：FLUTTER_WEB_CANVASKIT_URL环境变量

```bash
# 注意 只有--release环境生效，--debug和--profile都无效 - 2023-02-03 Flutter-3.7.1
flutter run --device-id chrome --web-renderer canvaskit --release --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.37.1/bin/

# build 也有效
flutter build web -v --release  --web-renderer canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.37.1/bin/ -t lib/notes/navigator/navigator_v2/3.1.navigator_v2_args_screen.dart

```


#### 方法2：定制 /web/index.html

定制canvasKitBaseUrl

```javascript
engineInitializer.initializeEngine({
  canvasKitBaseUrl: "https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.37.1/bin/",
});
```

在index.html重的完整样子：

```html
<script>
    window.addEventListener('load', function(ev) {
      // Download main.dart.js
      _flutter.loader.loadEntrypoint({
        serviceWorker: {
          serviceWorkerVersion: serviceWorkerVersion,
        },
        onEntrypointLoaded: function(engineInitializer) {
          engineInitializer.initializeEngine({
            canvasKitBaseUrl: "https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.37.1/bin/",
          }).then(function(appRunner) {
            appRunner.runApp();
          });
        }
      });
    });
</script>
```

### 字体下载

https://fonts.gstatic.com/s/roboto/v20/KFOmCnqEu92Fr1Me5WZLCzYlKw.ttf
还不知道怎么弄

硬编码的字体文件地址：_robotoUrl <https://github.com/flutter/engine/blob/3.8.0-2.0.pre/lib/web_ui/lib/src/engine/canvaskit/fonts.dart>

  ''');

}
