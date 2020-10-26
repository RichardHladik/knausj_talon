from talon import Context

ctx = Context()
ctx.matches = r"""
tag: user.vim_ultisnips
mode: user.lua
mode: command
and code.language: lua
"""
# spoken name -> ultisnips snippet name
ctx.lists["user.snippets"] = {}
