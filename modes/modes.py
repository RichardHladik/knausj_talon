from typing import List

from talon import Context, Module, actions, app, speech_system
from ..code.vocabulary import update_word_map

mod = Module()

modes = {
    "admin": "enable extra administration commands terminal (docker, etc)",
    "debug": "a way to force debugger commands to be loaded",
    "gdb": "a way to force gdb commands to be loaded",
    "ida": "a way to force ida commands to be loaded",
    "presentation": "a more strict form of sleep where only a more strict wake up command works",
    "windbg": "a way to force windbg commands to be loaded",
    "intermediate": "weird intermediate mode for talon hud"
}

dictation_modes = {
    "german": "german dictation mode",
    "czech": "czech dictation mode",
}

for k, v in dictation_modes.items():
    modes[k] = v

dictation_modes = { f"user.{k}" : v for k, v in dictation_modes.items() }
system_modes = "sleep command dictation".split(" ")

for key, value in modes.items():
    mod.mode(key, value)

def pretty_mode(mode):
    if mode.startswith("user."):
        mode = mode[5:]
    mode = mode[0].upper() + mode[1:]
    return f"{mode} Mode"

current_mode = "command"
mode_history = ["dictation", "command"]

@mod.action_class
class Actions:
    def talon_sleep_callback():
        """Additional actions to be run when talon goes to sleep"""
        return True

    def talon_wake_callback():
        """Additional actions to be run when talon wakes up"""
        return True

    def talon_mode():
        """For windows and Mac with Dragon, enables Talon commands and Dragon's command mode."""
        actions.speech.enable()

        engine = speech_system.engine.name
        # app.notify(engine)
        if "dragon" in engine:
            if app.platform == "mac":
                actions.user.engine_sleep()
            elif app.platform == "windows":
                actions.user.engine_wake()
                # note: this may not do anything for all versions of Dragon. Requires Pro.
                actions.user.engine_mimic("switch to command mode")

    def dragon_mode():
        """For windows and Mac with Dragon, disables Talon commands and exits Dragon's command mode"""
        engine = speech_system.engine.name
        # app.notify(engine)

        if "dragon" in engine:
            # app.notify("dragon mode")
            actions.speech.disable()
            if app.platform == "mac":
                actions.user.engine_wake()
            elif app.platform == "windows":
                actions.user.engine_wake()
                # note: this may not do anything for all versions of Dragon. Requires Pro.
                actions.user.engine_mimic("start normal mode")

    def disable_modes(barring:List[str]=[]):
        """Disables all user and system modes, clears the language mode"""
        for mode in ["user." + m for m in modes] + system_modes:
            if mode not in barring:
                actions.mode.disable(mode)
        actions.user.code_clear_language_mode(1)

    def switch_mode(new_mode: str, remember:int=1):
        """Switches to mode"""
        global mode_history
        global current_mode
        if new_mode in ["sleep"]:
            remember = 0
        if mode_history[-1] != new_mode and remember:
            mode_history.append(new_mode)
        mode_history = mode_history[-2:]
        to_enable = [new_mode]
        if new_mode in dictation_modes:
            to_enable.append("dictation")

        actions.mode.enable("user.intermediate")
        actions.user.disable_modes(barring=to_enable + ["user.intermediate"])
        for mode in to_enable:
            actions.mode.enable(mode)
        actions.mode.disable("user.intermediate")

        update_word_map(new_mode)

        current_mode = new_mode
        #actions.app.notify(pretty_mode(new_mode))

    def toggle_mode(index:int=-2, remember:int=1):
        """Toggles between command mode and the last noncommand mode"""
        global current_mode
        actions.user.switch_mode(mode_history[index], remember)

    def current_mode():
        """Returns the currently active mode"""
        return current_mode
