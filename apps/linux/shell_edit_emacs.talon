# this is a set of commands that override common edit actions similar to edit.talon, but that specific
# to running commands inside of his shell, to a lot of the common word
# selection and such doesn't work the same.
# 
# This particular set of commands is whom you're running bindkey -e mode
# and not bindkey -v mode.
# of something is missing anyone to add it you can see what the associated
# command is by typing `bindkey` in your shell and looking at the resulting
# list
os: linux
tag: user.shell_edit_emacs
-

action(edit.word_left): key(shift-left)
action(edit.word_right): key(shift-right)
action(edit.line_start): key(ctrl-a)
action(edit.line_end): key(ctrl-e)
action(edit.delete): key(backspace)
action(edit.delete_line): key(ctrl-u)
action(user.delete_word_left): key(ctrl-w)
action(user.delete_word_right): key(ctrl-[ d)

