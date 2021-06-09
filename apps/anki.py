from typing import List

from talon import Context, Module, actions

mod = Module()
ctx = Context()

mod.list("anki_deck", desc="Anki deck")
ctx.lists["self.anki_deck"] = {
    "math": "MFF",
    "french": "FJ",
    "german": "NJ",
}

@mod.action_class
class Actions:
    def anki_deck(deck:str):
        """Opens an Anki deck"""
        actions.key("d")
        actions.user.watson_stop_silent()
        actions.user.watson_start([f"anki +{deck}\n"])
        actions.user.switcher_focus("anki")
        actions.key("/")
        actions.sleep("150ms")
        actions.insert(f"{deck}")
        actions.sleep("50ms")
        actions.key("enter")
        actions.sleep("150ms")
        actions.key(" ")

ctx_anki = Context()
ctx_anki.matches = r"""
app: anki
and not tag: user.anki_edit
"""

@ctx_anki.action_class("user")
class Actions:
    def pop():
        """TODO"""
        actions.key("space")

    def whistle_a():
        """TODO"""
        actions.key("h")

    def whistle_c():
        """TODO"""
        actions.key("j")

    def whistle_e():
        """TODO"""
        actions.edit.undo()

    def whistle_g():
        """TODO"""
        actions.key("l")

    def whistle_h():
        """TODO"""
        actions.key("e")

    def cluck():
        """TODO"""
        actions.edit.undo()
