(
Pdef(\bob, Pbind(
	\amp, 1.5,
	\note, -20,
	\dur, 1,
	\legato, 1
));

SynthDef(\metronome, {
	Out.ar(0,
		Klang.ar(`[Array.series(3, 100, 500), Array.linrand(3, 0.01, 0.1)])
		* EnvGen.kr(Env.perc, doneAction: 2)
	);
}).add(\global);

)