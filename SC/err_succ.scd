(
listening: false,
last_round: false,
decoupe: [0],
errors: 0,
success: 0,
depart: 0,
last_step: 0,
failed: { |self|
	(instrument: \error).play;
	self.texts.score.string_("oh non ! Tu as" + self.errors + " erreurs");
	self.errors = self.errors + 1;
},
succeded: { |self|
	self.success = self.success + 1;
	self.texts.score.string_("bravo ! Tu as" + self.success + " success");
	if (self.last_round) {
		self.decoupe.removeAt(0);
		if (self.decoupe[1].isNil) {
			"ioio".postln;
			self.state_manager.state(\stats);
		};
	} {
		var decoupe = self.decoupe.last + self.nb;
		self.success = 0;
		if (decoupe >= self.size_mel) {
			decoupe = self.size_mel;
			self.last_round = true;
			self.state_manager.last_round;
		} {
			self.decoupe = self.decoupe.add(decoupe);
		};
	};
}
)