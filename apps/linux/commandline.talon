# NOTE: these are command line commands, not shell-specific bindings
# see shell.talon for shell-specific keybindings
os: linux
mode: user.terminal
mode: command
and tag: terminal
-
action(edit.delete_word):
	key(ctrl-w)
action(edit.delete_line):
	key(end)
	key(ctrl-u)

file list: "ls "
file list here|lizzie: "ls\n"
file list long: "ls -al "
file list long here|long lizzie: "ls -al\n"
file list latest: "ls -Art | tail -n1\n"
file list folders: "ls -d */\n"
file list by date: "ls -lSrt\n"

# find command
file find all links: "find . -maxdepth 1 -type l  -ls\n"
file find all folders: "find . -maxdepth 1 -type d  -ls\n"
file fine all files: "find . -maxdepth 1 -type f  -ls\n"

# TODO - revisit the grammar for $() commands
call list latest: "$(ls -Art | tail -n1)"

# TODO - somehow make this scriptable to print anything
file edit latest: "edit $(ls -Art | tail -n1)\n"
file link: "ln -s "
file link force: "ln -sf "
file hard link: "ln "
file move: "mv "
file touch: "touch "
file copy: "cp "
file type: "file "
file show <user.text>: "cat {text}"
file show: "cat "
file edit: insert("edit ")
file edit here: insert("edit .\n")
file remove: "rm "
(file|folder) remove recurse: "rm -rI "
file diff: "diff "
# find
file find: "find . -name "
file fuzzy [find]:
    insert("find . -name \"**\"")
    key("left")
    key("left")
file hash: "sha256sum "
file locate: "locate "

file edit read me: insert("edit README.md\n")
file edit make file: insert("edit Makefile\n")

watch latest: "vlc $(ls -Art | tail -n1)"

size here: "du -sh .\n"
size sorted: "du -sh * | sort -h\n"

# directory and files
pivot: "cd "
pivot clip:
    insert("cd ")
    edit.paste()
    key(enter)
pivot {user.paths}:
    insert("cd {user.paths}\n")
    insert("ls\n")
# pivot up doesn't work with talon
pivot back: "cd ../\n"
pivot <number_small> back: 
    insert("cd ")
    insert(user.path_traverse(number_small))
    key(enter)
pivot home: "cd\n"
pivot next:
    insert("cd ")
    key(tab)
    sleep(100ms)
    key(enter)
    insert("ls\n")

pivot (last|flip): "cd -\n"


make (dur|dear|dir|directory): "mkdir -p "
make (dur|dear|dir|directory) <user.text>: "mkdir {text}"
remove (dur|dear|dir|directory): "rmdir "
remove (dur|dear|dir|directory) <user.text>: "rmdir {text}"

# tree
file tree: "tree -f -L 2\n"
file tree more: "tree -f -L "
file tree long: "tree -f -L 2 -p\n"
file tree all: "tree -f -L 2 -a\n"
file tree folders: "tree -f -L 2 -d\n"
file tree depth <number_small>: "tree -f -L {number_small}\n"

folder pop: "popd\n"

# permissions
make executable: "chmod +x "
change ownership: "chown "

# file viewing
less: "less "
now less [that]:
    edit.up()
    insert("| less\n")

clear [screen|page]: "clear\n"


# grepping

rip: "rg -i "
rip around: "rg -B2 -A2 -i "
rip (exact|precise): "rg "
now rip:
    edit.up()
    insert("| rg -i ")

# even though rip is arguably better, we still want grep for remote terminals,
# etc
grep: "grep -i "
grep around: "grep -B2 -A2 -i "
now grep:
    edit.up()
    insert("| grep -i ")

# networking
net [work] I P: "ip addr\n"
net [work] (route|routes): "ip route\n"
net stat: "netstat -ant\n"
net cat: "nc -vv "
net cat listener: "nc -v -l -p "
net my I P: "dig +short myip.opendns.com @resolver1.opendns.com\n"
show hosts file: "cat /etc/hosts\n"
edit hosts file: "sudo vi /etc/hosts\n"
tcp dump: "tcpdump "

generate see tags: "ctags --recurse --exclude=.git --exclude=.pc *"
generate see scope database:
    insert('find . -name "*.c"')
    insert(' -o -name "*.cpp"')
    insert(' -o -name "*.h"')
    insert(' -o -name "*.hpp"')
    insert(' -o -name "*.py"')
    insert(' -o -name "*.s"')
    insert(' -o -name "*.asm"')
    insert('> cscope.files\n')
    insert("cscope -q -R -b -i cscope.files\n")

pee grep: "pgrep "
pee kill: "pkill "
process list: "ps -ef\n"
process top: "htop\n"
head: "head "
head <number_small>: "head -n {number_small} "
(where am I|print working directory): "pwd\n"

# XXX - ~/.edit/sessions/<tab>
edit session:
    insert("edit -S ")

lazy edit:
    insert("edit ")
    insert("$(find . -not -path '*/\\.git/*' -name \"**\")")
    key("left")
    key("left")
    key("left")

lazy edit <user.text>:
    insert("edit ")
    insert("$(find . -not -path '*/\\.git/*' -name \"*{text}*\")\n")

find <user.text> inside (python|pie) files:
    insert('$(find . -name \"*.py\") | xargs rg -i "{text}"\n')

find <user.text> inside (python|pie) files less:
    insert('$(find . -name \"*.py\") | xargs rg -i "{text}\" | less\n')

man page: "man "
so do: "sudo "
so do that: 
    edit.line_start()
    insert("sudo ")
    key(enter)
so do edit: "sudoedit"
d message: "dmesg"
disk usage: "df -h\n"
sis cuddle: "sysctl "
sis cuddle set: "sysctl -w "

# extraction
tar ball create: "tar -cvJf"
tar ball [extract]: "tar -xvaf "
tar ball list: "tar -tf "
(un zip|extract zip): "unzip "

run <user.word>: "{word} "
run curl: "curl "
run double you get: "wget "
download clip:
    insert("wget ")
    edit.paste()
    key(enter)

# because talent doesn't seem to like me saying ./
run script: "./"
run again:
    insert("./")
    key(up enter)
run top: "htop\n"
run vim: "vim "
run make: "make\n"
run see make: "cmake "

sub command:
    insert("$()")
    key(left)

parameter:
    insert("${}")
    edit.left()


# bash convenience stuff
history: "history\n"

net man log: "journalctl -u NetworkManager --no-pager --lines 100\n"

core dump list: "coredumpctl\n"
core dump info: "coredumpctl info\n"
core dump dump: "coredumpctl dump\n"
core dump debug: "coredumpctl debug\n"

# ssh
machine {user.machine}: "{user.machine}"
remote mux: "sst "
secure shell: "ssh "
secure shell <user.text>: "ssh {text}\n"
secure shall key gen: "ssh-keygen -t ed25519\n"
secure copy [<user.text>]:
    insert("scp -r ")
    insert(text or "")
show authorized keys: "vi ~/.ssh/authorized_keys\n"
show pub keys: "cat ~/.ssh/*.pub\n"
edit authorized keys: "vi ~/.ssh/authorized_keys\n"
go secure shell config: "cd ~/.ssh\n"
terminate session:
    key(enter ~ .)

# process management
pee kill <user.text>: "pkill {text}"
kill <number>: "kill -9 {number}"
kill: "kill -9 "
reboot system: "sudo reboot -h now"

# hardware
list memory: "lshw -short -C memory"
list processor: "lscpu\n"
list pee bus: "lspci\n"
list yew bus: "lsusb\n"


(redirect errors|errors to standard out): "2>&1 "
ignore errors: "2>/dev/null"

###
# Wallpaper
###

wallpaper set: "feh --bg-scale "
wallpaper set latest: "feh --bg-scale $(find ~/images/wallpaper/ -name $(ls -Art ~/images/wallpaper/ | tail -n1))\n"


###
# ELF file
###

elf header: "eu-readelf -h "
elf symbols: "eu-readelf -s "


###
# Python
###

(pie|python) new [virtual] (env|environment): "python -m venv env"
python module: "python -m "
(activate|enter python environment): "source env/bin/activate\n"
(deactivate|leave python environment): "deactivate\n"


###
# Screen recording
###
screen record: insert("recordmydesktop")

###
# X11 stuff
###
screen dimensions: "xdpyinfo | grep dimensions\n"
screen resolution: "xdpyinfo | awk '/dimensions/{{print $2}}'\n"

###
# Arch Linux
# https://wiki.archlinux.org/index.php/Arch_Build_System#Retrieve_PKGBUILD_source_using_Git
###
arch source check out: "asp checkout "
arch source export: "asp export "


###
# Media
###

file play: "mpv "


# filesystem
mount deaf S D: "mount /dev/sd"
umount: "umount "
