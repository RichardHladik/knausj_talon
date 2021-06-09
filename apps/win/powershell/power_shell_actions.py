from talon import Context, actions
ctx = Context()
ctx.matches = r"""
app: windows_power_shell
app: windows_terminal
and win.title: /PowerShell/
"""
ctx.tags = ['user.file_manager', 'user.git', 'user.generic_terminal', 'user.kubectl', 'terminal']

@ctx.action_class('user')
class UserActions:
    def file_manager_refresh_title():
        actions.insert("$Host.UI.RawUI.WindowTitle = 'Windows PowerShell: ' +  $(get-location)")
        actions.key('enter')
        #action(user.file_manager_go_back):
        #    key("alt-left")
        #action(user.file_manager_go_forward):
        #    key("alt-right")
    def file_manager_open_parent():
        actions.insert('cd ..')
        actions.key('enter')
        actions.user.file_manager_refresh_title()

@ctx.action_class('edit')
class EditActions:
    def delete_line(): actions.key('esc')
