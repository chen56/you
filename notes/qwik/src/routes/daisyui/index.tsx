import {
  $,
  component$,
  Signal,
  useOnWindow,
  useSignal,
} from "@builder.io/qwik";


export default component$(() => {
  return (
    <>
      <h1>tailwind breakpoints</h1>
      <button type="button" class={"btn"}>hello daisy</button>
    </>
  );
});
