# dev

开发文档

## 重要参考

Flutter app embedded in a HTML-based webpage：<https://flutter-forward-demos.web.app>

## flutter web能力

### html嵌入

- 20230526: hostElement(flutter 3.10+)，无法支持在一个页面嵌入多个flutter app，参考：
Using multiple "flutter apps" inside a page using Element Embedding
 <https://github.com/flutter/flutter/issues/121374>


### 集成web 能力，比如web audio api

 参考：https://github.com/tauri-apps/tauri/issues/4826
 tauri通过convertFileSrc访问local file的