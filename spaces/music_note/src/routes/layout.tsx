import { component$, Slot } from "@builder.io/qwik";
import type { RequestHandler } from "@builder.io/qwik-city";

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
    <header>
      <ul>
        <li> <a href="/music" class="my-link"> music </a>  </li>
        <li> <a href="/music/cool_music" class="my-link"> 超酷曲目  </a>  </li>
        <li> <a href="/web_audio_api" class="my-link"> web audio api  </a>  </li>
      </ul>
    </header>
    <hr/>
    <Slot />
    <hr/>
  </>;
});
