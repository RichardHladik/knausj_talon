from talon import Context

ctx = Context()
ctx.matches = r"""
tag: user.vim_ultisnips
mode: user.snippets
mode: command
and code.language: snippets
"""
# spoken name -> snippet name
ultisnips_snippets = {
    "snippet": "usnip",
    "visual": "vis",
}

private_snippets = {}

ctx.lists["user.snippets"] = {**ultisnips_snippets, **private_snippets}
