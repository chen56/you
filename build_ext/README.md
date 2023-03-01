# 开发依赖代码

本项目放代码生成相关实现， 依赖build_runner，由于其与flutter项目
不相容(单元测试有代码依赖时报错：dart:mirrors)，所以分开项目放置，不依赖flutter

lib/builder.dart : build_runner的builder，生成代码用：
- 生成page树：查询lib/pages/**/@page.dart，生成到 lib/pages/pages.g.dart
- 生成 *Mate.dart, 比如ContainerMate.dart, ColumnMate.dart