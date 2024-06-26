# color

<https://m3.material.io/styles/color/system/how-the-system-works>
<https://github.com/material-foundation/material-tokens>

## HCT 色彩空间

Hue（色相）:
色相是指色彩的基本属性，简单来说就是我们通常所说的颜色名称，如红色、蓝色、绿色等。在色相环上，色相可以用角度来衡量，通常范围是从0°到360°，其中0°是红色，按照彩虹的颜色顺序递增，直到360°再次回到红色。色相决定了颜色的基本身份或种类。

Chroma（色度/ch彩度/纯度）:
彩度或纯度指的是颜色的纯净程度或鲜艳程度，也就是颜色偏离灰色的程度。一个颜色的彩度越高，它就越接近该色相的最纯净形式，看起来越鲜艳、生动；反之，彩度越低，则颜色看起来越灰暗、浑浊。在不同的色彩模型中，彩度可能有不同的表达方式，例如在HSV色彩模型中，这个属性被称为饱和度（Saturation）。

Tone（色调）:
不同于传统意义上的色调（即Hue色相），Tone更贴近于色彩的亮度或明暗程度，但它是在考虑了人对颜色感知的基础上，结合了色相和彩度调整的一个属性。在HCT色彩空间中，Tone可以帮助调整颜色使其适应不同的视觉环境，增强可读性和感知一致性，尤其适用于用户界面设计等领域。简而言之，Tone帮助调节颜色的整体明暗感受，使得颜色在不同背景下保持其特性的同时，更加和谐易读。

## Material3

> Material3 组件索引参考:
> <https://api.flutter.dev/flutter/material/ThemeData/useMaterial3.html>

