# from user.knausj_talon.code.snippet_watcher import snippet_watcher
import os

from talon import Context, Module, actions, app, ui

ctx = Context()
ctx.matches = r"""
app: vim
mode: user.vimscript
mode: command
and code.language: vimscript
"""

# short name -> UltiSnip clip name
ctx.lists["user.snippets"] = {
    "global variable": "gvar",
    "script guard": "guard",
    "function": "f",
}
