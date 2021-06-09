from talon import Context, actions
ctx = Context()
ctx.matches = r"""
app: notepad_plus_plus
"""
ctx.tags = ['user.find_and_replace', 'user.line_commands', 'user.tabs']

@ctx.action_class('app')
class AppActions:
    def tab_previous():
        actions.key('ctrl-pageup')
    def tab_next():
        actions.key('ctrl-pagedown')

@ctx.action_class('code')
class CodeActions:
    def toggle_comment():
        actions.key('ctrl-q')

@ctx.action_class('edit')
class EditActions:
    def line_clone():
        actions.key('ctrl-d')
    def line_swap_up():
        actions.key('ctrl-shift-up')
    def line_swap_down():
        actions.key('ctrl-shift-down')
    def indent_more(): actions.key('tab')
    def indent_less(): actions.key('shift-tab')
