import math
from typing import Any
from talon import Context, Module, actions, ctrl

mod = Module()
ctx = Context()

scale = 5000
linear_point = 100

def power_to_amount(x):
    #print(x)
    #return math.exp(x / 100)
    x = max(x ** 2, x * linear_point)
    return math.ceil(x/scale)

cx, cy = 0, 0
def tozero(a):
    return math.copysign(math.floor(abs(a)), a)

@mod.action_class
class Actions:
    def custom_scroll(f0:Any, power:float):
        """Moves with the mouse"""
        if f0 <= 10 or f0 >= 5000:
            return
        global cx, cy
        cyclic = (math.log2(f0) - math.log2(440)) % 1.
        angle = 2 * math.pi * (cyclic - .25)
        dx, dy = math.cos(angle), math.sin(angle)
        k = power_to_amount(power)
        x, y = dx * k + cx, dy * k + cy
        ix, iy = tozero(x), tozero(y)
        cx, cy = x - ix, y - iy
        return ctrl.mouse_scroll(x=x,y=y, by_lines=False)
