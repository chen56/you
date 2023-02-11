// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, camel_case_types

import 'package:flutter/widgets.dart';

class TODO_core_architecture{
  // navigator
  // - 参数传递 及返回值
  // - 层级navigator? 页面内的一组小流程如何做？
  //   类似注册步骤？https://flutter.cn/docs/cookbook/effects/nested-nav 嵌套混乱 和 pop混乱
  // - 类似微信回退到以前某页
  // - 可分享给朋友打开的页面就是独立页面，否则是不独立页面比如多步骤向导页中的某一步  需单独处理
  // - navatitor 用时间戳或id控制浏览器后退按钮的鉴别
  // - state恢复表单，防止没保存
  // - page 越来越多，如何安排目录呢？按package？按用途？
  // - 【低优先级】page用tag组织一下？
}
class TODO_js_static_site{
  //还需要静态站吗？
  //https://www.patterns.dev/posts/islands-architecture/
  //https://markojs.com
  // https://www.11ty.dev
  // Astro Snowpack的作者
}


/// # 生成的代码应有参数注释，以便把调参和代码对应起来
class TODO_core_architecture_comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey();
    GlobalKey.new();

    return Text(
      /*param:text.data*/ "xxx" /*param*/,
      textAlign: TextAlign.center,
    );
  }
}

class TODO_feature_optimization{
  ///seo 低优先级


  // web加载进度条：html里放一个加载中的element, 在flutter就绪时再删除?
  // if(kIsWeb) html.document.getElementById("loading")?.remove();

}

class TODO2_note{

  //PreferredSizeWidget 是啥
  //是否搞个组件继承树作为导航，方便查阅，类似 https://juejin.cn/post/6997370774466068517

  // var mediaQuery = MediaQuery.removePadding(
  //     context: context,
  //     //移除抽屉菜单顶部默认留白
  //     removeTop: true,
  //     child: listView,
  //   );

}

