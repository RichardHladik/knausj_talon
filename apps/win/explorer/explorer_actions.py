from talon import Context, actions
ctx = Context()
ctx.matches = r"""
app: windows_explorer
app: windows_file_browser
"""

@ctx.action_class('user')
class UserActions:
    def file_manager_go_back():
        actions.key('alt-left')
    def file_manager_go_forward():
        actions.key('alt-right')
    def file_manager_open_parent():
        actions.key('alt-up')
