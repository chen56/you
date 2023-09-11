import { component$, Slot } from "@builder.io/qwik";
import type { RequestHandler } from "@builder.io/qwik-city";
import { Link } from '@builder.io/qwik-city';

export const onGet: RequestHandler = async ({ cacheControl }) => {
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
  return <>
    <div class="navbar bg-base-100">
      <div class="navbar-start">
        <button class="btn btn-square btn-ghost">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block w-5 h-5 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
        </button>

        <a href="https://chen56.github.com/note" class="btn btn-ghost normal-case text-xl">Home</a>
      </div>
      <div class="navbar-end">
        <a aria-label="Github" target="_blank" href="https://github.com/chen56/note" rel="noopener, noreferrer" class="btn btn-ghost normal-case">
          <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="inline-block h-5 w-5 fill-current md:h-6 md:w-6"><path d="M256,32C132.3,32,32,134.9,32,261.7c0,101.5,64.2,187.5,153.2,217.9a17.56,17.56,0,0,0,3.8.4c8.3,0,11.5-6.1,11.5-11.4,0-5.5-.2-19.9-.3-39.1a102.4,102.4,0,0,1-22.6,2.7c-43.1,0-52.9-33.5-52.9-33.5-10.2-26.5-24.9-33.6-24.9-33.6-19.5-13.7-.1-14.1,1.4-14.1h.1c22.5,2,34.3,23.8,34.3,23.8,11.2,19.6,26.2,25.1,39.6,25.1a63,63,0,0,0,25.6-6c2-14.8,7.8-24.9,14.2-30.7-49.7-5.8-102-25.5-102-113.5,0-25.1,8.7-45.6,23-61.6-2.3-5.8-10-29.2,2.2-60.8a18.64,18.64,0,0,1,5-.5c8.1,0,26.4,3.1,56.6,24.1a208.21,208.21,0,0,1,112.2,0c30.2-21,48.5-24.1,56.6-24.1a18.64,18.64,0,0,1,5,.5c12.2,31.6,4.5,55,2.2,60.8,14.3,16.1,23,36.6,23,61.6,0,88.2-52.4,107.6-102.3,113.3,8,7.1,15.2,21.1,15.2,42.5,0,30.7-.3,55.5-.3,63,0,5.4,3.1,11.5,11.4,11.5a19.35,19.35,0,0,0,4-.4C415.9,449.2,480,363.1,480,261.7,480,134.9,379.7,32,256,32Z"></path></svg>
        </a>
      </div>
    </div>
    <hr />

    <div class="flex">
      {/* class='grow-0 shrink-0	basis-64' == style='flex: 0 0 16rem'    
            style='flex: 0 0 16rem'  can fix column width
            ref: https://stackoverflow.com/questions/29885284/how-to-set-a-fixed-width-column-with-css-flexbox
                 https://tailwindcss.com/docs/flex-basis 
        */}
      <div class="grow-0 shrink-0	basis-64" >
        <div class="drawer lg:drawer-open">
          <input id="my-drawer-left" type="checkbox" class="drawer-toggle" />
          <div class="drawer-side">
            <label for="my-drawer-left" class="drawer-overlay"></label>
            <ul class="menu p-4 w-80 min-h-full bg-base-200 text-base-content">
              <li><Link href="/">muisc_note home</Link></li>
              <li><Link href="/music_basic">muisc_basic</Link></li>
              <li><Link href="/temp">temp</Link></li>
            </ul>
          </div>
        </div>
      </div>


      {/* class="basis-full" 中间的内容页面撑开占满除左右导航外的其他空间  */}
      <div class="basis-full"><Slot /></div>

      <div class="grow-0 shrink-0	basis-64" >
        <div class="drawer lg:drawer-open">
          <input id="my-drawer-right" type="checkbox" class="drawer-toggle" />
          <div class="drawer-side">
            <label for="my-drawer-right" class="drawer-overlay"></label>
            <ul class="menu p-4 w-80 min-h-full bg-base-200 text-base-content">
              <li><a>content outline 1</a></li>
              <li><a>content outline 1</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

  </>;
});
