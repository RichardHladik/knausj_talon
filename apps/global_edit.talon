# actions that should be set no matter what context we are in
# for generic os-specific see apps/linux/edit.talon
# for more application-specific see apps/linux/shell_edit_emacs.talon,
# apps/linux/vim/editing.talon, etc

action(edit.delete):
    key(backspace)

action(edit.down):
    key(down)

action(edit.up):
    key(up)

action(edit.left):
    key(left)

action(edit.right):
    key(right)

