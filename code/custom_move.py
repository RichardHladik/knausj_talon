import math
from typing import Any
from talon import Context, Module, actions, ctrl

mod = Module()
ctx = Context()

scale = 5000
linear_point = 100

def power_to_amount(x):
    return x / 100

cx = 0
cy = 0
def tozero(a):
    return math.copysign(math.floor(abs(a)), a)

@mod.action_class
class Actions:
    def custom_move(f0:Any, power:float):
        """Moves with the mouse"""
        if f0 <= 10 or f0 >= 5000:
            return
        global cx, cy
        cyclic = (math.log2(f0) - math.log2(440)) % 1.
        angle = 2 * math.pi * (cyclic - .25)
        x, y = ctrl.mouse_pos()
        dx, dy = math.cos(angle), math.sin(angle)
        k = power_to_amount(power)
        x, y = x + dx * k + cx, y + dy * k + cy
        ix, iy = tozero(x), tozero(y)
        cx, cy = x - ix, y - iy
        return ctrl.mouse_move(x, y)
