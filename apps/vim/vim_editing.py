from talon import Context, Module, actions, ui

mod = Module()
ctx = Context()

ctx.matches = r"""
app: vim
not tag: user.vim_terminal
"""

@ctx.action_class("user")
class user_actions:
    def line_find_forward(key: str):
        print(key)
        actions.user.vim_any_motion_mode(f"f{key}")

    def line_find_backward(key: str):
        actions.user.vim_any_motion_mode(f"F{key}")

