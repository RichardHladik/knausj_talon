os: linux
tag: vim
-

action(edit.delete_word):
	user.vim_set_insert_mode()
	key(ctrl-w)

open talon dir:
    user.vim_command_mode_exterm(":lcd ~/.talon/user/fidget/\n")
edit my vim scripts:
    user.vim_command_mode_exterm(":source ~/.vim/sessions/talon_vim.session\n")

# XXX - rename
super focus:
    # i3wm full screen toggle
    key(super-f)
    # wait for redraw
    sleep(200ms)
    # equalize vim splits
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(=)
