# A lot of this was taken from the fireeye voiceattackprofile, under the
# assumption either people might already be familiar with the commands
# https://fireeye.github.io/IDA_Pro_VoiceAttack_profile/Reference_sheet.html
mode: user.ida_debugger
-
tag(): ida
tag(): debugger

##
# Generic debugger actions
##
action(user.debugger_add_sw_breakpoint): key(f2)

