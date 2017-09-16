{ |vars, stats|
	{ |char|
		var val;
		switch (char)
		{$q} {
			Window.closeAll;
			"record".my_load(stats);
			s.quit;
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