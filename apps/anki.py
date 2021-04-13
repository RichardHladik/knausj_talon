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
        actions.user.watson_stop()
        actions.user.watson_start([f"anki +{deck}\n"])
        actions.user.switcher_focus("anki")
        actions.key("/")
        actions.sleep("150ms")
        actions.insert(f"{deck}")
        actions.sleep("50ms")
        actions.key("enter")
        actions.sleep("150ms")
        actions.key(" ")
