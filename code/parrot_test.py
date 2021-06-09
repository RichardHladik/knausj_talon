from typing import List
import os

from talon import Context, Module, actions

mod = Module()
ctx = Context()

#@mod.action_class
class Actions:
    def whistle_a():
        """TODO"""
        actions.key("a")
    def whistle_c():
        """TODO"""
        actions.key("c")
    def whistle_e():
        """TODO"""
        actions.key("e")
    def whistle_g():
        """TODO"""
        actions.key("g")
    def whistle_h():
        """TODO"""
        actions.key("h")
    def cluck():
        """TODO"""
        actions.key("S")
    def click_back():
        """TODO"""
        actions.key("backspace")
    def prd():
        """TODO"""
        ctions.key("p")
