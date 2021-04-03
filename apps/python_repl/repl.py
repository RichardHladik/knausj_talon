from talon import Context, Module, actions, app, imgui, registry, settings

ctx = Context()
mod = Module()
mod.tag("python_repl", desc="Tag for indicating a generic python repl")
mod.tag("talon_repl", desc="Tag for indicating the talon repl")
