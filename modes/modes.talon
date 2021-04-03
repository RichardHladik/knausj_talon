
not mode: sleep
not mode: user.presentation
-
dictation mode|(anglický|anglicky) (mód|mod)|englischer Modus:
^dictation mode$:
    mode.disable("sleep")
    mode.disable("command")
	mode.disable("user.czech")
	mode.disable("user.german")
    mode.enable("dictation")
    app.notify("Dictation Mode")
    user.code_clear_language_mode()
    mode.disable("user.gdb")

command mode|talon mode|příkazový (mód|mod)|Befehlsmodus:
    mode.disable("sleep")
    mode.disable("dictation")
	mode.disable("user.czech")
	mode.disable("user.german")
    mode.enable("command")
    app.notify("Command Mode")
(Czech|check) mode|(tschechischer|tschechische) Modus:
    mode.disable("sleep")
    mode.disable("dictation")
    mode.disable("command")
	mode.disable("user.german")
	mode.enable("user.czech")
    app.notify("Czech Mode")
German mode|(německý|německy) (mód|mod):
    mode.disable("sleep")
    mode.disable("dictation")
    mode.disable("command")
	mode.enable("user.german")
	mode.disable("user.czech")
    app.notify("German Mode")

^presentation mode$:
    user.switcher_hide_running()
    user.history_disable()
    user.homophones_hide()
    user.help_hide()
    user.mouse_sleep()
    speech.disable()
    app.notify("Presentation Mode")
    mode.enable("user.presentation")

