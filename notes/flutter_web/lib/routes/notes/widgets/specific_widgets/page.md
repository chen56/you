# 专用组件

## button

- **ButtonStyleButton**
  - **ElevatedButton**, a filled overview whose material elevates when pressed.
  - **FilledButton**
    1. **FilledButton**, a filled overview variant that uses a secondary fill color.
    2.  **FilledButton.tonal**, a filled overview variant that uses a secondary fill color.
  - **OutlinedButton**, an overview with an outlined border and no fill color.
  - **TextButton**, an overview with no outline or fill color.
- **IconButton**
- **FloatingActionButton**: 浮动按钮，常见于[Scaffold]右下角的浮动按钮。
  1. **FloatingActionButton** 固定大小
  2. **FloatingActionButton.small** 小一点
  3. **FloatingActionButton.large** 大一点
  4. **FloatingActionButton.extended** icon + label
- **Ink系列**
  - **InkResponse**: 可以包裹任何不具有点击事件处理能力的 Widget，并为其添加点击效果。比如裹上InkResponse的Text,具有按钮效果。
    - 【场景】当你需要对点击效果有更多控制，比如应用于不规则形状的Widget上，或者需要自定义水波纹效果时。
  - **InkWell**: 是InkResponse  的一个具体实现。通常用于文本或者带明确边界的Widget上
    - 【场景】当你需要快速简单地为矩形或有固定边界元素添加点击效果时。
    - 【原理】继承InkResponse。

##

- **Divider** 水平分割线
  - **VerticalDivider** 垂直分割线
- **Icon** 图标

## input&form

- **Slider**

## Text

- Text
  - Text.rich