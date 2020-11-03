#os: linux
tag: user.terminal
-

# general
task version: "task --version\n"
task commands: "task commands\n"
task help: "task help\n"

# task list
task list: "task list\n"
task list orphans: "task project: list\n"
task list untagged: "task tags.none: list\n"
task list completed: "task completed\n"
task list completed project: "task completed project:"
task list <user.text>: "task list {text}\n"
task list project: "task list project: "
task list project <user.text>: "task list project:{text}\n"

task view <user.text>: "task list project:{text}\n"

# task editing
task <number> edit: "task {number} edit\n"

# task add
task add: "task add "
task add <user.text>: "task add {text}\n"
task undo: "task undo\n"

tasks [list] all: "task\n"
(tasks|task next): "task next\n"

# task editing
task <number> (edit|at it)$: "task {number} edit"
task <number> modify: "task {number} modify "


# task starting and stopping
task (<number> start|start <number>)$: "task {number} start"
task (<number> stop|stop <number>)$: "task {number} stop"
task stop active: "task +ACTIVE stop\n"
task (<number> done|done <number>)$: "task {number} done"
task done <number>$: "task {number} done"
task (<number> delete|delete <number>)$: "task {number} delete"

task <number>$: "task {number} "

task filter: "task long | fzf\n"

# requires some sort of personal sync server set up or https://inthe.am, etc
task sink: "task sync\n"
