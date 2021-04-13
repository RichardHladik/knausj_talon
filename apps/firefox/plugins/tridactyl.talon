os: linux
tag: user.tridactyl
-

# Navigating the page
down:
    key("j")
up:
    key("k")
[page] top:
    key("g")
    key(g)
[page] bottom:
    key("G")
half up:
    key("u")
half down:
    key("d")
left:
    key("h")
right:
    key("l")
[(page|tab)] (refresh|reload):
    key("r")
(address|Earl|link) copy:
    key("yy")
copy (address|Earl|link):
    key("yy")
open clipboard link:
    key("p")
open new clipboard link:
    key("P")
(insert mode|disable vimium):
    key("i")
visual mode:
    key("v")
visual line mode:
    key("V")
enable vimium:
    key("escape")
focus input:
    key("g")
    key("i")
[open] link [hints]:
    key("f")
[open] link [hints] new:
    key("F")
# TODO: open multiple links
copy link:
    insert("yf")
follow previous [link]:
    insert("[[")
follow next [link]:
    insert("]]")
select next frame:
    insert("gf")
select main frame:
    insert("gF")
mark <user.letter>:
    insert("m{letter}")
go to mark <user.letter>':
    insert("`{letter}")

# Using the vomnibar
page open:
	key(ctrl-l)
page open <user.text>:
	key(ctrl-l)
    insert("{text}")
page open new:
	app.tab_open()
page open new <user.text>:
	app.tab_open()
    insert("{text}")
(page|tab) open bookmark:
    insert("b")
(page|tab) open bookmark <user.text>:
    insert("b")
    insert("{text}")
(page|tab) open bookmark new:
    insert("B")
(page|tab) open bookmark new <user.text>:
    insert("B")
    insert("{text}")
(page|tab) find:
    key("T")
edit address bar:
    key("ge")
edit address bar new tab:
    key("gE")

# Using find
#  Searching
find <user.text>:
    key("/")
    insert("{text}")
    key("enter")
find:
    key("/")
next [result]:
    key("n")
(prev|previous) [result]:
    key("N")

# Navigating history
page back:
    key("H")
page forward:
    key("L")

# Manipulating tabs

(page|tab) new:
    key(ctrl-t)
(page|tab) (previous|left):
    insert("gT")
(page|tab) (next|right):
    insert("gt")
(page|tab) flip:
    key("^")
(page|tab) (end|last):
    key("g")
    key($)
tab <number_small>:
    key("g")
    key(0)
    sleep(200ms)
    user.repeat_insert("gt", number_small)
(page|tab) duplicate:
    insert("yt")
# pin tab
# mute tab
(page|tab) close:
    key(ctrl-w)
(page|tab) reopen:
    key(ctrl-shift-t)
(page|tab) new tab:
    key("W")
move tab left:
    insert("<<")
move tab right:
    insert(">>")

# Miscellaneous
vimium help:
    key("?")

# Unsorted
search :
    key("ctrl-k")
search for <user.text>:
    key("ctrl-k")
    sleep(100ms)
    insert("{text}")
# NOTE: If you use ddg by default
# duckduckgo google mode
google <user.text>:
    key("ctrl-k")
    sleep(100ms)
    insert("!g {text}")
# duckduckgo
duck duck <user.text>:
    key("ctrl-k")
    sleep(100ms)
    insert("{text}")

#
(page|tab) focus:
    # highlight URL bar
    key("ctrl-l")
    sleep(10ms)
    # pop keyboard
    key("escape")
    # trigger find (won't work unless we were in URL bar
    key("ctrl-f")
    sleep(10ms)
    # escape out of find window
    key("escape")
    key("escape")
    # now have general focus
