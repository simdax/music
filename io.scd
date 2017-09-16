(
started: false,
listening: false,
errors: 0,
success: 0,
last_round: false,
error: { |self|
	(instrument: \error).play;
	self.texts.score.string_("oh non ! Tu as" + self.errors + " erreurs");
	self.errors = self.errors + 1;
	case
	{self.errors > 1} {
		self.nb = self.nb - 2;
	}
	{self.errors > 2} {
		self.errors = 0;
		self.depart = 0;
	};
},
succeded: { |self|
	self.success = self.success + 1;
	self.texts.score.string_("bravo ! Tu as" + self.success + " success");
	if (self.success > if(self.last_round, 2, 0)) {
		self.nb = self.nb + 2;
		self.success = 0;
	};
	self.depart = self.depart + self.nb + 1;
},
please_wait:{ |self|
	self.texts.instructions.string_("attends avant de taper comme un bourrin");
	{
		if(self.texts.instructions.string == "attends avant de taper comme un bourrin")
		{self.texts.instructions.string_("ecoute")};
	}.defer(1);
}
)