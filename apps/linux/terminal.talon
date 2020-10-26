os: linux
tag: user.terminal
-

###
# Packages
#
# These tags correspond to talon grammars you want to enable while you're
# running some terminal emulator on your system. See the associated talon
# files for information and links to what tools they are associated with.
###

tag(): user.buku
tag(): user.yay
tag(): user.apt
tag(): user.ghidra_server
tag(): user.nmcli
tag(): user.taskwarrior
tag(): user.timewarrior
tag(): user.make
tag(): user.kubectl
tag(): user.tmux
tag(): user.git
tag(): user.docker

action(edit.page_down):
  key(shift-pagedown)
action(edit.page_up):
 key(shift-pageup)
action(edit.paste):
  key(ctrl-shift-v)
action(edit.copy):
  key(ctrl-shift-c)
action(edit.delete_line):
  key(ctrl-u)

run last [command]:
  key(up)
  key(enter)
run last script:
  insert("./")
  key(up)
  key(enter)
rerun <user.text>:
  key(ctrl-r)
  insert(text)
rerun search:
  key(ctrl-r)
kill all:
  key(ctrl-c)

# XXX - these are specific to certain terminals only and should move into their
#tag(): user.file_manager
#todo: generic tab commands
#tag(): tabs

# own <term name>.talon file
action(edit.find):
  key(ctrl-shift-f)
action(edit.word_left):
  key(ctrl-left)
action(edit.word_right):
  key(ctrl-right)
action(app.tab_open):
  key(ctrl-shift-t)
action(app.tab_close):
  key(ctrl-shift-w)
action(app.tab_next):
  key(ctrl-pagedown)
action(app.tab_previous):
  key(ctrl-pageup)
action(app.window_open):
  key(ctrl-shift-n)
#go tab <number>:
#  key("alt-{number}")
