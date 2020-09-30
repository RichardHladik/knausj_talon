mode: user.czech
-
<user.text>:
	app.notify("German Mode")
    insert(user.text)
    insert(" ")

enter: key(enter)
(Punkt|.): key(backspace . space)
(Komma|,): key(backspace , space)
(Fragezeichen|?): key(backspace ? space)
(Ausrufezeichen|!): key(backspace ! space)
