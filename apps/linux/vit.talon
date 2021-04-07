mode: command
win.title: /To do/
-
jump <number_small>:
	insert(":{number_small}")
	key(return)
task modify: "m"
task add: "a"
task done: "dy"
task (start|stop): "by"
task delete: "dy"
task wait: "w"
task wait tomorrow: "wtomorrow\n"
priority {user.task_priority}: insert("P{user.task_priority}")
context {user.task_context}: insert("c{user.task_context}\n")
tag {user.task_tag}:
	insert(" +{user.task_tag}")

project {user.task_project}:
	insert(" project:'{user.task_project}' ")

wait: " wait:"
due: " due:"
start now: " start:0d "
reload: key(ctrl-l)
cancel: key(escape)
confirm add: key(enter enter)
