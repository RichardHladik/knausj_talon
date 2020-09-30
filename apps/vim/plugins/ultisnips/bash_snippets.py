import os

from talon import Context, Module, actions, app, ui

ctx = Context()
ctx.matches = r"""
app: vim
mode: user.bash
mode: command
and code.language: bash
"""
# spoken name -> snippet name
ultisnips_snippets = {
    "header": "#!",
    "if": "if",
    "else if": "elif",
    "for loop": "four",
    "four in loop": "fourin",
    "while loop": "while",
    "until": "until",
    "switch": "switch",
}

private_snippets = {}

ctx.lists["user.snippets"] = {**ultisnips_snippets, **private_snippets}
