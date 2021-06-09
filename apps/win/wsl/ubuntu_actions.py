from talon import Context, actions
ctx = Context()
ctx.matches = r"""
app: ubuntu
app: windows_terminal
and win.title: /Ubuntu/
"""

@ctx.action_class('user')
class UserActions:
    def file_manager_refresh_title(): actions.skip()
    def file_manager_open_parent():
        actions.insert('cd ..')
        actions.key('enter')
