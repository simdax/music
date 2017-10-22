(
var touchs;
var pdef;

if (MIDIClient.initialized.not) {
	MIDIClient.init;
};
s.waitForBoot({
	var midiout = "init.scd".loadRelative[0].value;
	var touchs = "pdef.scd".loadRelative[0].value(midiout);
	Window.closeAll;
	FlowView().front()
	.keyDownAction_{ |self, k|
		touchs[k].value;
	}
	.focus;
	"./jack_connect.sh".unixCmd { |a, b| a.postln; };
});
)