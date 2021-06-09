from typing import List

from talon import Context, Module, actions

mod = Module()
ctx_zathura = Context()
ctx_zathura.matches = r"""
app: zathura
"""

@ctx_zathura.action_class("user")
class Actions:
    def pop():
        """TODO"""
        actions.key("ctrl-d")
