from talon import Context, actions
ctx = Context()
ctx.matches = r"""
win.title: /VIM MODE:t/
"""

@ctx.action_class('user')
class UserActions:
    def delete_word_left():
        actions.key('ctrl-w')

@ctx.action_class('edit')
class EditActions:
    def page_up():
        actions.key('ctrl-\\ ctrl-n ctrl-b')
