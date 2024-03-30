import {
  $,
  component$,
  Signal,
  useOnWindow,
  useSignal,
} from "@builder.io/qwik";

import resolveConfig from "tailwindcss/resolveConfig";
import tailwindConfig from "../../../../tailwind.config";
import React from "react"; // Your tailwind config


// https://tailwindcss.com/docs/configuration#using-esm-or-type-script
// 因为tailwindcss/resolveConfig没有提供ts版本的接口，所以ts模式下会编译失败，所以转any
let fullConfig = resolveConfig(tailwindConfig) as any;
fullConfig.theme.screens.md
// => '768px'

for (const value in fullConfig.theme.width) {
  console.log(`theme.width: ${value} ${typeof value}`)
}
for (const value in fullConfig.theme.screens) {
  console.log(`theme.screens: ${value} ${typeof value}`)
}
let breakpoints = Object.keys(fullConfig.theme.screens);

export default component$(() => {
  return (
    <>
      <h1>tailwind breakpoints</h1>
      <WindowWidth isRunning="">
        hello window.innerWidth:
      </WindowWidth>
    </>
  );
});
const WindowWidth = component$(() => {
  let windowInnerWidth = useSignal(0);

  useOnWindow("load", $(() => {
    if (windowInnerWidth.value > 0) {
      return;
    }
    windowInnerWidth.value = window.innerWidth;
  }));
  useOnWindow("resize", $(() => {
    windowInnerWidth.value = window.innerWidth;
  }));

  return <div>
    <div class="bg-red-100 sm:bg-red-300">class=bg-blue-100 sm:bg-red-100 window.innerWidth: 请调整窗口大小看下效果： {windowInnerWidth}</div>
    <div class="bg-blue-100 md:bg-blue-400">class=bg-blue-100 md:bg-red-100</div>
    <table>
      <thead>
      <tr>
        <th> 断点前缀最小宽度</th>
        <th> Minimum width 最小宽度</th>
        <th>CSS的</th>
      </tr>
      </thead>

      <tbody>
      <tr>
        <td><code>sm</code></td>
        <td> 640像素</td>
        <td><code>@media (min-width: 640px)</code></td>
      </tr>
      <tr>
        <td><code>md</code></td>
        <td> 768像素</td>
        <td><code>@media (min-width: 768px) </code></td>
      </tr>
      <tr>
        <td><code>lg</code></td>
        <td> 1024像素</td>
        <td><code>@media (min-width: 1024px)</code></td>
      </tr>
      <tr>
        <td><code>xl</code></td>
        <td> 1280像素</td>
        <td><code>@media (min-width: 1280px) </code></td>
      </tr>
      <tr>
        <td><code>2xl</code></td>
        <td> 1536像素</td>
        <td><code>@media (min-width: 1536px) </code></td>
      </tr>
      </tbody>
    </table>
    <div>
      tailwindcss api 获取的 breakpoints: {breakpoints.map((i) => `${i}, `)}
    </div>
    <div>
      <a href="https://m3.material.io/foundations/layout/applying-layout/window-size-classes">material m3</a>
    </div>
    <div>
      <a href="https://www.tailwindcss.cn/docs/responsive-design#targeting-a-breakpoint-range">tailwindcss breakpoint </a>
    </div>
  </div>;
});
