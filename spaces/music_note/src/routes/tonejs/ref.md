波封（Envelope）<https://tonejs.github.io/docs/14.7.77/Envelope.html> 是指将一种音色波形的大致轮廓描绘出来用以表示出该音色在音量变化上的特性的参数。 一个波封可以用4种参数来描述，分别是Attack(起音)、Decay(衰减)、Sustain(延持)、与Release(释音)，这四者也就是一般称的“ADSR”。
Tone中，Envelope是ADSR信封生成器。信封输出一个信号，可以连接到AudioParam或Tone.Signal。
