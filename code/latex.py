from typing import List

from talon import Context, Module, actions
from ..code.user_settings import get_list_from_csv, register_csv_to_context

mod = Module()
ctx = Context()

mod.list("latex_symbol", desc="latex_symbol")
register_csv_to_context(ctx, "latex_symbols.csv", "self.latex_symbol")
mod.list("latex_section", desc="latex_section")
register_csv_to_context(ctx, "latex_section.csv", "self.latex_section")

@mod.capture(rule="{self.latex_symbol} | <user.letter> | <number_small> | ship <user.letter>")
def latex_casual_math(m) -> str:
    "An arrow direction to be converted to vim direction"
    try:
        return "\\" + m.latex_symbol
    except AttributeError:
        pass

    try:
        f = str.upper if m[0] == "ship" else lambda a: a
        return f(m.letter)
    except AttributeError:
        return m.number_small

@mod.action_class
class Actions:
    def latex_block(name: str, contents: str=""):
        """Creates a \\begin{name} block."""
        equations = "equation equation* align align* gather gather*".split()
        actions.auto_insert("\n")
        pad = "%" if name in equations else ""
        actions.insert(rf"""{pad}
\begin{{{name}}}
%
{contents}
%
\end{{{name}}}
""")
        if not contents:
            actions.key("up:3 backspace enter")
