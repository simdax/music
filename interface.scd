{ |vars, stats|
	{ |char|
		var val;
		switch (char)
		{$q} {
			Pdef(\mel).stop;
			vars.state_manager.state(\menu);
		}
		{$m} {
			vars.man = vars.man.not;
			vars.texts.man.string = "mode manuel : " + vars.man;
		}
		{$4} {val = -1}
		{$6} {val = 1}
		{$0} {val = 2}
		{$ } {
			val = 0;
			vars.beg = vars.beg.not;
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