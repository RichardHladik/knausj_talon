from talon import Context, actions
ctx = Context()
ctx.matches = r"""
app: windows_terminal
"""

@ctx.action_class('edit')
class EditActions:
    # commands that work regardless of active terminal should go here.
    
    # windows terminal config based on mrob95's
    # https://github.com/mrob95/WindowsTerminal-config/blob/master/settings.json
    
    def paste(): actions.key('ctrl-shift-v')
    def copy():  actions.key('ctrl-shift-c')

@ctx.action_class('app')
class AppActions:
    def tab_close(): actions.key('ctrl-shift-w')
    def tab_open():  actions.key('ctrl-shift-t')
