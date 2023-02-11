# flutter-note

## flutter-note 是干啥的？

首先是自己学习flutter及dart的笔记，其次希望能帮助初学者加速查阅技术点。

目前我遇到的学习问题，也是flutter-note想改善的：

- 【问题】flutter学习资源，以文档居多，demo混杂凌乱，没有一个可以所见即所得速查各组件外观及用法的便宜地儿，比如[官网samples](https://flutter.github.io/samples/#)真心凌乱
  - [ ] 覆盖初学者常用的主要技术点
- 【问题】官网的Sample用dartpad展示，加载极慢，在耐心丧失前的加载成功率为13%   o(一︿一+)o
  - [ ] 高速点击flutter-note目录，即可查阅各Sample实际外观
- 【问题】flutter的高级主题（尤其是state和navigator），少有很好的介绍，致使学习时间大增 ，这些都是每个APP的地基，没设计好，没理解透，将来要掉头发的
  - [ ] 提供navigator 2.0深度案例
  - [ ] 提供state深度案例
- 【问题】官网推的高级主题[brianegan/flutter_architecture_samples](https://github.com/brianegan/flutter_architecture_samples)案例设计过于复杂
  - [ ] 太复杂的案例，不是好案例，flutter-note以创造好Sample为己任，突出知识点，减少信息干预，减少脑损伤
  - [ ] 尽量做到各Sample无依赖，文本复制后，单文件就能跑起来
- 【问题】很多不错的案例（比如[官网samples](https://flutter.github.io/samples/#)），展示、说明、代码三者又不能整合，你看着案例，都不知道代码长啥样，还得现去找，去对。
  - [ ] Sample展示 + 说明 + 代码， 三合一才是王道
- 【问题】某些比较动态的案例，比如某按钮Sample，为了展示按钮的外观参数，加了一些控件来调节属性，这些动态调节的代码太复杂，污染了原本要展示的按钮逻辑，这种代码很难高速阅读。
  - [ ] 给Sample提供一种机制，比如ButtonSample.dart，界面上点点，就能给换换颜色，变变宽窄，调调某些枚举属性，快速观察其变化，而ButtonSample代码自动变化，调节器的代码不会被污染Sample本身，也不需要DartPad改代码再龟速编译运行，等觉得是要的试验代码了，再copy走自己跑


## 下载本项目自己运行

项目已发布在<https://chen56.github.io/flutter-note>, 若要自己跑，这样搞：

```
git clone git@github.com:chen56/flutter-note.git
flutter channel master
flutter run --web-renderer html --device-id chrome 
```

本项目是学习项目，***用是最新SDK***，要自己运行本项目，需`flutter channel master`

### 本项目相关dart 3.0的备注

pubspec.yaml已配置：

```yaml
environment:
    sdk: '>=3.0.0-204.0.dev <4.0.0'
```

本项目可能会使用一些dart 3.0的体验特性， 已配置analysis_options.yaml，告诉ide别报错，比如idea/vscode, 按<https://dart.dev/tools/experiment-flags >

```yaml
analyzer:
  enable-experiment:
    - super-mixins
    - no-slow-checks
```

若报错，flutter run可能没开体验特性参数：

```bash
flutter run --enable-experiment=records
```

