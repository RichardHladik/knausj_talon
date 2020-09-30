from talon import Context, Module, actions, ui

mod = Module()
ctx = Context()

ctx.matches = r"""
tag: user.packager_apt
"""


@ctx.action_class("user")
class user_actions:
    def package_search_by_name(name: str):
        actions.insert(f"apt search {name}")

    def package_install_by_name(name: str):
        actions.insert(f"apt install {name}")

    def package_remove_by_name(name: str):
        actions.insert(f"apt remove {name}")

    def package_update_by_name(name: str):
        actions.insert(f"apt update {name}")
