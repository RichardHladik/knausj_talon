from talon import Context, actions
ctx = Context()
ctx.matches = r"""
os: linux
tag: user.vim
"""

@ctx.action_class('edit')
class EditActions:
    def delete_word():
        actions.user.vim_set_insert_mode()
        actions.key('ctrl-w')
