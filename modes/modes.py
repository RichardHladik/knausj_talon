from talon import Context, Module, actions

mod = Module()

modes = {
    "admin": "enable extra administration commands terminal (docker, etc)",
    "debug": "a way to force debugger commands to be loaded",
    "gdb": "a way to force gdb commands to be loaded",
    "ida": "a way to force ida commands to be loaded",
    "presentation": "a more strict form of sleep where only a more strict wake up command works",
    "windbg": "a way to force windbg commands to be loaded",
}

for key, value in modes.items():
    mod.mode(key, value)


@mod.action_class
class Actions:
    def talon_sleep_callback():
        """Additional actions to be run when talon goes to sleep"""
        actions.user.system_command_nb(
            "/home/aa/source/obs-cli/obs-cli.py --stop-recording"
        )

    def talon_wake_callback():
        """Additional actions to be run when talon wakes up"""
        actions.user.system_command_nb(
            "/home/aa/source/obs-cli/obs-cli.py --start-recording"
        )
