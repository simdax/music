(
var stats = ();
var state_manager;
var vars;
var mel;
var colors;
var window;
window = FlowView(nil, 500@500);
colors = "interface/colors".my_load;
vars = "vars".my_load(stats);
mel = "mel".my_load(vars, stats);
vars.state_manager = "state_manager".my_load(window, vars, mel, stats, colors);
"synths".my_load(vars);
s.waitForBoot({
	s.latency = 0;
	vars.state_manager.state(\menu);
});
)
