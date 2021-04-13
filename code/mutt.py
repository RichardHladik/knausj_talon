from talon import Context, Module
from ..code.user_settings import get_list_from_csv, register_csv_to_context

ctx = Context()
mod = Module()

mod.list("mailbox", desc="mail box")
register_csv_to_context(ctx, "mailboxes.csv", "self.mailbox")
