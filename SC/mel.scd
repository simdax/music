{ |vars, stats|
	var f = { |n, min, max|
		(min..max).scramble.keep(n.asInt)
	};
	// for stats
	var keys = [\notes, \durs, \success, \errors, \nb, \basse, \ticks];
	// mel
	vars.notes = Array.rand(vars.size_mel + 1, -2, 2);
	vars.durs = Array.rand(vars.size_mel + 1, 1, 2);
	// final object
	(
		go: { |self|
			var range;
			var arrivee;
			vars.texts.instructions.string_("ecoute et arrete la melodie avec la barre d'espace");
			if (vars.man.not) {
				if (vars.beg) {
					Pdef(\mel).play;
				}{
					Pdef(\mel).stop;
				}
			};
		},
		again: { |self, time|
			var basse = vars.basse;
			keys.do({ |k|
				stats[k] = stats[k].add(vars[k]);
			});
			vars.man = false;
			vars.beg = true;
			vars.listening = false;
			while {vars.basse == basse} {vars.basse = 6.rand};
			{self.go}.defer(0.2);
		}
	)
};
