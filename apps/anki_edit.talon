app: Anki
win.title: Add
win.title: Edit Current
win.title: /Browse .* card/
mode: user.german
mode: user.czech
mode: command
mode: dictation
-
tag(): user.anki_edit
der: auto_insert("r")
die: auto_insert("e")
das: auto_insert("s")
aussprechen|rede|Rede: user.german_pronounce()
Definition: user.german_paste()
beide: user.german_both()
alle|alles: user.german_all()
stimmt: user.german_czech_translation()
gut:
	key("ctrl-enter")
	sleep(500ms)
	key("tab")
reinigen:
	key("ctrl-a backspace tab")
	key("ctrl-a backspace tab")
	key("ctrl-a backspace tab")
	key("shift-tab")
	key("shift-tab")
suche das:
	user.german_open_wiktionary(edit.selected_text())
google das:
	user.quick_url_current("{edit.selected_text()} !g")

platí:
	key("ctrl-enter")

dobře:
	key("ctrl-enter")
	sleep(500ms)
	key("tab")
	user.switch_mode("user.german")
