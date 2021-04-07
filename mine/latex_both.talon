mode: dictation
mode: command
code.language: tex
-
(place holder|placeholder):
	auto_insert("$xxx$ ")
begin block [over]:
	user.latex_block("", "")
begin block <user.text> [over]:
	user.latex_block(user.formatted_text(user.text, "smash"), "")
equation (place holder|placeholder):
	user.latex_block("equation", "xxx.")
inline math:
	insert("$$")
	key(left)
item: "\\item "
math in: " \\in "
real numbers: "\\R"
natural numbers: "\\N"
math sum: "\\sum"
math size of:
	insert("||")
	key(left)
symbol {user.latex_symbol}:
	insert("\\{latex_symbol}")

casual {user.latex_symbol}:
	auto_insert("$\\{latex_symbol}$")
