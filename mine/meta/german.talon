mode: user.german
-
settings():
    speech.language = "de_DE"
    speech.engine = "webspeech"
<user.text>:
	app.notify("German Mode")
    auto_insert(user.text)
    auto_insert(" ")

enter: key(enter)
(Punkt|.): key(backspace . space)
(Komma|,): key(backspace , space)
(Fragezeichen|?): key(backspace ? space)
(Ausrufezeichen|!): key(backspace ! space)
