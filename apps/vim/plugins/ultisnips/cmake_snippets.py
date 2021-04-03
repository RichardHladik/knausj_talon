from talon import Context

ctx = Context()
ctx.matches = r"""
tag: user.vim_ultisnips
mode: user.cmake
mode: command
and code.language: cmake
"""
# spoken name -> ultisnips snippet name
ctx.lists["user.snippets"] = {}
