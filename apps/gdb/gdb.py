from talon import Context, Module, actions

mod = Module()
mod.tag("gdb", desc="tag for running the gdb debugger")
mod.tag("gef", desc="Gef gdb plugin")
mod.tag("pwndbg", desc="pwndbg gdb plugin")
mod.tag("libptmalloc", desc="libptmalloc gdb plugin")
mod.tag("libdlmalloc", desc="libdlmalloc gdb plugin")
mod.tag("libheap", desc="libheap gdb plugin")

ctx = Context()

ctx.matches = r"""
tag: user.gdb
"""


@ctx.action_class("user")
class user_actions:
    def debugger_clear_breakpoint_id(number_small: int):
        actions.insert(f"d br {number_small}\n")

    def debugger_disable_breakpoint_id(number_small: int):
        actions.insert(f"disable br {number_small}\n")

    def debugger_enable_breakpoint_id(number_small: int):
        actions.insert(f"enable br {number_small}\n")

    def pop():
        """Optional way of pressing enter via pop sound"""
        actions.key("enter")
