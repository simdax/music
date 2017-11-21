(
MIDIClient.init;
CmdPeriod.add{
	16.do { |c|
		MIDIOut(0).allNotesOff(c)
	}
}
)

(
var proto = (
	type: \midi,
	midiout: MIDIOut(0),
	amp: 0.5
);

var parse = { |v, k|
	var res = (
		melodie: v.collectAs(_.value, Array)
	)[k] ? v;
	Pseq(res, inf);
};
d = Music(0);

OSCdef('io', {
	d.update;
	Pdef(\0, Pbind(*d.dict.collect{|v, k|
		Pdefn(k, parse.(v, k))
	}.asPairs ++ proto.asPairs));
},'update');

)

(
var note = 0;
(
Pbind(
	\degree, Pfunc{ |ev|
		(
			$x: {
				note = note + [0, 1,-1].choose;
			},
			$o: {
				note = [0, 2, 4].choose;
			}
		)[ev.melodie].value;
		note
	}
) <> Pdef(\0)).trace.play()

)

Pdef(\0).play