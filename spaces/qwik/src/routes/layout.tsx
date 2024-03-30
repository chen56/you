import {component$, Slot} from "@builder.io/qwik";
import type {RequestHandler} from "@builder.io/qwik-city";
import {Link} from "@builder.io/qwik-city";

export const onGet: RequestHandler = async ({cacheControl}) => {
  // Control caching for this request for best performance and to reduce hosting costs:
  // https://qwik.builder.io/docs/caching/
  cacheControl({
    // Always serve a cached response by default, up to a week stale
    staleWhileRevalidate: 60 * 60 * 24 * 7,
    // Max once every 5 seconds, revalidate on the server to get a fresh version of this page
    maxAge: 5,
  });
};

export default component$(() => {
  return <main class="">
    <div class="sticky  top-0 navbar bg-blue-950 text-neutral-content">
      <div class="navbar-start">
        <Link class="link link-hover text-xl">Study Web</Link>
      </div>
      <div class="navbar-end">
        <Link class="link link-hover text-xl" target="_blank" href="https://github.com/chen56/kou">
          {/* <MdiGithub class="hover:text-red-400" width="32" height="32"/>*/}
        </Link>
      </div>
    </div>

    <div class="flex h-dvh">
      {/*  --h-dvh 使左边栏占满viewport所有有效高度 */}
      <div class="min-w-48 bg-base-200 h-dvh">
        <ul class="menu">
          <li><Link class="link link-hover" href="/tailwind/breakpoint">tailwind/breakpoint</Link></li>
          <li><Link class="link link-hover" href="/daisyui">daisyui</Link></li>
        </ul>
      </div>
      {/*
                    设置内容区域单独滚动，必须要让内容区域实际高度小于可显示高度：
                    比如:
                    <div style="height:500px;overflow-y: scroll;" class="bg-red-100">
                        <div style="height:1000px;" class="bg-blue-100">很长的内容。。。</div>
                    </div>

                    所以设置下列class：
                    h-dvh 高度viewport最大（y轴必须）
                    overflow-y-scroll y轴滚动（y轴必须）
                    scroll-smooth 平滑滚动（可选）

                    style="overflow-y: unset;height: 600px" "overflow-y: scroll ;"
                */}

      <div class="w-dvw h-dvh  overflow-y-scroll scroll-smooth" style={{overflowY: "scroll"}}>
        <Slot></Slot>
      </div>
      {/*<span class="flex-none min-w-48    bg-base-200  ">nav right</span>*/}
    </div>
  </main>
  ;
});


