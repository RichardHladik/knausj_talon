from talon import Context, actions
ctx = Context()
ctx.matches = r"""
# NOTE: these are command line commands, not shell-specific bindings
# see shell.talon for shell-specific keybindings
os: linux
mode: user.terminal
mode: command
and tag: terminal
"""

@ctx.action_class('edit')
class EditActions:
    def delete_word():
        actions.key('ctrl-w')
    def delete_line():
        actions.key('end')
        actions.key('ctrl-u')
