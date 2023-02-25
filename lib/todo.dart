// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, camel_case_types

/// param 框架里， 构造器有缺省值的参数，目前搞不定，1.是dart:mirror库没法解决这个问题,而ast语法分析还不熟悉，需要花时间研究，暂时搁置。
/// 这种情况，都直接给super，回避掉这个问题:Container(super.clipBehavior)

class TODO_js_static_site {
  //静态lite web版
  //https://www.patterns.dev/posts/islands-architecture/
  //https://markojs.com
  // https://www.11ty.dev
  // Astro Snowpack的作者
}

class TODO_feature_optimization {
  // seo 低优先级
  // web加载进度条：html里放一个加载中的element, 在flutter就绪时再删除?
  // if(kIsWeb) html.document.getElementById("loading")?.remove();
}

class TODO2_note {
  //是否搞个组件继承树作为导航，方便查阅，类似 https://juejin.cn/post/6997370774466068517
  // var mediaQuery = MediaQuery.removePadding(
  //     context: context,
  //     //移除抽屉菜单顶部默认留白
  //     removeTop: true,
  //     child: listView,
  //   );
  //PreferredSizeWidget
  // SafeArea
  // https://api.flutter.dev/flutter/widgets/GlobalKey-class.html
  // GlobalKey昂贵的解释
}
