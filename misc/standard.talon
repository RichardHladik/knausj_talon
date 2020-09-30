dragon words: "<dgnwords>"
dragon dictation: "<phrase>"
slap: key(enter)
#slap:
#	edit.line_end()
#key(enter)
cd: "cd "
dot pie: ".py"
dot talon: ".talon"
dot mark down: ".md"
dot shell: ".sh"
dot vim: ".vim"
dot see: ".c"
run vim: "vim "
run make: "make\n"
run make (durr | dear): "mkdir "
(jay son | jason ): "json"
(http | htp): "http"
tls: "tls"
M D five: "md5"
(regex | rejex): "regex"
(parens|args):
	insert("()")
	key(left)
(block|brackets):
	insert("{}")
	key(left enter enter up tab)
#comment see: "// "
word queue: "queue"
word eye: "eye"
word iter: "iter"
word no: "NULL"
word cmd: "cmd"
word dup: "dup"
word streak:
	insert("streq()")
	key(left)
word printf: "printf"
word shell: "shell"
dunder in it: "__init__"
args:
	insert("()")
	key(left)
[inside] (index | array):
	insert("[]")
	key(left)
empty array: "[]"
list in it:
	insert("[]")
	key(left)
(dickt in it | inside bracket | in bracket):
	insert("{}")
	key(left)
block:
	insert("{}")
	key(left enter enter up tab)
(in | inside) percent:
	insert("%%")
	key(left)
string U T F eight:
	insert("'utf8'")
state past: "pass"
zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_out()
(page | scroll) up: key(pgup)
(page | scroll) down: key(pgdown)
#copy that: edit.copy()
#cut that: edit.cut()
#paste that: edit.paste()
#paste match: edit.paste_match_style()
#file save: edit.save()
#menu help: key(F1)
#spotlight: key(super)
#(undo that | skunks): edit.undo()
#redo that: edit.redo()
#volume up: key(volup)
#volume down: key(voldown)
#mute: key(mute)
#play next: key(next)
#play previous: key(prev)
#(play | pause): key(play_pause)
#wipe: key(backspace)
#(pad | padding):
#	insert("  ")
#	key(left)
#funny: "ha ha"
#menu: key(alt)

local host: "127.0.0.1"
hex (num|number) <number>: "0x{number}"
number <number>: "{number}"
hyper:
    edit.copy()
    edit.paste()
pucker:
    edit.paste()
    key(enter)

web link: "http://"
file link: "file://"
