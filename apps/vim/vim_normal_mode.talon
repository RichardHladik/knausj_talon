win.title: /VIM MODE:n/
-
tag(): user.vim_normal_mode

# These differ slightly if we're in normal mode versus visual mode. in normal
# mode we select up we want to select the current line in the one above, as
# otherwise there is no current selection
action(edit.extend_line_up):
    user.vim_normal_mode("Vk")
action(edit.extend_line_down):
    user.vim_normal_mode("Vj")
