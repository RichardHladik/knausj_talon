mode: user.czech
-
<user.text>:
	app.notify("Czech Mode")
    auto_insert(user.text)
    auto_insert(" ")

enter: key(enter)
(tečka|.): key(backspace . space)
(čárka|,): key(backspace , space)
(otazník|?): key(backspace ? space)
(vykřičník|!): key(backspace ! space)
závorka: "("
konec závorky:
	key(backspace)
	auto_insert(")")
(tři tečky|...):
	key(backspace)
	"… "
I: "i "
