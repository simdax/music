{ |stats|
	(
		"tick".my_load ++
		"err_succ".my_load ++
		(
			finish: {
				"record".my_load(stats);
			},
			please_wait:{ |self|
				self.texts.instructions.string_("attends avant de taper comme un bourrin");
				{
					if(self.texts.instructions.string == "attends avant de taper comme un bourrin")
					{self.texts.instructions.string_("ecoute")};
				}.defer(1);
			},
			notes: [],
			durs: [],
			buttons: [],
			depart: 0,
			i: 0,
			nb: 3,
			size_mel: 11,
			set_size: 4,
			scale: [0, 2, 4, 7, 9],
			min: 0,
			max: 7,
			rythmes: [1,2],
			basse: 0,
		);
	)
}