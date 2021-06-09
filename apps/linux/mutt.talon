title: /Mutt/
-
cancel: key(ctrl-c n)
auto save: key(f3)
read and save: key(enter i f3)
save: key(s)
confirm: key(enter y)
commit: "$y"
exit: key(i)
reply: key(r)
group reply|reply all: key(g)
open: key(enter)
not much:
	key(c backspace)
	insert("notmuch://?query=")
up: key(up)
down: key(down)
jump <number_small>:
	insert("{number_small}")
	key(return)
send: key(y)
change: key(c)
box ({user.mailbox})+: insert(user.formatted_text(user.mailbox_list, "DOT_SEPARATED"))
go home: key(ctrl-h)
go sent: "cSent\n"
