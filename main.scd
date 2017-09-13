(
var vars = "vars.scd".resolveRelative.load;
var mel = "mel.scd".resolveRelative.load.value(vars);
var back_color = Color.hsv(0, 0.1, 0.2);
var front_color = Color.hsv(0, 0.2, 0.5);
var w;

Window.closeAll;
w = FlowView()
.background_(back_color)
;

s.boot;
s.latency = 0;
"pdefs.scd".resolveRelative.load;
Event.addParentType(\note, (dur: 0.1, amp: 0.5, scale: vars.scale));

// EnvirGui(vars, 13, w, 400@300)
// .putSpec(\max, [-10, 10, \lin, 1])
// .putSpec(\min, [-10, 10, \lin, 1]);
vars.texts = "interface/texts".my_load(vars, w, front_color);
w.view.keyDownAction_("keyDown.scd".resolveRelative.load.value(vars, mel));
w.focus
)
