{ |pdef, midiout|
	var totalStop = {
		Pdef(\mel).stop;
		Pdef(\acc).stop;
		midiout.allNotesOff(0);
		midiout.allNotesOff(1);
	};
	var root = 48;
	var algos = "algo.scd".loadRelative[0];
	var note = PdegreeToKey(
		Pdefn(\algos, algos.turnAround), Scale.at(\major)
	).iter;
	// return object
	(
		$c: {
			Pdef(\mel).play;
		},
		$q: {
			totalStop.();
		},
		$w: {
			midiout.allNotesOff(1);
			Pdef(\acc).stop;
		},
		$ : {
			midiout.allNotesOff(1);
			~basse = note.next();
			midiout.noteOn(1, root + ~basse, 10);
			Pdef(\acc).play
		}
	)
}