mode: command
-
my nickname: "rihl"
my domain: "uralyx.cz"
new window: key(ctrl-b c)
next window: key(ctrl-b n)
previous window: key(ctrl-b p)
english keyboard [layout]: user.system_command("setxkbmap en")
check keyboard [layout]: user.system_command("setxkbmap cz")
(big vim here):
	"nqt &> /dev/null&\n"
(dev|deaf) (null|now):
	"/dev/null"
to do: "TODO"
travis: "../"

alarm [in] one minute:
	insert("beep 0 60\n")
alarm [in] two minutes:
	insert("beep 0 120\n")

show key log stats:
	user.system_command_nb("keylog-stats")

ex render:
	user.system_command("xr")
