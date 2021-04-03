from talon import Context, Module

mod = Module()
ctx = Context()

ctx.matches = r"""
tag: user.zsh
"""

mod.tag(
    "zsh", desc="Tag for enabling zsh shell support"
)

plugin_tag_list = [
    "zsh_cd_gitroot",
]

for entry in plugin_tag_list:
    mod.tag(entry, f"tag to load {entry} zsh plugin commands")

