
# note

## note 是干啥的？

除了作为自己学习flutter的笔记，更希望能帮助其他初学者。

目前我遇到的学习问题，也是note想改善的：

- flutter学习资源，以文档居多，demo混杂凌乱，没有一个可以所见即所得速查各组件外观及用法的便宜地儿，比如[官网samples](https://flutter.github.io/samples/#)真心凌乱
- 官网的Sample用dartpad展示，加载极慢，在耐心丧失前的加载成功率为13%   o(一︿一+)o
- flutter的高级主题（尤其是state和navigator），少有很好的介绍，致使学习时间大增 ，这些都是每个APP的地基，没设计好，没理解透，将来要掉头发的
- 官网推的高级主题[brianegan/flutter_architecture_samples](https://github.com/brianegan/flutter_architecture_samples)案例设计过于复杂
- 很多不错的案例（比如[官网samples](https://flutter.github.io/samples/#)），展示、说明、代码三者又不能整合，你看着案例，都不知道代码长啥样，还得现去找，去对。
- 某些比较动态的案例，比如某按钮Sample，为了展示按钮的外观参数，加了一些控件来调节属性，这些动态调节的代码太复杂，污染了原本要展示的按钮逻辑，这种代码很难高速阅读。

以上，得治：

- [ ] 提供经良好组织的案例，快速查组件咋用
- [ ] 王道Sample三要素：说明+跑起+代码，而且要跑的快，不能学DartPad那么龟
- [ ] 高级主题：提供navigator 2.0深度案例
- [ ] 高级主题：提供state深度案例
- [ ] 好Sample要，突出知识点，减少信息干预，减少脑损伤，太复杂的案例，不是好案例
- [ ] Sample尽量无依赖，一健Copy代码到你电脑，单文件就能跑起来
- [ ] 动态Sample：比如ButtonSample.dart，界面上点点，就能给换换颜色，变变宽窄，调调某些枚举属性，快速观察其变化，而ButtonSample代码自动变化，调节器的代码不会污染Sample等觉得是要的试验代码了，再点开DartPad或copy走。

## 下载本项目自己运行

项目已发布在<https://chen56.github.io/note>, 若要自己跑，这样搞：

```bash
git clone git@github.com:chen56/note.git
flutter run --web-renderer html --device-id chrome 
```


### ~~本项目相关dart 3.0的备注~~ 已恢复使用dart 2.x

~~本项目是学习项目，***用是最新SDK***，要自己运行本项目，需`flutter channel master`

pubspec.yaml已配置：

```yaml
environment:
    sdk: '>=3.0.0-204.0.dev <4.0.0'
```

本项目可能会使用一些dart 3.0的体验特性， 已配置analysis_options.yaml，告诉ide别报错，比如idea/vscode, 参考：<https://dart.dev/tools/experiment-flags>

```yaml
analyzer:
  enable-experiment:
    - patterns
    - records
```

flutter run/build需开体验特性参数：

```bash
flutter run --enable-experiment=records --enable-experiment=patterns 
flutter build --enable-experiment=records --enable-experiment=patterns 
```


## project workflow

```text
# 当前workflow：
PR---->main
         | 
         |-----> deploy : https://chen56.github.com/note/

# 待后面功能稳定了，可以加个prod分支（暂时没有）：
PR---->main--->prod
         |       |-----> deploy prod: https://chen56.github.com/note
         | 
         |-----> deploy main(inner review) : https://chen56.github.com/note/main
```

## ci docker

```bash
docker run --rm -v ${PWD}:/build --workdir /build fischerscode/flutter:3.10.0-1.1.pre ./bake build
```