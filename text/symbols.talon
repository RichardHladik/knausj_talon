question [mark]: "?"
score: "_"
double dash: "--"
triple quote: '"""'
triple tick: "'''"
gravy: "```"
(dot dot | dotdot): ".."
ellipses: "..."
(comma and | spamma): ", "
plus: "+"
arrow: "->"
dub arrow: "=>"
new line: "\\n"
carriage return: "\\r"
line feed: "\\r\\n"
end of file: "EOF"
semtex: "; "

empty (string|quotes):
    insert('""')
    key(left)
empty escaped (string|quotes):
    insert('\\"\\"')
    key(left)
    key(left)
empty ticks:
    "''"
    key(left)
empty escaped ticks:
    insert("\\'\\'")
    key(left)
    key(left)
(empty parens | args):
    insert("()")
    key(left)
empty (squares | list):
    insert("[]")
    key(left)
empty (bracket | braces):
    insert("{}")
    key(left)
empty percent:
    insert("%%")
    key(left)
empty coals:
    insert("::")
    key(left)

[pair] (parens|args):
    insert("()")
    edit.left()
[pair] (brackets|braces): 
    insert("{}")
    edit.left()
[pair] squares: 
    insert("[]")
    edit.left()
[pair] angles: 
    insert("<>")
    edit.left()
[pair] graves: 
    insert("``")
    edit.left()
[pair] percents: 
    insert("%%")
    edit.left()
[pair] ticks: 
    insert("''")
    edit.left()
[pair] quotes: 
    insert('""')
    edit.left()

# XXX - add support for additional text navigation options?
angle that:
    text = edit.selected_text()
    user.paste("<{text}>")
(bracket | brace) that:
    text = edit.selected_text()
    user.paste("{{{text}}}")
(parens | args) that:
    text = edit.selected_text()
    user.paste("({text})")
percent that:
    text = edit.selected_text()
    user.paste("%{text}%")
quote that:
    text = edit.selected_text()
    user.paste('"{text}"')
