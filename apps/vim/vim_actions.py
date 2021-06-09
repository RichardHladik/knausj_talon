from talon import Context, actions
ctx = Context()
ctx.matches = r"""
# USAGE: - See doc/vim.md for usage and tutorial
#
#  - See code/vim.py very implementation and additional motion grammars
#
# FILES:
#  Files are split up as follows largely to reduce the grammar size and prevent
#  talent from being overloaded when trying to switch contexts process the
#  grammar tree. Unfortunately this makes it slightly more difficult to find
#  commands quickly.
#   * vim.talon - general settings, tag management, and commands the work across
#                 all modes
#   * vim_motion_mode.talon   - commands that work across all motion modes
#   * vim_terminal_mode.talon - commands that only work in terminal mode
#   * vim_normal_mode.talon   - commands that only work in normal mode
#   * vim_visual_mode.talon   - commands that only work in visual mode
#   * vim_insert_mode.talon   - commands that only work in insert mode
#
# NOTE:
# Where applicable I try to explicitly select appropriate API for terminal
# escaping, etc. However in cases where it is unlikely you will say a command
# from terminal mode, I don't bother. Example "save file" doesn't have explicit
# terminal escaping. This also helps an embedded vim running inside of a vim
# terminal work properly.
#
# TODO:
#  - add word jumping and searching for command mode
#  - test on windows and mac
#  - everything in this files should technically use _exterm() version of
#    functions

app: vim
and not tag: user.vim_command_mode
"""

@ctx.action_class('app')
class AppActions:
    def tab_open():  actions.user.vim_command_mode_exterm(':tabnew\n')
    def tab_close(): actions.user.vim_command_mode_exterm(':tabclose\n')
    def tab_next():  actions.user.vim_command_mode_exterm(':tabnext\n')

@ctx.action_class('user')
class UserActions:
    def delete_word_left():
        actions.key('ctrl-w')
