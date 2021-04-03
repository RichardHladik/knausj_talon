os: linux
tag: user.i3wm
-
settings():
    user.i3_config_path = "~/.i3/config"
    user.i3_mod_key = "super"


##
# Workspaces
##
portal <number_small>: user.system_command("i3-msg workspace {number_small}")
portal ten: user.system_command("i3-msg workspace 10")
(portal flip|flipper): user.system_command("i3-msg workspace back_and_forth")
portal right: user.system_command("i3-msg workspace next")
portal left: user.system_command("i3-msg workspace prev")

##
# Windows
##
(win|window) left: user.system_command("i3-msg focus left")
(win|window) right: user.system_command("i3-msg focus right")
(win|window) up: user.system_command("i3-msg focus up")
(win|window) down: user.system_command("i3-msg focus down")
((win|window) kill|murder this): user.system_command("i3-msg kill")
(win|window) stack: user.system_command("i3-msg layout stacking")
(win|window) default: user.system_command("i3-msg layout toggle split")
(win|window) tabbed: user.system_command("i3-msg layout tabbed")
(win|window) flip: user.system_command("/home/aa/scripts/i3/i3-focus-last.py --switch")
(win|window) [focus] <number_small>:
    user.system_command("/home/aa/scripts/i3/i3-nth_window_in_workspace.py $(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name') {number_small-1}")

full screen: user.system_command("i3-msg fullscreen")
floating toggle: user.system_command("i3-msg floating toggle")
floating focus: user.system_command("i3-msg focus mode_toggle")
window center: user.system_command("i3-msg move position center")
window resize: user.system_command('i3-msg mode "resize"')
(win|window) horizontal: user.system_command("i3-msg split h")
(win|window) vertical: user.system_command("i3-msg split v")

# TODO - rename to add window
focus parent: user.system_command("i3-msg focus parent")
focus child: user.system_command("i3-msg focus child")

window grow:
    user.i3wm_window_grow(1)
window shrink:
    user.i3wm_window_shrink(1)

horizontal (shell|terminal):
    user.system_command("i3-msg split h")
    user.i3wm_shell()

vertical (shell|terminal):
    user.system_command("i3-msg split v")
    user.i3wm_shell()

# XXX - like also need to match the generic talon commands (snap?)
shuffle <number_small>:  user.system_command("i3-msg move container to workspace {number_small}")
shuffle ten: user.system_command("i3-msg move container to workspace 10")
shuffle flip: user.system_command("i3-msg move container to workspace back_and_forth")
shuffle left: user.system_command("i3-msg move left")
shuffle right: user.system_command("i3-msg move right")
shuffle up: user.system_command("i3-msg move up")
shuffle down: user.system_command("i3-msg move down")

make scratch: user.system_command("i3-msg move scratchpad")
[(show|hide)] scratch: user.system_command("i3-msg scratchpad show")
next scratch:
    user.system_command("i3-msg scratchpad show")
    user.system_command("i3-msg scratchpad show")

# these rely on the user settings for the mod key. see i3wm.py Actions class
launch: user.i3wm_launch()
launch <user.text>:
        user.i3wm_launch()
        sleep(100ms)
        insert("{text}")
screen lock: user.i3wm_launch()

term me: user.i3wm_shell()

new scratch (shell|window):
    user.i3wm_shell()
    sleep(100ms)
    user.system_command("i3-msg move scratchpad")
    user.system_command("i3-msg scratchpad show")
    user.i3wm_window_grow(5)

win switch:
	key(super-d)
	sleep(100ms)
	key(super-d)

##
# Configuration
##
reload i three config: user.system_command("i3-msg reload")
restart i three: user.system_command("i3-msg restart")
