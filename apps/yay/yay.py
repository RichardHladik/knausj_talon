from talon import Context, Module, actions, ui

mod = Module()
ctx = Context()

ctx.matches = r"""
tag: user.terminal
tag: user.packager_yay
"""


@ctx.action_class("user")
class user_actions:
    def package_search_by_name(name: str):
        actions.insert(f"yay -sS {name}")

    def package_install_by_name(name: str):
        actions.insert(f"yay -S {name}")

    def package_remove_by_name(name: str):
        actions.insert(f"yay -R {name}")

    def package_update_by_name(name: str):
        actions.insert(f"yay -U {name}")
