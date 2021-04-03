from talon import Context, Module, actions, ui

mod = Module()
ctx = Context()

ctx.matches = r"""
tag: terminal
tag: user.packager_pacman
"""


@ctx.action_class("user")
class user_actions:
    def package_search_by_name(name: str):
        actions.insert(f"pacman -sS {name}")

    def package_install_by_name(name: str):
        actions.insert(f"pacman -S {name}")

    def package_remove_by_name(name: str):
        actions.insert(f"pacman -R {name}")

    def package_update_by_name(name: str):
        actions.insert(f"pacman -U {name}")
