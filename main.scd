(
var stats = ();
var vars = "vars".my_load(stats);
var mel = "mel".my_load(vars, stats);
var back_color = Color.hsv(0, 0.1, 0.2);
var front_color = Color.hsv(0, 0.2, 0.5);
var window;

s.waitForBoot({
	s.latency = 0;
	window = FlowView()
	.background_(back_color)
	.keyDownAction_("keyDown".my_load(vars, mel, stats))
	.focus;
	"synths".my_load;
	vars.texts = "interface/texts".my_load(vars, window, front_color);
	Event.addParentType(\note,
		(instrument: \harpsichord, dur: 0.1, amp: 0.5, scale: vars.scale)
	);
});
)