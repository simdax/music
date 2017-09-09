(
var vars = (
	notes: [],
	durs: [],
	buttons: [],
	i: 0,
	nb: 3,
	set_size: 4,
	scale: [0, 2, 4, 5, 7, 9, 11],
	min: 0,
	max: 7,
	rythmes: [1,2,4,3,6,8,7],
	started: false,
	listening: false,
	errors: 0,
	success: 0
);
var a = "mel.scd".resolveRelative.load.value(vars);
var succes;
var echecs;

"pdefs.scd".resolveRelative.load;
Event.addParentType(\note, (dur: 0.1, amp: 0.5, scale: vars.scale));
s.boot;
s.latency = 0;
Window.closeAll;

w = FlowView();
z = EnvirGui(vars, 13, w)
.putSpec(\max, [-10, 10, \lin, 1])
.putSpec(\min, [-10, 10, \lin, 1]);
StaticText(w, 400@100).string_("reproduis la melodie a l aide des touches Q et D");
Button(w, 80@80)
.string_("metronome")
.action_({Pdef(\bob).toggle});
Button(w, 80@80)
.string_("melodie")
.action_({a.go});
t = StaticText(w, 400@300);
vars.t = t;
w.view.keyDownAction_({ | view, char|
	var val;
	if (char == $a) {val = -1} {
		if (char == $d) {val = 1}
		{val = nil}
	};
	if (i == 0)
	{
		vars.first = val;
	};
	if (vars.listening && val.isNumber) {
		var error = false;
		if (vars.buttons[vars.i] == 0)
		{
			vars.buttons[vars.i] == vars.first;
		};
		if (vars.buttons[vars.i] == val)
		{
			(degree: vars.notes[vars.i]).play;
		}
		{
			error = { LFSaw.ar(500, 1, 0.1) }.play;
			defer({error.free}, 0.3);
			vars.errors = vars.errors + 1;
			t.string_("oh non ! Tu as"+ vars.errors +" erreurs");
			a.again;
		};
		if(error == false && vars.notes[vars.i + 1].isNil)
		{
			vars.success = vars.success + 1;
			t.string_("bravo ! Tu as"+ vars.success +" success");
			if (vars.success > 2) {vars.nb = vars.nb + 1; vars.success = 0;};
			a.again;
		}
		{
			vars.i = vars.i + 1;
		}
	}
	{
//		vars.postln;
		t.string_("attends avant de taper comme un bourrin");
	};
});

)