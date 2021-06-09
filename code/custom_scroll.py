import math
from talon import Context, Module, actions, ctrl

mod = Module()
ctx = Context()

def power_to_amount(power):
    return math.ceil(power/50)


@mod.action_class
class Actions:
    def custom_scroll(power:float = 50):
        """Scrolls with the mouse"""
        return ctrl.mouse_scroll(y=power_to_amount(power), by_lines=False)
    def custom_scroll_up(power:float = 50):
        """Scrolls with the mouse"""
        return ctrl.mouse_scroll(y=-power_to_amount(power), by_lines=False)
