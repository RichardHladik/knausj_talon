mode: dictation
mode: user.czech
mode: user.german
tag: user.vim
-
<user.text>:
    user.system_command('notify-send.sh -t 3000 -f -u low "Dictation VIM"')
	user.vim_set_insert_mode()
	key(ctrl-g u)
    insert(user.text)
    insert(" ")
trash|smaž:
	user.vim_normal_mode_np("u")
	sleep(100ms)
(jumble|jumbo|šnorchl):
    edit.delete_word()
(place holder|placeholder):
	insert("$xxx$ ")
^(place holder|placeholder)$:
	user.vim_set_insert_mode()
	key(ctrl-g u)
	insert("$xxx$ ")
equation (place holder|placeholder):
	user.vim_set_insert_mode()
	key(ctrl-g u)
	key(backspace)
	insert("\n%\n\\begin{")
	insert("equation}\nxxx.\n")
	key(backspace)
	insert("\\end{")
	insert("equation}\n%\n")
display (place holder|placeholder):
	user.vim_set_insert_mode()
	key(ctrl-g u)
	key(backspace)
	insert("\n$$xxx$$\n")
ie:
	user.vim_set_insert_mode()
	key(ctrl-g u)
	insert("i.~e., ")
multi commodity: "multicommodity "
multi flow|multiflo: "multiflow "
mcf: "MCF "
egypt:
	user.vim_set_insert_mode()
	key(ctrl-g u)
	insert("e.~g.~")
