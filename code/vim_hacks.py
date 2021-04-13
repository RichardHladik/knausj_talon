from talon import Module, Context, ui, actions, clip, app, grammar
from typing import Optional, Tuple, Literal

mod = Module()
ctx = Context()

@mod.action_class
class Actions:
    def vim_checkpoint():
        """Creates an insert mode checkpoint in vim."""
        actions.user.vim_insert_mode_key("ctrl-g u")

@mod.action_class
class Actions:
    def insert_content(text: str):
        """Inserts content into the application"""
        actions.insert(text)

vim_ctx = Context()
vim_ctx.matches = r"""
tag: user.vim
"""

@vim_ctx.action_class("user")
class Actions:
    def insert_content(text: str):
        """Inserts content into the application"""
        actions.user.vim_checkpoint()
        actions.insert(text)
