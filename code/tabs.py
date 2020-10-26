from talon import Module

mod = Module()


@mod.action_class
class tab_actions:
    def tab_jump(number: int):
        """Jumps to the specified tab"""

    def tab_final():
        """Jumps to the final tab"""

    def tab_first():
        """Jumps to the first tab"""

    def tab_search():
        """Search through tabs"""
