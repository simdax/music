{ |vars|
	{ |char|
		var val;
		switch (char)
		{$q} {
			Window.closeAll;
			s.quit;
		}
		{$4} {val = -1}
		{$6} {val = 1}
		{$0} {val = 2}
		{$ } {
			val = 0;
			vars.add_count;
			vars.tempo;
		} {
			val = nil
		};
		val
	}
}