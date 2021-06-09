not mode: sleep
and not mode: user.presentation
-
toggle mode:
	user.toggle_mode()
dictation mode|(anglický|anglicky) (mód|mod)|englischer Modus:
	user.switch_mode("dictation")

command mode|příkazový (mód|mod)|Befehlsmodus:
	user.switch_mode("command")
(Czech|check) mode|(tschechischer|tschechische) Modus:
	user.switch_mode("user.czech")
German mode|(německý|německy) (mód|mod):
	user.switch_mode("user.german")

^presentation mode$:
    user.switcher_hide_running()
    user.history_disable()
    user.homophones_hide()
    user.help_hide()
    user.mouse_sleep()
    speech.disable()
    app.notify("Presentation Mode")
    mode.enable("user.presentation")

