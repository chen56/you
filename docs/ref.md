# ref

## 重要参考

Flutter app embedded in a HTML-based webpage：<https://flutter-forward-demos.web.app>

## 能力部分

- 20230526: hostElement(flutter 3.10+)，无法支持在一个页面嵌入多个flutter app，参考：
Using multiple "flutter apps" inside a page using Element Embedding
 <https://github.com/flutter/flutter/issues/121374>


 ## 如何集成web 能力，比如web audio api

 参考：https://github.com/tauri-apps/tauri/issues/4826
 tauri是通过convertFileSrc来访问local file的