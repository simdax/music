{
	SynthDef(\error, { | out = 1 |
		Out.ar(out,
			LFSaw.ar(500, 0, 0.1) * EnvGen.kr(Env.perc, doneAction: 2)
		);
	}).add;
	SynthDef(\harpsichord, { arg out = 0, freq = 440, amp = 0.1, pan = 0;
		var env, snd;
		env = Env.perc(level: amp).kr(doneAction: 2);
		snd = Pulse.ar(freq, 0.25, 0.75);
		snd = snd * env;
		Out.ar(out, Pan2.ar(snd, pan));
	}).add;
	SynthDef(\metronome, { |out = 1, freq = 440, amp|
		var nb = 10;
		Out.ar(out,
			Klang.ar(`[
				Array.fill(nb, {|x| 1.4 ** x }) + freq,
				Array.fill(nb, {|x| 3 ** x.neg })
			])
			* Env.perc(level:amp).kr(doneAction: 2)
		);
	}).add;
}

play{SinOsc.ar(440, 0, 6)}