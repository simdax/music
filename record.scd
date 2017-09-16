{ |stats|
	var w;
	if(stats.isEmpty.not) {
		w = FlowView(nil, 500@500)
		.keyDownAction_({w.parent.close});
		StaticText(w, 150@100).string_("stats");
		stats.keysValuesDo({ |k, v, i|
			StaticText(w, 50@20).string_(k);
			Plotter(bounds: Rect(0, 0, 100, 150 * (i.size + 1)), parent:w).value_(v);
		});
	}
}