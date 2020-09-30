# XXX - this should have os awarenss
from talon import Context, Module, actions

mod = Module()
mod.list("paths", desc="Common paths")


@mod.capture
def paths(m) -> str:
    "One path"


ctx = Context()
if "user.paths" not in ctx.lists:
    ctx.lists["user.paths"] = {}
orig_paths = ctx.lists["user.paths"]
new_paths = {
    "sessions": "~/.vim/sessions/",
    "temp": "/tmp",
    "config": "/etc",
    "user": "/usr",
    "log": "/var/log",
}

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
ctx.lists["user.paths"] = {**orig_paths, **new_paths}


@ctx.capture(rule="{user.paths}")
def paths(m):
    return m.paths
