from typing import List

from talon import Context, Module, actions
from ..code.user_settings import get_list_from_csv, register_csv_to_context

mod = Module()
ctx = Context()

mod.list("latex_symbol", desc="latex_symbol")
register_csv_to_context(ctx, "latex_symbols.csv", "self.latex_symbol")

@mod.action_class
class Actions:
    def latex_block(name: str, contents: str=""):
        """Creates a \\begin{name} block."""
        actions.auto_insert("\n")
        actions.insert(rf"""%
\begin{{{name}}}
{contents}
\end{{{name}}}
%
""")
        if not contents:
            key("up up")
