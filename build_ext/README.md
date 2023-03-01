# 开发依赖代码

本目录放一些工具代码，依赖dev_dependencies，所以不放lib

- builder.dart build_runner的builder，生成代码用
    - 生成page树：查询lib/pages/**/@page.dart，生成到 lib/pages/pages.g.dart
    - 生成 *Mate.dart, 比如ContainerMate.dart, ColumnMate.dart