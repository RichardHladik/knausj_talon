os: linux
mode: user.terminal
mode: command
and tag: user.terminal
-

dev talon:
    insert("cd ~/.talon/user/fidget\n")
    insert("ls\n")

edit talon wiki:
    insert("cd ~/source/talon_wiki\n")
    insert("ls\n")

talon shell:
    insert("~/.talon/bin/repl\n")
talon base:
    insert("cd ~/.talon/\n")
    insert("ls\n")
talon (python|classes):
    insert("cd ~/source/talon/releases/latest/resources/python/lib/python3.7/site-packages/talon\n")
    insert("ls\n")
talon plugins:
    insert("cd ~/source/talon/releases/latest/resources/talon_plugins\n")
    insert("ls\n")
talon source: "cd  ~/source/talon\n"


edit (vim|them) config: "vim ~/.vimrc\n"
jump to (vim|them): "cd ~/.vim\n"
jump to dotfiles: "cd ~/dotfiles\n"

# config
edit (ignore file|git ignore): "vim .gitignore\n"
(edit|at it) (secure shell| S S H) config: "vim ~/.ssh/config\n"
(edit|at it) (eye three|window manager) config: "vim ~/.i3/config\n"
(edit|at it) window manager config: "vim ~/.i3/config\n"

# snippets
fuzzy vimdiff:
    insert("edit -d $(find . -name \"**\")")
    edit.left()
    edit.left()

###
# Work
###

# shell helpers
go to work:
    insert("source ~/projects/current &&")
    insert(" cd $ACTIVE_PROJECT\n")
(go|jump) [to] alternate [work] (project|directory):
    insert("source ~/projects/alternate &&")
    insert(" cd $ACTIVE_PROJECT\n")
edit [to] (current|active) [work] project: "vim ~/projects/current\n"
edit [to] alternate [work] project: "vim ~/projects/alternate\n"
edge (dur|dir): "cd ~/work/source/edg\n"
run debug: "./debug.sh\n"
run project:
    insert("run_active_project\n")
build project:
    insert("build_active_project\n")
super kill g d b: "sudo pkill gdb\n"
resource config:
    insert("delete br\ny\n")
    insert("source debug_scripts/4.90.gdb\n")

edit sue do config: "sudo visudo\n"
edit find results:
    insert("vim $(find . -name \"\")")
    edit.left()
    edit.left()
run talon update: "~/.talon/bin/update\n"
