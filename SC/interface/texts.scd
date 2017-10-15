{ |vars, w, front_color|
	var text = {|text|
		StaticText(w, 240@150)
		.background_(front_color)
		.string_(text);
	};
	(
		intro:	text.("Bats la mesure grace a la barre d'espace
C'est toi qui choisis le tempo
En meme temps, reproduis la melodie a l'aide des touches 4 et 6
Quitte a tout moment en appuyant sur Q.
"),
		tempo: text.("tempo = "),
		man: text.("mode manuel :  false"),
		instructions: text.("en attente. barre d'espace pour commencer"),
		score: text.("score"),
		heart_beat: text.("tiens le rythme bebe!"),
	);
}