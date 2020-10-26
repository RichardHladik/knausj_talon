# XXX - this should have os awarenss
from talon import Context, Module, actions

mod = Module()
mod.list("paths_public", desc="Common paths")
mod.list("paths_private", desc="Common private paths")


@mod.capture
def paths_public(m) -> str:
    "One path"


@mod.capture
def paths_private(m) -> str:
    "One private path"


@mod.capture
def paths(m) -> str:
    "One path"


ctx = Context()
ctx.lists["user.paths_public"] = {
    "sessions": "~/.vim/sessions/",
    "temp": "/tmp",
    "config": "/etc",
    "user": "/usr",
    "log": "/var/log",
}

ctx.lists["user.paths_private"] = {}

# XXX - add support for selecting
windows_paths = {
    "desktop": "%USERPROFILE%\\Desktop",
    "profile": "%USERPROFILE%",
    "root": "%SYSTEMROOT%",
    "windows": "%SYSTEMROOT%",
    "system": "%SYSTEMROOT%\\System32",
    "drivers": "%SYSTEMROOT%\\System32\\Drivers",
    "programs": "%PROGRAMFILES%",
}


@ctx.capture(rule="{user.paths_public}")
def paths_public(m):
    return m.paths_public


@ctx.capture(rule="{user.paths_private}")
def paths_private(m):
    return m.paths_private


@ctx.capture(rule="<user.paths_public>|<user.paths_private>")
def paths(m):
    return m
