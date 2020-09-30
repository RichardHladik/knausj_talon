mode: command
-
my nickname: "rihl"
my domain: "uralyx.cz"
my full name: "Richard Hladík"
my phone number: "+420***REMOVED***"
cusp harp: "ksp-h"
cusp zip: "ksp-z"
cusp technical: "ksp-tech"
cusp (og|org): "ksp-org"
cusp (commit|come it|comets): "ksp-commits"
cusp sauce: "ksp-sous"
cusp feedback: "ksp-feedback"
mail (og|org): "=org."
mail select to: "T~t"
mail select from: "T~f"
mail select subject: "T"
mail organize: ";N;N;s"
archive vps: "Archiv.vps"
school back: "Skola.bak"
male cancel: key(ctrl-c n)
in (books|box): "INBOX"
dot ben: ".bin"
new window: key(ctrl-b c)
next window: key(ctrl-b n)
previous window: key(ctrl-b p)
interrupt: key(ctrl-c)
talon: "talon"
english keyboard [layout]: user.system_command("setxkbmap en")
check keyboard [layout]: user.system_command("setxkbmap cz")
watson stop:
	mimic("focus watson")
	sleep(100ms)
	insert("wat stop\n")
watson last:
	mimic("focus watson")
	sleep(100ms)
	key(ctrl-r)
	insert("wat start ")
(give him here|gvim here):
	"gvim &> /dev/null&\n"
(dev|deaf) (null|now):
	"/dev/null"
open dictionary:
	mimic("focus firefox")
	sleep(100ms)
	key(ctrl-t)
	insert("en.wiktionary.org/wiki/")
	key(right)
not much:
	key(c backspace)
	insert("notmuch://?query=")
to do: "TODO"
open google scholar:
	mimic("focus firefox")
	sleep(100ms)
	key(ctrl-t)
	insert("scholar.google.com\n")
(up (dear|dir)|travis): "../"
workflow (rock|rots):
	key(super-d)
	sleep(100ms)
	"workflow roc"
	key(enter)

workflow jack:
	key(super-d)
	sleep(100ms)
	"workflow jack"
	key(enter)
