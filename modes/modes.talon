#defines the various mode commands
not mode: user.presentation
-
#welcome back:
#    user.mouse_wake()
#    user.history_enable()
#    speech.enable()
sleep all:
    user.switcher_hide_running()
    user.history_disable()
    user.homophones_hide()
    user.help_hide()
    user.mouse_sleep()
    speech.disable()
    app.notify("Talon Sleep All Mode")
talon sleep:
    speech.disable()
    app.notify("Talon Sleep")
talon wake:
    speech.enable()
    app.notify("Talon Awake")
#dragon mode: speech.disable()
#talon mode: speech.enable()
dictation mode|(anglický|anglicky) (mód|mod)|englischer Modus:
    mode.disable("sleep")
    mode.disable("command")
	mode.disable("user.czech")
	mode.disable("user.german")
    mode.enable("dictation")
    app.notify("Dictation Mode")
command mode|příkazový (mód|mod)|Befehlsmodus:
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

# XXX - switch to a mode that lets you select debuggers
[enable] debug mode:
    mode.enable("user.gdb")
    app.notify("GDB Debugger Enabled")
disable debug mode:
    mode.disable("user.gdb")
    app.notify("GDB Debugger Disabled")


[enable] wind bag mode:
    mode.enable("user.windbg")
    app.notify("windbg Debugger Enabled")
disable wind bag mode:
    mode.disable("user.windbg")
    app.notify("windbg Debugger Disabled")

[enable] ida mode:
    mode.enable("user.ida")
    app.notify("ida Disassembler Enabled")
disable ida mode:
    mode.disable("user.ida")
    app.notify("ida Disassembler Disabled")


#[enable] terminal mode:
#    mode.enable("user.terminal")
#disable terminal mode:
#    mode.disable("user.terminal")

^force see sharp$:
    user.code_set_language_mode("csharp")
^force see $:
    user.code_set_language_mode("c")
^force see plus plus$:
    user.code_set_language_mode("cplusplus")
^force go (lang|language)$:
    user.code_set_language_mode("go")
^force java script$:
    user.code_set_language_mode("javascript")
^force type script$:
    user.code_set_language_mode("typescript")
^force markdown$:
    user.code_set_language_mode("markdown")
^force python$:
    user.code_set_language_mode("python")
^force talon [language]$:
    user.code_set_language_mode("talon")
^force are$: user.code_set_language_mode("r")
^clear language modes$: user.code_clear_language_mode()
