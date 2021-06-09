mode: command
win.title: /To do/
-
tag(): user.readline
jump <user.number_string>:
	insert(":{number_string}")
	key(return)
task modify: "m"
task add: "a"
task done: "dy"
activate|deactivate: "by"
task delete: "dy"
task wait: "w"
task wait tomorrow: "wtomorrow\n"
priority {user.task_priority}: insert("P{user.task_priority}")
context {user.task_context}: insert("c{user.task_context}\n")
tag {user.task_tag}:
	insert(" +{user.task_tag} ")

project {user.task_project}:
	insert(" project:'{user.task_project}' ")

wait: " wait:"
due: " due:"
scheduled: " scheduled:"
start now: " start:0d "
depends <user.number_string>:
	insert(" depends:{number_string} ")
reload: key(ctrl-l)
cancel: key(escape)
confirm:
	key(enter)
	sleep(50ms)
	key(enter)
