{ |vars|
	{ |char|
		var val;
		switch (char)
		{$4} {val = -1}
		{$6} {val = 1}
		{$ } {
			val = 0;
			vars.add_count;
			vars.tempo;
		} {
			val = nil
		};
		char.postln;
		val
	}
}