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
