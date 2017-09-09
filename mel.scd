{ |vars|
	var intervalles = "buttons.scd".resolveRelative.load;
	var f = { |n, min, max|
		(min..max).scramble.keep(n.asInt)
	};

	(
		go: {
			var mel = f.value(vars.set_size, vars.min, vars.max);
			vars.i = 0;
			vars.notes = [];
			vars.durs = [];
			if (vars.t.notNil)
			{
				vars.t.string_("ecoute");
			};
			Pfset({},
				Pbind(
					\amp, 0.5,
					\degree, Prand(mel, vars.nb),
					\dur, 1 / Prand(vars.rythmes, inf),
					\tempo, 1,
					\finish, Pfunc({ |ev|
						vars.notes = vars.notes.add(ev.degree);
						vars.durs = vars.durs.add(ev.dur);
					})
				),
				{
					defer({
						vars.listening = true;
						vars.t.string_("reproduis");
						vars.buttons = intervalles.(vars.notes);
					}, 0.1);
				}
			).play(quant: 4)
		},
		again: { |self, time|
			vars.listening = false;
			defer({self.go}, 1);
		}
	)
};
