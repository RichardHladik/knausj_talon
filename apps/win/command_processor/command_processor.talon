app: windows_command_processor
app: vmware
app: windows_terminal
and win.title: /Command Prompt/
-
# comment or remove tags for command sets you don't want
tag(): user.file_manager
tag(): user.generic_terminal
tag(): user.git
tag(): user.kubectl
tag(): terminal

run last: key(up enter)

kill all:
  key(ctrl-c)
  insert("y")
  key(enter)

action(user.file_manager_refresh_title):
    insert("title Command Prompt: %CD%")
    key(enter)

#action(user.file_manager_go_back):
#    key("alt-left")

#action(user.file_manager_go_forward):
#    key("alt-right")

action(user.file_manager_open_parent):
    insert("cd ..")
    key(enter)
    user.file_manager_refresh_title()

lisa: "dir\n"
katie: "cd "
copy folder:
    insert("xcopy   /e /i /h")
    key(left:9)
force copy file:
    insert("xcopy   /y")
    key(left:4)
drive <user.letter>: "{letter}:\\"
remove file: "del "
find string: "| findstr"
show eye pee: "ipconfig /all\n"

clear screen: "cls\n"
action(edit.delete_line):
  key(escape)

# XXX - because of vmware conflicts
magic up:
    key(ctrl-shift-pageup)

magic down:
    key(ctrl-shift-pagedown)

net use: "net use"

go to desktop: "cd %USERPROFILE%\\Desktop\n"
go to profile: "cd %USERPROFILE%\n"
go to system root: "cd %SYSTEMROOT%\n"
go to system thirty two: "cd %SYSTEMROOT%\\System32\n"
go to drivers: "cd %SYSTEMROOT%\\System32\\Drivers\n"
go to program files: "cd %PROGRAMFILES%\n"

load registry file: "reg /load "
