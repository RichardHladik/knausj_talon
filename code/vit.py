from typing import List

from talon import Context, Module, actions
from ..code.user_settings import get_list_from_csv, register_csv_to_context

mod = Module()
ctx = Context()

mod.list("task_priority", desc="Taskwarrior priority")
ctx.lists["self.task_priority"] = {
    "none": "n",
    "low": "l",
    "medium": "m",
    "high": "h",
}

mod.list("task_project", desc="Taskwarrior project")
register_csv_to_context(ctx, "task_projects.csv", "self.task_project")

mod.list("task_tag", desc="Taskwarrior tag")
register_csv_to_context(ctx, "task_tags.csv", "self.task_tag")

mod.list("task_context", desc="Taskwarrior context")
ctx.lists["self.task_context"] = {
    "none": "",
    "work": "práce",
}
