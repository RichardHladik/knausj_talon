tag: browser
win.title: /DuckDuckGo/
-
google that:
	mimic("focus input")
	edit.line_end()
	insert(" !g\n")
