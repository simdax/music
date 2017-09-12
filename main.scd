(
var vars = "vars.scd".resolveRelative.load;
var a = "mel.scd".resolveRelative.load.value(vars);
var succes;
var echecs;

"pdefs.scd".resolveRelative.load;
Event.addParentType(\note, (dur: 0.1, amp: 0.5, scale: vars.scale));
s.boot;
s.latency = 0;
Window.closeAll;

w = FlowView();
// z = EnvirGui(vars, 13, w, 400@300)
// .putSpec(\max, [-10, 10, \lin, 1])
// .putSpec(\min, [-10, 10, \lin, 1]);
StaticText(w, 400@100).string_("
Bats la mesure grace a la barre d'espace
C'est toi qui choisis le tempo
En meme temps, reproduis la melodie a l'aide des touches 4 et 6
");
u = StaticText(w, 400@100)
.string_("tempo = ")
;
t = StaticText(w, 400@100)
.string_("en attente. Tape quatre temps pour commencer")
;
vars.t = t;
vars.u = u;
w.view.keyDownAction_("keyDown.scd".resolveRelative.load.value(vars, a));
w.focus;
)

