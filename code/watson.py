from typing import List
import os

from talon import Context, Module, actions
from ..code.user_settings import get_list_from_csv, register_csv_to_context

mod = Module()
ctx = Context()

mod.list("watson_activity", desc="watson activity")
register_csv_to_context(ctx, "watson.csv", "self.watson_activity")

@mod.action_class
class Actions:
    def watson_focus(clear:bool =True):
        """Focuses the watson window"""
        actions.user.switcher_focus("watson")
        if clear:
            actions.key("ctrl-u")

    def watson_stop(at:bool = False):
        """Stops the currently running activity"""
        actions.user.watson_focus()
        actions.insert("wat stop" + (" --at " if at else "\n"))

    def watson_stop_silent(at:bool = False):
        """Stops the currently running activity in the background"""
        os.system("wat stop")

    def watson_cancel():
        """Cancel the currently running activity"""
        actions.user.watson_focus()
        actions.insert("wat cancel\n")

    def watson_search():
        """Opens the interactive search"""
        actions.user.watson_focus()
        actions.key("ctrl-r")

    def watson_start(what:List[str] = [], at:bool = False):
        """Starts a new activity"""
        actions.user.watson_focus()
        what = " ".join(what)
        actions.insert("wat start" + (" " + what if what else "") + (" " + "--at " if at else ""))
