(
main: Pfunc {
		var next = ~next !? {~next - thisThread.seconds} ?? {0};
		var note = ~notes[~index] % 7;
		if (next < 0.4) { note = ~notes@@(~index + 1) % 7};
		note.postln; next.postln;
		case
		{[0, 2].includes(note)} {0}
		// {[0, 2, 4].includes(note)}
		{-3}
},
turnAround: Pseq([0, -2, 1, -3], inf)

)