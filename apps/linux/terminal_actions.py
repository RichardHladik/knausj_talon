from talon import Context, actions
ctx = Context()
ctx.matches = r"""
os: linux
tag: terminal
"""

@ctx.action_class('edit')
class EditActions:
    # these are generic linux edit commands that don't need to be part of
    # the shell_edit_ABC.talon specific ones
    def page_down():
        actions.key('shift-pagedown')
    def page_up():
        actions.key('shift-pageup')
    def paste():
        actions.key('ctrl-alt-shift-v')
    def copy():
        actions.key('ctrl-alt-shift-c')
