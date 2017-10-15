{ |window, vars, mel, stats, colors|
	(
		state: { |self, state|
			window.children.do(_.remove);
			self.states[state].value(self);
			window.reflowAll;
		},
		last_round: {
			window.background_(colors.alert);
		},
		states: (
			menu: { |self|
				var button = Button(window, 50@50);
				var options = EnvirGui((
					'taille de la melodie': vars.size_mel
				), 2, window)
				.putSpec('taille de la melodie', [1, 15, \lin, 1])
				//			.paramViews[0].bounds)
				;
				var action = {
					button.remove;
					options.zone.remove;
					self.state(\game);
				};
				window
				.background_(colors.menu)
				.keyDownAction_{
					window.view.parent.destroy;
				};
				button.action = action;
			},
			game: { |self|
				window
				.background_(colors.back)
				.keyDownAction_("keyDown".my_load(vars, mel, stats))
				.onClose_{Pdef.removeAll}
				.focus;
				vars.texts = "interface/texts".my_load(vars, window, colors.front);
			},
			stats: { |self|
				"record".my_load(stats);
			},
		)
	)
}