import sys
from typing import Set

from talon import Context, Module, actions

mod = Module()
ctx = Context()

ctx.lists["self.task_unmodifiable_verbs"] = {
    "version": "--version",
    "help": "help",
    "commands": "commands",
}

ctx.lists["self.task_modifiable_verbs"] = {
    "next": "next",
    "edit": "edit",
    "list": "list",
    "add": "add",
    "delete": "delete",
    "done": "done",
}

ctx.lists["self.task_filters"] = {}

ctx.lists["self.task_modifiers"] = {
    "orphans": "project:",
    "untagged": "tags.none:",
    "high priority": "priority:H",
    "medium priority": "priority:M",
    "low priority": "priority:L",
}

mod.list("task_unmodifiable_verbs", desc="taskwarrior unmodifiable commands")
mod.list("task_modifiable_verbs", desc="taskwarrior modifiable commands")
mod.list("task_modifiers", desc="taskwarrior command modifiers")
mod.list("task_filters", desc="taskwarrior command filters")


@mod.capture
def task_unmodifiable_verbs(m) -> str:
    "Returns a string"


@mod.capture
def task_modifiable_verbs(m) -> str:
    "Returns a string"


@mod.capture
def task_modifiers(m) -> str:
    "Returns a string"


@ctx.capture(rule="{self.task_unmodifiable_verbs}")
def task_unmodifiable_verbs(m) -> str:
    "Returns a string"
    return m.task_unmodifiable_verbs


@ctx.capture(rule="{self.task_modifiable_verbs}")
def task_modifiable_verbs(m) -> str:
    "Returns a string"
    return m.task_modifiable_verbs


@ctx.capture(rule="{self.task_modifiers}")
def task_modifiers(m) -> str:
    "Returns a string"
    return m.task_modifiers


# @ctx.capture(rule='{self.task_command}')
# def task_command(m) -> str:
#    "Returns a string"
#    return m.task_command
