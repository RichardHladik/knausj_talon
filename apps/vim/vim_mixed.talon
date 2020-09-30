app:vim
-
# navigating splits
split <user.vim_arrow>:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key("{vim_arrow}")

# split left
spleff:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(h)
