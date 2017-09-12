{ |vars, mel|
	var interface = "interface.scd".resolveRelative.load.value(vars);
	{ |view, char|
		var val = interface.value(char);
		val.postln;
		if (vars.i == 0) {
			vars.first_button = val;
		};
		if (val == 0) {
			(instrument: \metronome).play;
			if (vars.ticks.size == 4) {
				mel.go;
			};
		};
		if ((val == 1) || (val == -1)) {
			if (vars.listening && val.isNumber) {
				var error = false;
				if (vars.buttons[vars.i] == 0) {
					vars.buttons[vars.i] = vars.first_button;
				};
				if (vars.buttons[vars.i] == val) {
					(degree: vars.notes[vars.i]).play;
				} {
					error = { LFSaw.ar(500, 1, 0.1) }.play;
					{error.free}.defer(0.3);
					vars.errors = vars.errors + 1;
					vars.t.string_("oh non ! Tu as" + vars.errors + " erreurs");
					mel.again;
				};
				if (error == false && vars.notes[vars.i + 1].isNil) {
					vars.success = vars.success + 1;
					vars.t.string_("bravo ! Tu as" + vars.success + " success");
					if (vars.success > 2) {vars.nb = vars.nb + 1; vars.success = 0;};
					mel.again;
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