{ |vars, stats|
	var f = { |n, min, max|
		(min..max).scramble.keep(n.asInt)
	};
	// for stats
	var keys = [\notes, \durs, \success, \errors, \nb, \basse, \ticks];
	// mel
	var mel;
	var rythme;
	var size = vars.size_mel;
	mel = Array.rand(size + 1, -2, 2);
	rythme = Array.rand(size + 1, 1, 2);
	// final object
	(
		go: { |self, gen = true|
			var range;
			var arrivee;
			vars.texts.instructions.string_("ecoute et arrete la melodie avec la barre d'espace");
			vars.i = 0;
			if (gen) {
				arrivee = vars.depart + vars.size_mel;
			} {
				arrivee = vars.depart + vars.nb;
			};
			vars.notes = mel[vars.depart..arrivee];
			vars.durs = rythme[vars.depart..arrivee];
			Pdef(\mel_inf, Pdef(\mel).repeat(inf)).play;
		},
		again: { |self, time|
			var basse = vars.basse;
			keys.do({ |k|
				stats[k] = stats[k].add(vars[k]);
			});
			vars.listening = false;
			while {vars.basse == basse} {vars.basse = 6.rand};
			{self.go(false)}.defer(1 / TempoClock.tempo);
		}
	)
};
