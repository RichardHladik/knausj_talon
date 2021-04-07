# These commands had only make sense to be exposed of vim is currently in
# command mode
# See `:help cmdline`

win.title: /VIM MODE:c/
-
tag(): user.vim_command_mode

paste register <user.key>: key(ctrl-r {key})

# Command-line completion: help:cmdline-completion
match names: key(ctrl-a)


action(edit.word_left): key(shift-left)
action(edit.word_right): key(shift-right)
action(edit.line_start): key(ctrl-b)
action(edit.line_end): key(ctrl-e)
action(edit.delete_line): key(ctrl-u)
action(user.delete_word_left): key(ctrl-w)
action(edit.paste): key(ctrl-alt-shift-v)

literal: key(ctrl-v)

# XXX - a the ctrl-r ctrl-<key> stuff

# XXX - add the ctrl-d autocompletion stuff

# regex
# XXX - should be made part of a generic regex grammar
state non greedy: "\\{{-}}"
state greedy: ".*"
state escaped or: user.insert_cursor("\\([|]\\|\\)")
