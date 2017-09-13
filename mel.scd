{ |vars|
	var intervalles = "buttons.scd".resolveRelative.load;
	var f = { |n, min, max|
		(min..max).scramble.keep(n.asInt)
	};
	(
		go: { |self, gen = true|
			var mel;
			vars.texts.instructions.string_("ecoute");
			if (gen) {
				mel = f.value(vars.set_size, vars.min, vars.max);
				vars.i = 0;
				vars.notes = [];
				vars.durs = [];
				"gen".postln;
			};
			Pfset({},
				Plazy {
					if (gen) {
						Pbind(
							\degree, Prand(mel, vars.nb),
							\dur, 1 / Prand(vars.rythmes, inf),
							\finish, Pfunc({ |ev|
								if (gen)
								{
									vars.notes = vars.notes.add(ev.degree);
									vars.durs = vars.durs.add(ev.dur);
								};
							})
					)} {
						Pbind(
							\degree, Pseq(vars.notes),
							\dur, Pseq(vars.durs),
						)
					}
				},
				{
					vars.listening = true;
					{vars.texts.instructions.string_("reproduis")}.defer;
					vars.buttons = intervalles.(vars.notes);
			}).play
		},
		again: { |self, time|
			vars.listening = false;
			{self.go}.defer(1 / TempoClock.tempo);
		}
	)
};
