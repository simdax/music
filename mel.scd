{ |vars, stats|
	var intervalles = "buttons.scd".resolveRelative.load;
	var f = { |n, min, max|
		(min..max).scramble.keep(n.asInt)
	};
	// for stats
	var keys = [\notes, \durs, \success, \errors, \nb, \basse, \ticks];
	//mel
	var mel;
	var rythme;
	var size = 14;
	mel = Array.rand(size + 1, -2, 2);
	rythme = Array.rand(size + 1, 1, 2);
	//final object
	(
		go: { |self, gen = true|
			var range;
			var arrivee;
			if (vars.nb == size) {
				"fini".post;
				0.exit;
			};
			if ((vars.depart + vars.nb) > size) {
				vars.depart = 0
			};
			arrivee = vars.depart + vars.nb;
			range = (vars.depart..arrivee);
			vars.texts.instructions.string_("ecoute");
			vars.i = 0;
			vars.notes = mel[range];
			vars.durs = rythme[range];
			vars.texts.instructions.string_("nouvelle melodie");
			Pfset({},
				Pbind(
					\degree, Pseq(vars.notes),
					\dur, Pseq(vars.durs),
				),
				{
					vars.listening = true;
					{vars.texts.instructions.string_("reproduis")}.defer;
					vars.buttons = intervalles.(vars.notes);
			}).play(quant: 1)
		},
		again: { |self, time|
			var basse = vars.basse;
			keys.do({ |k|
				stats[k] = stats[k].add(vars[k]);
			});
			vars.listening = false;
			while {vars.basse == basse} {vars.basse = 6.rand};
			{self.go}.defer(1 / TempoClock.tempo);
		}
	)
};
