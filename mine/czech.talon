mode: user.czech
-
<user.text>:
    user.system_command('notify-send.sh -t 3000 -f -u low "Czech Mode"')
    insert(user.text)
    insert(" ")

enter: key(enter)
(tečka|.): key(backspace . space)
(čárka|,): key(backspace , space)
(otazník|?): key(backspace ? space)
(vykřičník|!): key(backspace ! space)
závorka: "("
konec závorky:
	key(backspace)
	insert(")")
(tři tečky|...):
	key(backspace)
	"… "
I: "i "
