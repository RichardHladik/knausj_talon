import os

from talon import Context, Module, actions, app, ui

ctx = Context()
ctx.matches = r"""
app: vim
mode: user.python
mode: command
and code.language: python
"""
# spoken name -> snippet name
ultisnips_snippets = {
    "header": "#!",
    "if main": "ifmain",
    "for loop": "for",
    "class": "class",
    "function": "def",
    "method": "deff",
    "class method": "defc",
    "static method": "defs",
    "from": "from",
    "if": "if",
    "if else": "ife",
    "if if else": "ifee",
    "try": "try",
    "try except": "trye",
    "finally": "tryf",
    "trip string": '"',
    "trip tick": "'",
}

private_snippets = {
    "print success": "psuccess",
    "print fail": "pfail",
    "dick string": "dstr",
    "new arg parser": "argparse",
    "add argument": "narg",
}

ctx.lists["user.snippets"] = {**ultisnips_snippets, **private_snippets}
