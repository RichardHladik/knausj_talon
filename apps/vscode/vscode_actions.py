from talon import Context, actions
ctx = Context()
ctx.matches = r"""
#custom vscode commands go here
app: vscode
"""

@ctx.action_class('app')
class AppActions:
    #talon app actions
    def tab_close():    actions.user.vscode('workbench.action.closeActiveEditor')
    def tab_next():     actions.user.vscode('workbench.action.nextEditorInGroup')
    def tab_previous(): actions.user.vscode('workbench.action.previousEditorInGroup')
    def tab_reopen():   actions.user.vscode('workbench.action.reopenClosedEditor')
    def window_close(): actions.user.vscode('workbench.action.closeWindow')
    def window_open():  actions.user.vscode('workbench.action.newWindow')

@ctx.action_class('code')
class CodeActions:
    #talon code actions
    def toggle_comment(): actions.user.vscode('editor.action.commentLine')

@ctx.action_class('edit')
class EditActions:
    #talon edit actions
    def indent_more(): actions.user.vscode('editor.action.indentLines')
    def indent_less(): actions.user.vscode('editor.action.outdentLines')
    def save_all():    actions.user.vscode('workbench.action.files.saveAll')

@ctx.action_class('user')
class UserActions:
    # splits.py support begin
    def split_clear_all():                       actions.user.vscode('View: Single Column Editor Layout')
    def split_clear():                           actions.user.vscode('View: Join Editor Group with Next Group')
    def split_flip():                            actions.user.vscode('View: Toggle Vertical/Horizontal Editor Layout')
    def split_last():                            actions.user.vscode('View: Focus Previous Editor Group')
    def split_next():                            actions.user.vscode('View: Focus Next Editor Group')
    def split_window_down():                     actions.user.vscode('workbench.action.moveEditorToBelowGroup')
    def split_window_horizontally():             actions.user.vscode('View: Split Editor Orthogonal')
    def split_window_left():                     actions.user.vscode('workbench.action.moveEditorToLeftGroup')
    def split_window_right():                    actions.user.vscode('workbench.action.moveEditorToRightGroup')
    def split_window_up():                       actions.user.vscode('workbench.action.moveEditorToAboveGroup')
    def split_window_vertically():               actions.user.vscode('View: Split Editor')
    def split_window():                          actions.user.vscode('View: Split Editor')
    # splits.py support end
    
    #multiple_cursor.py support begin
    #note: vscode has no explicit mode for multiple cursors
    def multi_cursor_add_above():                actions.user.vscode('Add Cursor Above')
    def multi_cursor_add_below():                actions.user.vscode('Add Cursor Below')
    def multi_cursor_add_to_line_ends():         actions.user.vscode('Add Cursor to Line Ends')
    def multi_cursor_disable():                  actions.key('escape')
    def multi_cursor_enable():                   actions.skip()
    def multi_cursor_select_all_occurrences():   actions.user.vscode('Select All Occurrences of Find Match')
    def multi_cursor_select_fewer_occurrences(): actions.user.vscode('Cursor Undo')
    def multi_cursor_select_more_occurrences():  actions.user.vscode('Add Selection To Next Find Match')
