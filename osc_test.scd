(

var midiout = MIDIOut(0);
if(MIDIClient.initialized){}
{
	MIDIClient.init();
};
midiout.latency = 0;
/////GLOB SETTINGS
~default = (
	amp: 1,
	type: \midi,
	midiout: midiout
);
//PatternProxy.defaultQuant_(4);

//????// PDEFN
Pdefn( \batterie,
	Pseq([2, 1, 0, 1, 2, 0, 1, 1], inf)
);

////// PDEF
Pdef(\drum, Pbind(
	\midicmd, \noteOn,
	\note, 10,
	\hasGate, false,
	\amp, Pdefn(\batterie) * 0.35,
	\dur, 0.25
));
Pdef(\beat, Pbind(
	\hasGate, false,
	\amp, 0.8,
	\note, 31,
	\dur, 2
));
Pdef(\a, Pbind(
	\degree, Pdefn(\mel, Pseq([0], inf)),
	\dur, 5
)
.trace);

//////OSC FUNC
OSCdef(\newMel,
	{ | args |
		var mel = args[1..].collect(_.asInt);
		Pdefn(\mel, Pseq(mel, inf))
	},
	'foo/bar'
);
OSCdef(\drum,
	{ | args |
		"setting drum patt".postln;
		args[1..].postln;
		Pdefn(\batterie, Pseq(args.asInt[1..], inf))
	},
	'drum'
)
)


////SCORE
(
Pdef(\drum).play(protoEvent: ~default);
Pdef(\beat).play(protoEvent: ~default)
)