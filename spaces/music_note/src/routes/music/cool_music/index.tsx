import { component$, type Signal, useSignal } from '@builder.io/qwik';
import * as Tone from 'tone'

export default component$(() => {

  const playState = useSignal(false);

  return <div>
    <h1>music</h1>
    <h2>example: 播放音符</h2>
    <p><a href="https://www.youtube.com/watch?v=y8OtzJtp-EM">齐柏林飞艇 ：Immigrant Song</a> 雷神索爾3-諸神的黃昏 里，燃爆的战曲，漫威花了490万美金买的版权。</p>

  </div>;
});
