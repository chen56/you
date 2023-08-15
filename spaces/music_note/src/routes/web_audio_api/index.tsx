import { component$, type Signal, useSignal } from '@builder.io/qwik';
import * as Tone from 'tone'

export default component$(() => {

  const playState = useSignal(false);

  return <div>
    <h1>web audio api</h1>

    <h2>example 1</h2>
    play <button
      onClick$={() => {
        const synth = new Tone.Synth().toDestination();
        const now = Tone.now()
        synth.triggerAttackRelease("C4", "8n");
        playState.value = !playState.value;
      }}>
      ▶︎
    </button>
  </div>;
});
