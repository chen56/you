
# you

## project introduction

## flutter note

The flutter note project has been published in <https://chen56.github.io/you/flutter_web>

you can run it local by yourself:

```bash
git clone git@github.com:chen56/note.git
./bake install
./bake flutter_web dev      # run as local macos app
./bake flutter_web dev_html  # run as local web html app
```


## 框架设计原则：

- 一般性的函数/对象oo设计原则，略...
- 减少魔法代码，dart最牛逼的是依赖库的开源性，不要让人点进去时说我c，就这么个小功能搞这么复杂(比如本库内state.dart最初版本的字段自动注册机制，后改为主动调用注册函数)
- 如有可能，尽量避免代码生成
- 尽量减少对客户代码的干扰，比如给客户程序要求继承某XXXWidget基础类这种设计，违反flutter一般性直觉
- 无生命期的设计，避免客户代码使用addListener/removeListener、open/close这种需要自己操心打开关闭等生命周期的方法，与其和内存泄漏作斗争，不如避免硬刚
- 减少class static 函数,类似Types.isType()，应设计为 object method + global var的形式，'types=Types; types.isType()', 给客户程序依赖注入的机会