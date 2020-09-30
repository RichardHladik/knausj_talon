win.title: /VIM MODE:t/
-

tag(): user.terminal
tag(): user.vim_terminal


action(edit.delete_line):
    key(ctrl-u)

pop (terminal|term):
    key(ctrl-\ ctrl-n)

# pop terminal mode and scroll up once, from this point onward you can scroll
# like normal
# XXX - scroll up just become contextual on mode
# rabbit up:
action(edit.page_up):
    key(ctrl-\ ctrl-n ctrl-b)
scroll up:
    key(ctrl-\ ctrl-n ctrl-b)

# this causes exclusive terminal windows to exit without requiring key press or
# dropping to a new empty buffer
exit terminal:
    key(ctrl-\)
    key(ctrl-n)
    insert("ZQ")

# shadow are commands are for copying the entire line from a given point
shadow <number_small>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("y$")
    insert(":set nohls\n")
    user.vim_set_insert_mode()
    edit.paste()
    key(space)

shadow fuzzy <user.text>:
    user.vim_normal_mode_exterm(":call search(\"{text}\", 'bcW')\n")
    insert("y$")
    insert(":set nohls\n")
    user.vim_set_insert_mode()
    edit.paste()

shadow <number_small> <user.text>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert(":call search(\"{text}\", 'c', line('.'))\n")
    insert("y$")
    insert(":set nohls\n")
    user.vim_set_insert_mode()
    edit.paste()

shadow <number_small> <user.ordinals>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("{ordinals-1}W")
    insert("y$")
    insert(":set nohls\n")
    user.vim_set_insert_mode()
    edit.paste()
    key(space)

# echo commands are for copying words from a given point
echo <number_small>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("yW")
    insert(":set nohls\n")
    user.vim_set_insert_mode()
    edit.paste()
    key(space)

echo last <number_small>:
    user.vim_normal_mode_exterm("{number_small}k")
    insert('$T ')
    insert("yW")
    user.vim_set_insert_mode()
    edit.paste()
    key(space)

echo <number_small> <user.ordinals>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("{ordinals-1}W")
    insert("yW")
    insert(":set nohls\n")
    user.vim_set_insert_mode()
    edit.paste()
    key(space)
