# learn-flutter

flutter 布局 ，代码生成，范例

## 已用 dart 3.0

项目根目录命令行执行：

```
flutter channel master
```

pubspec.yaml配置：

```yaml
environment:
    sdk: '>=3.0.0-204.0.dev <4.0.0'
```

命令行flutter run加参数：

```bash
flutter run --enable-experiment=records
```

告诉ide别报错，比如idea/vscode, 按<https://dart.dev/tools/experiment-flags >
配置analysis_options.yaml:

```yaml
analyzer:
  enable-experiment:
    - super-mixins
    - no-slow-checks
```