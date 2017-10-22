{ |midiout|
	var rhythmGen = "generateRhythm.scd".loadRelative[0];
	var pdef, touchs;
	var taille = 8;
	~index = 0;
	~notes   = Array.fill(taille, {4.rand});
	~rythmes = rhythmGen(3);
	pdef = Pdef(\c, Pbind(
		\type, \midi,
		\midiout, midiout,
		\chan, 0,
		\amp, 2,
		\index, Pseries(),
		\degree, Pseq(~notes, inf),
		\dur, Pseq(~rythmes, inf) * rrand(0.5, 0.8),
		\finish, Pfunc{ |ev|
			~next = thisThread.seconds + ev.dur;
			~index = ev.index % taille;
			true
		}
	));
	touchs = "touchs.scd".loadRelative[0].value(pdef, midiout);
}
n