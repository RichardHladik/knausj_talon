from talon import Context, Module
from ..code.user_settings import get_list_from_csv, register_csv_to_context

ctx = Context()
mod = Module()

mod.list("user_path", desc="custom user path")
register_csv_to_context(ctx, "paths.csv", "self.user_path")
