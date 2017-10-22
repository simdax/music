{ |pdef, midiout|
	var note = PdegreeToKey(
		Pfunc("algo.scd".loadRelative[0]), Scale.at(\major)
	).iter;
	var root = 49;
	(
		$c: {
			pdef.play;
		},
		$q: {
			pdef.stop;
			Pdef(\acc).stop;
			midiout.allNotesOff(0);
			midiout.allNotesOff(1);
		},
		$ : {
			midiout.allNotesOff(1);
			midiout.noteOn(1, root + note.next(), 10);
			Pdef(\acc).play
		}
	)
}
