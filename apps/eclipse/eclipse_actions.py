from talon import Context, actions
ctx = Context()
ctx.matches = r"""
#custom eclipse commands go here
app: eclipse
"""

@ctx.action_class('app')
class AppActions:
    #talon app actions
    def tab_close():    actions.key('ctrl-w')
    def tab_next():     actions.key('ctrl-pagedown')
    def tab_previous(): actions.key('ctrl-pageup')
    #action(app.tab_reopen):
    def window_close(): actions.key('alt-f4')
    def window_open():  actions.key('alt-w n')

@ctx.action_class('code')
class CodeActions:
    #talon code actions
    def toggle_comment(): actions.key('ctrl-7')

@ctx.action_class('edit')
class EditActions:
    #talon edit actions
    def indent_more(): actions.key('tab')
    def indent_less(): actions.key('shift-tab')
    def save_all():    actions.key('ctrl-shift-s')

@ctx.action_class('user')
class UserActions:
    # splits.py support begin
    # requires https://marketplace.eclipse.org/content/handysplit
    def split_clear_all():           actions.key('alt-shift-s f')
    def split_clear():               actions.key('alt-shift-s f')
    # action(user.split_flip):
    def split_last():                actions.key('alt-shift-s t')
    def split_next():                actions.key('alt-shift-s t')
    def split_window_down():         actions.key('alt-shift-s m')
    def split_window_horizontally(): actions.key('alt-ctrl-s s')
    def split_window_right():        actions.key('alt-shift-s m')
    def split_window_up():           actions.key('alt-shift-s m')
    def split_window_vertically():   actions.key('alt-shift-s s')
    def split_window():              actions.key('alt-ctrl-s s')
