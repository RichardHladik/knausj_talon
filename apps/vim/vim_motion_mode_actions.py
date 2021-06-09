from talon import Context, actions
ctx = Context()
ctx.matches = r"""
# This file is for commands that should work in all motion modes (NORMAL,
# VISUAL, VBLOCK, INSERT) but it won't work for command or terminal mode. If
# you're not sure a command should be placed here it might be better to just
# put it in vim.talon, but mostly just ask yourself can you ever imagine being
# in command mode or inside of a terminal and wanting to run the command? If
# you can't imagine doing it, it suits this file over vim.talon

app:vim
not tag: user.vim_terminal
and not tag: user.vim_command_mode
"""

@ctx.action_class('edit')
class EditActions:
    def save():
        actions.user.vim_command_mode(':w\n')
