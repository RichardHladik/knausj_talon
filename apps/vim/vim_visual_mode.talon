win.title: /VIM MODE:v/
win.title: /VIM MODE:V/
-
tag: user.vim_visual_mode()

# the distinction in visual motives that we assume that there is already a
# selection, so when we're extending a selection in the opposite direction
# (backwards) we want a prefix an o beforehand so that it actually extends,
# rather than changing directions.

action(edit.extend_line_up):
    user.vim_visual_mode("ok^o")
action(edit.extend_line_down):
    user.vim_visual_mode("j^")
action(edit.extend_left):
    user.vim_visual_mode("oho")
action(edit.extend_right):
    user.vim_visual_mode("l")
action(edit.extend_word_left):
    user.vim_visual_mode("obo")
action(edit.extend_word_right):
    user.vim_visual_mode("e")
action(edit.select_word):
    user.vim_visual_mode("e")
action(edit.extend_line_start):
    user.vim_visual_mode("o^o")
action(edit.extend_line_end):
    user.vim_visual_mode("$")
action(edit.extend_file_start):
    user.vim_visual_mode("ogg0o")
action(edit.extend_file_end):
    user.vim_visual_mode("G")

# XXX - This should be a callable function so we can do things like:
#       '.swap on this <highlight motion>'
#       'swap between line x, y'
# assumes visual mode
swap (selected|highlighted):
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("s///g")
    key(left)
    key(left)
    key(left)

sort selected:
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(100ms)
    insert("sort\n")

unique selected:
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(100ms)
    insert("sort u\n")

# assumes visual mode
reswap (selected|highlighted):
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    key(up)

deleted selected empty lines:
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("g/^$/d\\j")

prefix with <user.unmodified_key>:
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("s/^/{unmodified_key}/g\n")

# XXX - maybe make this work another modes
yank with line numbers:
    user.vim_command_mode_exterm(":redir @+ | silent! :'<,'>number | redir END\n")

