#defines the various mode commands
mode: all
-
welcome back:
	user.mouse_wake()
	user.history_enable()
	speech.enable()
sleep all:
	user.switcher_hide_running()
	user.history_disable()
	user.homophones_hide()
	user.help_hide()
	user.mouse_sleep()
	speech.disable()
    user.system_command('notify-send.sh -t 3000 -f -u low "Sleep All mode"')
	user.engine_sleep()
talon sleep:
    speech.disable()
    user.system_command('notify-send.sh -t 3000 -f -u low "Talon Sleep"')
talon wake:
    speech.enable()
    user.system_command('notify-send.sh -t 3000 -f -u low "Talon Awake"')
dragon mode: speech.disable()
talon mode: speech.enable()
dictation mode|anglický (mód|mod):
    mode.disable("sleep")
    mode.disable("command")
	mode.disable("user.czech")
    mode.enable("dictation")
    user.system_command('notify-send.sh -t 3000 -f -u low "Dictation Mode"')
command mode|příkazový (mód|mod):
    mode.disable("sleep")
    mode.disable("dictation")
	mode.disable("user.czech")
    mode.enable("command")
    user.system_command('notify-send.sh -t 3000 -f -u low "Command Mode"')
(Czech|check) mode:
    mode.disable("sleep")
    mode.disable("dictation")
    mode.disable("command")
	mode.enable("user.czech")
    user.system_command('notify-send.sh -t 3000 -f -u low "Czech Mode"')


[enable] debug mode:
    mode.enable("user.gdb")
    user.system_command('notify-send.sh -t 3000 -f -u low "Debug Mode Enabled"')
disable debug mode:
    mode.disable("user.gdb")
    #user.system_command('notify-send.sh -t 3000 -f -u low "Debug Mode Disabled"')

^force see sharp$: user.code_set_language_mode("csharp")
^force see plus plus$: user.code_set_language_mode("cplusplus")
^force python$: user.code_set_language_mode("python")
^force go (lang|language)$: user.code_set_language_mode("go")
^force talon language$: user.code_set_language_mode("talon")
^force markdown$: user.code_set_language_mode("markdown")
^clear language modes$: user.code_clear_language_mode()
