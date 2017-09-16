(
//started: false,
listening: false,
last_round: false,
errors: 0,
success: 0,
depart: 0,
last_step: 0,
failed: { |self|
	(instrument: \error).play;
	self.texts.score.string_("oh non ! Tu as" + self.errors + " erreurs");
	self.errors = self.errors + 1;
	case
	{self.errors > 1} {
		self.nb = self.nb - 1;
	}
},
succeded: { |self|
	self.success = self.success + 1;
	self.texts.score.string_("bravo ! Tu as" + self.success + " success");
	if (self.last_round) {
		self.last_step = self.last_step + 1;
		self.nb = self.decoupe[self.last_step];
		if (self.nb == nil) {self.finish};
	} {
		var decoupe = self.decoupe.last + self.nb;
		self.success = 0;
		if (decoupe >= self.size_mel) {
			decoupe = self.size_mel;
			self.last_round = true;
			self.depart = 0;
			self.nb = self.decoupe[1];
		}
		{
			self.depart = decoupe + 1;
			if (self.errors > 1)
			{
				self.nb = self.nb + self.errors - 1;
				self.errors = 0;
			};
		};
		self.decoupe = self.decoupe.add(decoupe);
	};
}
)