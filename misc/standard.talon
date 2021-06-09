shock: key(enter)

# XXX - block alone conflicts with vim key words
add code block:
    insert("{}")
    key(left enter enter up tab)

zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_out()
(page | scroll) up: key(pgup)
(page | scroll) down: key(pgdown)
copy that: edit.copy()
cut that: edit.cut()
paste that: edit.paste()
pasty: edit.paste()
paste match: edit.paste_match_style()
file save: edit.save()

#menu help: key(F1)
#spotlight: key(super)
#(undo that | skunks): edit.undo()
#redo that: edit.redo()

# XXX - should be part of some networking thing
local host: "127.0.0.1"
(hex|hexadecimal) (num|number) <number>: "0x{number}"
hyper:
    edit.copy()
    edit.paste()
sucker:
    edit.copy()
    edit.paste()
    key(enter)
pucker:
    edit.paste()
    key(enter)

link web: "https://"
link insecure web: "http://"
link file: "file://"
link git: "git://"
link secure shell: "ssh://"

# this should be part of comment plugin
add to do: "# XXX - "
