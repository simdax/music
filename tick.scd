(
durations: r{ |self|
	var start = thisProcess.mainThread.seconds;
	loop {
		var res = thisProcess.mainThread.seconds - start;
		start = thisProcess.mainThread.seconds;
		self.last = start;
		res.yield;
	};
},
last: 0,
ticks: [],
launch_process: { |self|
	Routine({
		loop {
			var dur = thisProcess.mainThread.seconds - self.last;
			if (dur > 2) {
				self.texts.heart_beat.string_(
					"tu n'as pas tape depuis " ++ dur.asStringPrec(3) ++ "sec"
 				);
			};
			2.yield;
		}
	}).play(AppClock)
},
add_count: { |self|
	var dur = self.durations.next(self);
	self.ticks = self.ticks.add(dur);
	if (self.ticks.size > 5)
	{
		self.ticks = self.ticks[1..5];
		TempoClock.tempo = 1 / self.tempo;
	};
	self.texts.heart_beat.string_(dur.asStringPrec(3));
},
tempo: { |self|
	var res = self.ticks[1..(self.ticks.size - 1)].mean;
	self.texts.tempo.string = ("tempo = " + (60 / res));
	res;
},
variance: { |self|
	var a = self.ticks;
	(a - a.mean).squared.sum / (a.size - 1)
},
precision: { |self|
	self.variance / self.tempo;
}
)
