import os

from talon import Context, Module, actions, app, ui

ctx = Context()
ctx.matches = r"""
app: vim
mode: user.talon
mode: command
and code.language: talon
"""
# spoken name -> snippet name
ultisnips_snippets = {}

private_snippets = {
    "talon file": "tf",
    "insert": "tsi",
    "big insert": "tmi",
    "key": "tk",
    "snippet": "tsnip",
    "heading": "tcom",
    "settings": "tset",
}

ctx.lists["user.snippets"] = {**ultisnips_snippets, **private_snippets}
