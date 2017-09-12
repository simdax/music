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
			vars.t.string_("ecoute");
			// Pfset({},
			// 	Pbind(
			// 		\amp, 0.5,
			// 		\degree, Prand(mel, vars.nb),
			// 		\dur, 1 / Prand(vars.rythmes, inf),
			// 		\finish, Pfunc({ |ev|
			// 			vars.notes = vars.notes.add(ev.degree);
			// 			vars.durs = vars.durs.add(ev.dur);
			// 		})
			// 	),
			// 	{
			// 		vars.listening = true;
			// 		vars.t.string_("reproduis");
			// 		vars.buttons = intervalles.(vars.notes);
			// }).play
		},
		again: { |self, time|
			vars.listening = false;
			defer({self.go}, 1 / TempoClock.tempo);
		}
	)
};
