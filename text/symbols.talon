question [mark]: "?"
(downscore | underscore): "_"
double dash: "--"
#(bracket | brack | left bracket): "{"
#(rbrack | are bracket | right bracket): "}"
triple quote: '"""'
triple tick: "'''"
(dot dot | dotdot): ".."
#ellipses: "…"
ellipses: "..."
(comma and | spamma): ", "
plus: "+"
arrow: "->"
dub arrow: "=>"
new line: "\\n"
carriage return: "\\r"
line feed: "\\r\\n"
empty (string|quotes):
    '""'
    key(left)
empty escaped (string|quotes):
    '\\"\\"'
    key(left)
    key(left)
empty ticks:
    "''"
    key(left)
empty escaped ticks:
    "\\'\\'"
    key(left)
    key(left)

(inside parens | args):
	insert("()")
	key(left)
inside (squares | list):
	insert("[]")
	key(left)
inside (bracket | braces):
	insert("{}")
	key(left)
inside percent:
	insert("%%")
	key(left)
inside quotes:
	insert('""')
	key(left)
angle this:
    text = edit.selected_text()
    user.paste("<{text}>")
(bracket | brace) this:
    text = edit.selected_text()
    user.paste("{{{text}}}")
(parens | args) this:
    text = edit.selected_text()
    user.paste("({text})")
percent this:
    text = edit.selected_text()
    user.paste("%{text}%")
quote this:
    text = edit.selected_text()
    user.paste('"{text}"')
