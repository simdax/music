{ |vars, mel, stats|
	var interface = "interface.scd".resolveRelative.load.value(vars, stats);
	{ |view, char|
		var val = interface.value(char);
		if (vars.i == 0) {
			vars.first_button = val;
		};
		case
		{ val == 0 } {
			(instrument: \metronome, degree: vars.basse).play;
			if (vars.ticks.size == 4) {
				vars.launch_process;
				mel.go;
			};
		}
		{ val == 2 && vars.listening } {
			vars.listening = false;
			mel.go(false);
		}
		{(val == 1) || (val == -1)} {
			if (vars.listening && val.isNumber) {
				var error = false;
				if (vars.buttons[vars.i] == 0) {
					vars.buttons[vars.i] = vars.first_button;
				};
				if (vars.buttons[vars.i] == val) {
					(degree: vars.notes[vars.i]).play;
				} {
					error = (instrument: \error).play;
					vars.errors = vars.errors + 1;
					vars.texts.score.string_("oh non ! Tu as" + vars.errors + " erreurs");
					if (vars.errors > 1) {
						vars.nb = vars.nb - 1;
						vars.errors = 0;
						vars.depart = 0;
					};
					mel.again;
				};
				if (error == false && vars.notes[vars.i + 1].isNil) {
					vars.success = vars.success + 1;
					vars.texts.score.string_("bravo ! Tu as" + vars.success + " success");
					if (vars.success > 2) {
						vars.nb = vars.nb + 1;
						vars.success = 0;
					};
					vars.depart = vars.depart + vars.nb + 1;
					mel.again;
				} {
					vars.i = vars.i + 1;
				};
			} {
				vars.texts.instructions.string_("attends avant de taper comme un bourrin");
				{
					if(vars.texts.instructions.string == "attends avant de taper comme un bourrin")
					{vars.texts.instructions.string_("ecoute")};
				}.defer(1);
			}
		};
	}
}