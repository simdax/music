{ |vars, stats|
	{ |char|
		var val;
		switch (char)
		{$q} {
			vars.finish;
		}
		{$4} {val = -1}
		{$6} {val = 1}
		{$0} {val = 2}
		{$ } {
			val = 0;
			vars.add_count;
			vars.tempo;
		}
		//default
		{
			val = nil
		};
		val
	}
}