{ |vars, a|
	{ |view, char|
		var val;
		switch (char)
		{$4} {val = -1}
		{$6} {val = 1}
		{$ } {
			val = 0;
			vars.tempo;
			vars.add_count;
		}
		{
			val = nil
		};
		if (vars.i == 0) {
			vars.first_button = val;
		};
		if (val == 0) {
			(instrument: \metronome).play;
			if (vars.ticks.size == 4) {
				a.go;
			};
		};
		if (val == 1 || val == -1) {
			if (vars.listening && val.isNumber) {
				var error = false;
				if (vars.buttons[vars.i] == 0) {
					vars.buttons[vars.i] = vars.first_button;
				};
				if (vars.buttons[vars.i] == val) {
					(degree: vars.notes[vars.i]).play;
				} {
					error = { LFSaw.ar(500, 1, 0.1) }.play;
					defer({error.free}, 0.3);
					vars.errors = vars.errors + 1;
					vars.t.string_("oh non ! Tu as" + vars.errors + " erreurs");
					a.again;
				};
				if (error == false && vars.notes[vars.i + 1].isNil) {
					vars.success = vars.success + 1;
					vars.t.string_("bravo ! Tu as" + vars.success + " success");
					if (vars.success > 2) {vars.nb = vars.nb + 1; vars.success = 0;};
					a.again;
				} {
					vars.i = vars.i + 1;
				};
			} {
				vars.t.string_("attends avant de taper comme un bourrin");
				{
					if(vars.t.string == "attends avant de taper comme un bourrin")
					{vars.t.string_("ecoute")};
				}.defer(1);
			}
		};
	}
}