mode: dictation
mode: command
code.language: tex
-
symbol <user.latex_casual_math>:
	insert("{latex_casual_math}")

casual <user.latex_casual_math>:
	auto_insert("${latex_casual_math}$ ")

begin block [over]:
	user.latex_block("", "")
begin block {user.latex_section} [over]:
	user.latex_block(user.latex_section, "")
inline math:
	insert("$$ ")
	key(left:2)
	user.switch_mode("command")
cerf|see reference|sire france|sera france:
	insert("\\cref{} ")
	key(left:2)
cap (cerf|see reference|sire france|sera france):
	insert("\\Cref{} ")
	key(left:2)
name (see reference|sire france|sera france):
	insert("\\namecref{} ")
	key(left:2)
label:
	insert("\\label{}")
	key(left)
footnote:
	insert("\\footnote{}")
	key(left)
cite:
	insert('\\cite{} ')
	key(left:2)
cite pit:
	insert('\\citep{} ')
	key(left:2)

item: "\\item "
add to do:
	insert("\\todo{}")
	key(left)

inline to do:
	insert("\\todo[inline]{}")
	key(left)
add gotcha:
	insert("\\gotcha{}")
	key(left)

emphasize: auto_insert("\\emph{")
end group:
	auto_insert("}")


placeholder:
	auto_insert("$xxx$ ")
equation placeholder:
	user.latex_block("equation", "xxx.")
