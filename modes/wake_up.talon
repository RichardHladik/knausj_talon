#defines the commands that sleep/wake Talon
mode: all
-
pretty please sleep all:
    user.switcher_hide_running()
    user.history_disable()
    user.homophones_hide()
    user.help_hide()
    user.mouse_sleep()
    speech.disable()
    user.engine_sleep()
    app.notify("Talon Sleep All Mode")

pretty please go to sleep:
	user.switch_mode("sleep", 0)
    speech.disable()
    user.talon_sleep_callback()

(pretty please wake up|wake up pretty please|wake up you lazy bastard):
	user.toggle_mode(-1, 0)
    speech.enable()
    user.talon_wake_callback()
