(
	notes: [],
	durs: [],
	buttons: [],
	i: 0,
	counter: Ptime().differentiate.asStream,
	ticks: [],
	add_count: { |self|
		self.ticks = self.ticks.add(self.counter.next);
		if(self.ticks.size > 5)
		{
			self.ticks = self.ticks[1..5];
		};
		TempoClock.tempo = 1 / self.tempo;
	},
	tempo: { |self|
		var res = self.ticks[1..(self.ticks.size - 1)].mean;
		self.u.string = ("tempo = " + (60 / res));
		res;
	},
	variance: { |self|
		var a = self.ticks;
		(a - a.mean).squared.sum / (a.size - 1)
	},
	precision: { |self|
		self.variance / self.tempo;
	},
	nb: 3,
	set_size: 4,
	scale: [0, 2, 4, 5, 7, 9, 11],
	min: 0,
	max: 7,
	rythmes: [1,2],
	started: false,
	listening: false,
	errors: 0,
	success: 0
);