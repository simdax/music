{ |vars|
	var intervalles = "buttons".my_load;
	var midiout = MIDIOut(0);
	midiout.latency = 0;
	Event.addParentType(\note,
		(
			type: \midi,
			midiout: midiout,
			chan: 0,
			instrument: \harpsichord, dur: 0.1, amp: 0.5, scale: vars.scale)
	);
	Pdef(\mel,
		Pfset({
			vars.i = 0;
			vars.mel = [];
			vars.nb = 0;
			~io = thisThread.beats;
		},
		Plazy{
			var fin = if (vars.last_round, vars.decoupe[1], inf);
			Pbind(
				\chan, 1,
				\degree, Pseq(vars.notes.rotate(vars.decoupe.last), inf),
				\dur, 1 / Pseq(vars.durs.rotate(vars.decoupe.last), inf),
				\finish, Pfunc{ |ev|
					vars.nb = vars.nb + 1;
					vars.mel = vars.mel.add(ev.degree);
					true;
				}
			).fin(fin)
		},
		{
			vars.man = true;
			vars.listening = true;
			{vars.texts.instructions.string_("reproduis")}.defer;
			vars.buttons = intervalles.(vars.mel);
		})
	);
}