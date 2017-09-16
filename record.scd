{ |stats|
	var w;
	Window.closeAll;
	if(stats.isEmpty.not) {
		w = FlowView(nil, 500@500)
		.keyDownAction_({
			w.parent.close;
			s.quit;
		});
		StaticText(w, 400@100)
		.string_("Finis")
		.align_(\center)
		.stringColor_(Color.red)
		.font_(Font(Font.availableFonts.choose, 40));
		stats.keysValuesDo({ |k, v, i|
			StaticText(w, 50@20).string_(k);
			Plotter(bounds: Rect(0, 0, 100, 150 * (i.size + 1)), parent:w).value_(v);
		});
	}
}