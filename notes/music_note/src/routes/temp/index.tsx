import { component$, useSignal, $, noSerialize, type NoSerialize } from '@builder.io/qwik';
import * as Tone from 'tone'

export default component$(() => {
  return (
    <>
      <section>Example1: <Synth></Synth></section>
    </>
  );
});

export const Synth = component$(() => {
  //pure js browser code , look like too complex
  const synth = useSignal<Tone.Synth | undefined>();
  const playAudio = $(() => {
    synth.value ??= noSerialize(new Tone.Synth().toDestination());
    synth.value!.triggerAttackRelease("C4", "8n");
  });
  return (
    <>
      <button onClick$={playAudio}>playAudio</button>
    </>
  );
});
