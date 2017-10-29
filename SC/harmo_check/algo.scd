(
main: Pfunc {
	var next = ~next !? {~next - thisThread.seconds} ?? {0};
	var note = ~notes[~index] % 7;
	if (next < 0.2) { note = ~notes@@(~index + 1) % 7};
	Console.log(note, 31);
	case
	{[0, 2].includes(note)} {0}
	{-3}
},
turnAround: Pseq([0, -2, 1, -3], inf)
)