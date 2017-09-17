{ |vars|
	var intervalles = "buttons".my_load;
	Event.addParentType(\note,
		(instrument: \harpsichord, dur: 0.1, amp: 0.5, scale: vars.scale)
	);
	Pdef(\mel,
		Pfset({
			vars.mel = [];
			~io = thisThread.beats;
		},
		Plazy{
			Pbind(
				\degree, Pseq(vars.notes.rotate(vars.j), inf),
				\dur, 1 / Pseq(vars.durs.rotate(vars.j), inf),
				\finish, Pfunc{ |ev|
					vars.nb = vars.nb + 1;
					vars.j = vars.nb % vars.size_mel;
					vars.mel = vars.mel.add(ev.degree);
					true;
				}
			).finDur(vars.dur ? inf)
		},
		{
			vars.dur = thisThread.beats - ~io;
			vars.listening = true;
			{vars.texts.instructions.string_("reproduis")}.defer;
			vars.buttons = intervalles.(vars.mel);
		})
	);
	SynthDef(\error, {
		Out.ar(0,
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
	SynthDef(\metronome, { |freq = 440, amp|
		var nb = 10;
		Out.ar(0,
			Klang.ar(`[
				Array.fill(nb, {|x| 1.4 ** x }) + freq,
				Array.fill(nb, {|x| 3 ** x.neg })
			])
			* Env.perc(level:amp).kr(doneAction: 2)
		);
	}).add;
}
