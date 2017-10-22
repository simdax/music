// {
// 	var note, diff;
// 	var basse = [0, -3, 3];
// 	~last ?? { ~last = ~note };
// 	note = (~note + [2, -2].choose);
// 	diff = (note - ~last).wrap(-3, 3);
// 	// if (diff == -3) {diff = diff + 3};
// 	// if (diff > 2)  {diff = diff - 3};
// 	diff;
// }
{
	var next = ~next !? {~next - thisThread.seconds} ?? {0};
	var note = ~notes[~index] % 7;
	if (next < 0.4) { note = ~notes@@(~index + 1) % 7};
	note.postln; next.postln;
	case
	{[0, 2].includes(note)} {0}
	//{[0, 2, 4].includes(note)}
	{-3}
}
