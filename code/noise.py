# this is adapted from @rntz script:
# https://gist.github.com/rntz/914bdb60187858d4a014e82fbcf591c3

import talon
from talon import Module, noise, actions, scripting, ui, app
from typing import Callable, Union, Any
import logging
import time

def successive_pops(wait=.5):
    if not pop_history:
        return 0
    prev = pop_history[-1]
    for i, t in enumerate(reversed(pop_history)):
        if prev - t > wait:
            return i
        prev = t

    return len(pop_history)

mod = Module()
@mod.action_class
class Actions:
    def pop(): 
        """pop action overrideable by contexts"""
        global pop_quick_action
        if pop_quick_action is None:
            return actions.user.pop_twice_to_toggle()
        else:
            return actions.user.pop_quick_action_run()

    def pop_counter(predef_actions: Any, wait:float=.5):
        """TODO"""
        now = time.monotonic()
        global pop_history
        pop_history.append(now)
        num_pops = successive_pops()

        action = predef_actions.get(num_pops, lambda: None)
        action()

    def pop_twice_to_toggle():
        """if popped twice in a row, toggles mode"""
        predef_actions = {
            2: actions.user.toggle_mode,
            3: lambda: actions.user.switch_mode("command"),
        }
        return actions.user.pop_counter(predef_actions)

    def pop_quick_action_clear():
        """Clears the quick macro"""
        global pop_quick_action
        global pop_quick_action_last
        pop_quick_action_last = pop_quick_action
        pop_quick_action = None

    def pop_quick_action_set():
        """Sets the quick macro"""
        global pop_quick_action
        if len(scripting.core.command_history) > 1:
            pop_quick_action = scripting.core.command_history[-1]
            app.notify(subtitle=f"pop quick action set\n{pop_quick_action}")

    def pop_quick_action_set_last():
        """Sets the quick macro to the previously set action"""
        global pop_quick_action
        global pop_quick_action_last
        pop_quick_action = pop_quick_action_last
        app.notify(subtitle=f"pop quick action set\n{pop_quick_action}")

    def pop_quick_action_run():
        """Runs the quick macro"""
        print(*pop_quick_action)
        scripting.core.CoreActions.run_command(*pop_quick_action)

    def hiss(): 
        """hiss action overrideable by contexts"""
        print("hissing")
        pass

    def hiss_quick_action_clear():
        """Clears the quick macro"""
        global hiss_quick_action
        global hiss_quick_action_last
        hiss_quick_action_last = hiss_quick_action
        hiss_quick_action = None

    def hiss_quick_action_set():
        """Sets the quick macro"""
        global hiss_quick_action
        if len(scripting.core.command_history) > 1:
            hiss_quick_action = scripting.core.command_history[-1]
            app.notify(subtitle=f"hiss quick action set\n{pop_quick_action}")

    def hiss_quick_action_set_last():
        """Sets the quick macro to the previously set action"""
        global hiss_quick_action
        global hiss_quick_action_last
        hiss_quick_action = hiss_quick_action_last
        app.notify(subtitle=f"hiss quick action set\n{pop_quick_action}")

    def hiss_quick_action_run():
        """Runs the quick macro"""
        print(*hiss_quick_action)
        scripting.core.CoreActions.run_command(*hiss_quick_action)


#ui.register("app_deactivate", lambda app: actions.user.pop_quick_action_clear())
#ui.register("win_focus", lambda win: actions.user.pop_quick_action_clear())

pop_quick_action = None
pop_quick_action_last = None
pop_quick_action_history = []
pop_history = []

def on_pop(active):
    print("pop")
    return actions.user.pop()

hiss_quick_action = None
hiss_quick_action_last = None
hiss_quick_action_history = []
def on_hiss(active):
    print("hiss")
    global hiss_quick_action
    if hiss_quick_action is None:
        actions.user.hiss()
    else:
        actions.user.hiss_quick_action_run()

try:
    noise.register("pop", on_pop)
    # noise.register("hiss", on_hiss)
except talon.lib.cubeb.CubebError as e:
    app.notify("Failed to register pop. Is possible audio error")
    print("Failed to register pop. Is possible audio error")
    print(e)

try:
    noise.register("hiss", on_hiss)
except talon.lib.cubeb.CubebError as e:
    app.notify("Failed to register hiss. Is possible audio error")
    print("Failed to register hiss. Is possible audio error")
    print(e)
