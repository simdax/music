(
var vars = "vars.scd".resolveRelative.load;
var mel = "mel.scd".resolveRelative.load.value(vars);
var w;
var back_color = Color.hsv(0, 0.1, 0.2);
var front_color = Color.hsv(0, 0.2, 0.5);
var text = {|text|
	StaticText(w, 400@100)
	.background_(front_color)
	.string_(text);
};

s.boot;
s.latency = 0;
"pdefs.scd".resolveRelative.load;
Event.addParentType(\note, (dur: 0.1, amp: 0.5, scale: vars.scale));
Window.closeAll;

w = FlowView()
.background_(back_color)
;
// EnvirGui(vars, 13, w, 400@300)
// .putSpec(\max, [-10, 10, \lin, 1])
// .putSpec(\min, [-10, 10, \lin, 1]);
text.("Bats la mesure grace a la barre d'espace
C'est toi qui choisis le tempo
En meme temps, reproduis la melodie a l'aide des touches 4 et 6
");
vars.u = text.("tempo = ");
vars.t = text.("en attente. Tape quatre temps pour commencer");
w.view.keyDownAction_("keyDown.scd".resolveRelative.load.value(vars, mel));

w.focus;
)
