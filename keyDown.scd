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
					vars.failed;
					mel.again;
				};
				if (error == false && vars.notes[vars.i + 1].isNil) {
					vars.succeded;
					mel.again;
				} {
					vars.i = vars.i + 1;
				};
			} {
				vars.please_wait;
			}
		};
	}
}
