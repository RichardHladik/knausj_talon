from talon import Context, Module, actions, ui

mod = Module()
ctx = Context()

ctx.matches = r"""
tag: user.readline
"""

@ctx.action_class("user")
class user_actions:
    def line_find_forward(key: str):
        actions.key("ctrl-]")
        actions.key(key)

    def line_find_backward(key: str):
        actions.key("alt-ctrl-]")
        actions.key(key)

