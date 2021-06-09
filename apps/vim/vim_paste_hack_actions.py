from talon import Context, actions
ctx = Context()
ctx.matches = r"""
app:vim
and win.title: /Neovim/
"""

@ctx.action_class('edit')
class EditActions:
    def paste(): actions.key('ctrl-r +')
