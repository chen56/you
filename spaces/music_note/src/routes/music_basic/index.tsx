import { component$, useSignal, $ } from '@builder.io/qwik';
import type { DocumentHead } from "@builder.io/qwik-city";

import * as Tone from 'tone';

export default component$(() => {

  const increment = $(() => {

    const now = Tone.now()

    //play a middle 'C' for the duration of an 8th note
    const synth = new Tone.Synth().toDestination();
    synth.triggerAttackRelease("C4", "8n", now)
    synth.triggerAttackRelease("E4", "8n", now + 0.5)
    synth.triggerAttackRelease("G4", "8n", now + 1)
  });

  return (
    <>
      <div onClick$={increment} class="btn"></div>
    </>
  );
});

export const head: DocumentHead = {
  title: "Welcome to Qwik",
  meta: [
    {
      name: "description",
      content: "Qwik site description",
    },
  ],
};
