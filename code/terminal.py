from talon import Context, Module

mod = Module()

ctx = Context()
ctx.matches = r"""
tag: user.terminal
"""


@mod.action_class
class Actions:
    def terminal_list_directory():
        """Show the contents of the current directory"""

    def terminal_change_directory():
        """Start a change directory command"""

    def terminal_clear_screen():
        """Clears the contents of the terminal"""

    def terminal_copy_directory():
        """Started a copy directory command"""
