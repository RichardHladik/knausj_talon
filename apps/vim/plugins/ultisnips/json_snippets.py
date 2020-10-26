from talon import Context

ctx = Context()
ctx.matches = r"""
tag: user.vim_ultisnips
mode: user.json
mode: command
and code.language: json
"""
# spoken name -> ultisnips snippet name
ctx.lists["user.snippets"] = {
    "array": "a",
    "bool": "b",
    "named array": "na",
    "named object": "no",
    "null": "null",
    "number": "n",
    "object": "o",
    "string": "s",
}
