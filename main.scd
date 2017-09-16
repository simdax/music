(
var stats = ();
var vars = "vars".my_load(stats);
var mel = "mel".my_load(vars, stats);
var colors = "interface/colors".my_load;
var window;
"synths".my_load(vars);
s.waitForBoot({
	s.latency = 0;
	EnvirGui(vars, 20);
	window = FlowView()
	.background_(colors.back)
	.keyDownAction_("keyDown".my_load(vars, mel, stats))
	.onClose_({Pdef.removeAll})
	.focus;
	vars.texts = "interface/texts".my_load(vars, window, colors.front);
});
)  