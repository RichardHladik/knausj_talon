from talon import Context, Module, actions

mod = Module()
ctx = Context()

ctx.matches = r"""
tag: user.systemctl
"""


@ctx.action_class("user")
class user_actions:
    def service_status_by_name(name: str):
        actions.insert(f"systemctl --no-pager status {name}")

    def service_stop_by_name(name: str):
        actions.insert(f"systemctl stop {name}")

    def service_start_by_name(name: str):
        actions.insert(f"systemctl start {name}")

    def service_enable_by_name(name: str):
        actions.insert(f"systemctl enable {name}")

    def service_disable_by_name(name: str):
        actions.insert(f"systemctl disable {name}")
