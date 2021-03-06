from talon import Context, actions
ctx = Context()
ctx.matches = r"""
# These commands had only make sense to be exposed of vim is currently in
# command mode
# See `:help cmdline`

win.title: /VIM MODE:c/
"""

@ctx.action_class('edit')
class EditActions:
    def word_left():   actions.key('shift-left')
    def word_right():  actions.key('shift-right')
    def line_start():  actions.key('ctrl-b')
    def line_end():    actions.key('ctrl-e')
    def delete_line(): actions.key('ctrl-u')
    def paste():       actions.key('ctrl-alt-shift-v')

@ctx.action_class('user')
class UserActions:
    def delete_word_left(): actions.key('ctrl-w')
