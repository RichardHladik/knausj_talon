from talon import Module, Context, ui, actions, clip, app, grammar
from typing import Optional, Tuple, Literal

mod = Module()
ctx = Context()
ctx.matches = r"""
tag: user.vim
"""

@mod.action_class
class Actions:
    def vim_checkpoint():
        """Creates an insert mode checkpoint in vim."""
        actions.user.vim_set_insert_mode()
        actions.key("ctrl-g u")

vim_ctx = Context()
vim_ctx.matches = r"""
mode: dictation
tag: user.vim
"""

@vim_ctx.action_class("main")
class main_action:
    def auto_insert(text):
        actions.user.vim_checkpoint()
        actions.user.dictation_insert_dumb(text)
