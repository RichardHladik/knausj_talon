# USAGE: - See doc/vim.md for usage and tutorial
#  - See code/vim.py very implementation and additional motion grammars
# FILES:
#   * vim.talon - commands that do not work in terminal mode
#   * vim_mixed.talon - commands that do not work in terminal mode
#   * vim_terminal.talon - commands that only work in terminal mode
#   *
#
# NOTE:
# Where applicable I try to explicitly select appropriate API for terminal
# escaping, etc. However in cases where it is unlikely you will say a command
# from terminal mode, I don't bother. Example "save file" doesn't have explicit
# terminal escaping. This also helps an embedded vim running inside of a vim
# terminal work properly.
#
# TODO:
#  - add clearline for command mode / fzf plugin
#  - test on windows and mac

os:linux
win.title: /VIM/
#app:vim
#and not tag: user.vim_terminal
-

tag(): user.vim
tag(): user.tabs

# Talon VIM plugin tags. Uncomment tags for plugins you having installed and
# want to use.
tag(): user.vim_ale
tag(): user.vim_change_inside_surroundings
tag(): user.vim_cscope
tag(): user.vim_easy_align
tag(): user.vim_easymotion
tag(): user.vim_fern
tag(): user.vim_fern_mapping_fzf
tag(): user.vim_floaterm
tag(): user.vim_fugitive
tag(): user.vim_fugitive_summary
tag(): user.vim_fzf
tag(): user.vim_markdown_toc
tag(): user.vim_nerdtree
tag(): user.vim_obsession
tag(): user.vim_plug
tag(): user.vim_signature
tag(): user.vim_surround
tag(): user.vim_taboo
tag(): user.vim_tabular
tag(): user.vim_taskwiki
tag(): user.vim_unicode
tag(): user.vim_ultisnips
tag(): user.vim_wiki
tag(): user.vim_you_are_here
tag(): user.vim_youcompleteme
tag(): user.vim_zoom


settings():
    # Whether or not to always revert back to the previous mode. Example, if
    # you are in insert mode and say 'delete word' it will delete one word and
    # keep you in insert mode. Same as ctrl-o in VIM.
    user.vim_preserve_insert_mode = 1

    # Whether or not to automatically adjust modes when using commands. Example
    # saying "go line 50" will first switch you out of INSERT into NORMAL and
    # then jump to the line. Disabling this setting would put :50\n into your
    # file if said "go line 50" while in INSERT mode.
    user.vim_adjust_modes = 1

    # Select whether or not talon should dispatch notifications on mode changes
    # that are made. Not yet completed, as notifications are kind of wonky on
    # Linux
    user.vim_notify_mode_changes = 0

    # Whether or not all commands that transfer out of insert mode should
    # automatically escape out of terminal mode. Turning this on is quite
    # troublesome.
    user.vim_escape_terminal_mode = 0

    # When issuing counted actions in vim you can prefix a count that will,
    # however the existing talon grammar already allows you to utter a number,
    # so we want to cancel any existing counts that might already by queued in
    # vim in error. This also helps prevent accidental number queueing if talon
    # mishears a command such as "delete line" as "delete" "nine". Without this
    # setting, if you then said "undo" it would undo the last 9 changes, which
    # is annoying.
    #
    # This setting only applies to commands run through the actual counted
    # actions grammar itself
    user.vim_cancel_queued_commands = 1

    # When you are escaping queued commands, it seems vim needs time to recover
    # before issuing the subsequent commands. This controls how long it waits,
    # in seconds
    user.vim_cancel_queued_commands_timeout = 0.20

    # It how long to wait before issuing commands after a mode change. You
    # want adjust this if when you say things like undo from INSERT mode, an
    # "u" gets inserted into INSERT mode
    user.vim_mode_change_timeout = 0.25

    # When you preserve mode and switch into into insert mode it will often
    # move your cursor, which can mess up the commands you're trying to run from
    # insert. This setting prevent the cursor move
    user.vim_mode_switch_moves_cursor = 0

    # Whether or not use rpc if it is available
    user.vim_use_rpc = 1

    # Adds debug output to the talon log
    user.vim_debug = 0

###
# Actions - Talon generic_editor.talon implementation
###
#
# NOTE: You can disable generic_editor.talon by renaming it, and still fully
# control vim. These are more for people that are used to the official talon
# editor commands that want to trial vim a bit. I don't personally use most of
# the actions here, so they have not been thoroughly tested.
#
###
action(edit.find):
    user.vim_normal_mode_exterm_key("/")
action(edit.find_next):
    user.vim_normal_mode_key("n")
action(edit.word_left):
    user.vim_normal_mode_key("b")
action(edit.word_right):
    user.vim_normal_mode_key("w")
action(edit.left):
    key(left)
action(edit.right):
    key(right)
action(edit.up):
    key(up)
action(edit.down):
    key(down)
action(edit.line_start):
    user.vim_normal_mode_key("^")
action(edit.line_end):
    user.vim_normal_mode_key("$")
action(edit.file_end):
    user.vim_normal_mode_key(G)
action(edit.file_start):
    user.vim_normal_mode("gg")
action(edit.page_down):
    user.vim_normal_mode_exterm_key("ctrl-f")
action(edit.page_up):
    user.vim_normal_mode_exterm_key("ctrl-b")

action(edit.extend_line_end):
    user.vim_visual_mode("$")
action(edit.extend_left):
    user.vim_visual_mode("h")
action(edit.extend_right):
    user.vim_visual_mode("l")
action(edit.extend_line_up):
    user.vim_visual_mode("k")
action(edit.extend_line_down):
    user.vim_visual_mode("j")
action(edit.extend_word_left):
    user.vim_visual_mode("b")
action(edit.extend_word_right):
    user.vim_visual_mode("w")
action(edit.extend_line_start):
    user.vim_visual_mode("^")
action(edit.extend_file_start):
    user.vim_visual_mode("gg")
action(edit.extend_file_end):
    user.vim_visual_mode("G")

action(edit.indent_more):
    user.vim_normal_mode(">>")
action(edit.indent_less):
    user.vim_normal_mode("<<")
action(edit.delete_line):
    user.vim_normal_mode("dd")
action(edit.delete):
    user.vim_insert_mode_key("backspace")

# note these are for mouse highlighted copy/paste. shouldn't be used for actual
# vim commands
action(edit.copy):
    key(ctrl-shift-c)
action(edit.paste):
    key(ctrl-shift-v)

action(edit.redo):
    user.vim_normal_mode_key("ctrl-r")
action(edit.undo):
    user.vim_normal_mode_key("u")

###
# `code/vim.py` actions - includes most motions and core commands
###
# commands that can be triggered in visual or normal mode, and generally don't
# have counting, etc
<user.vim_normal_counted_motion_command>$:
    insert("{vim_normal_counted_motion_command}")
<user.vim_normal_counted_motion_keys>$:
    key("{vim_normal_counted_motion_keys}")
<user.vim_motions_all_adjust>$:
    insert("{vim_motions_all_adjust}")
<user.vim_normal_counted_action>$:
    insert("{vim_normal_counted_action}")
<user.vim_normal_counted_actions_keys>$:
    key("{vim_normal_counted_actions_keys}")
<user.vim_counted_motion_command_with_ordinals>$:
    insert("{vim_counted_motion_command_with_ordinals}")

###
# File editing and management
###
# These are prefix with `file` to match the `file save` action defined by talon
action(edit.save):
    user.vim_command_mode(":w\n")
sage:
    user.vim_command_mode(":w\n")
file save as:
    key(escape)
    user.vim_command_mode(":w ")
file save all:
    user.vim_command_mode_exterm(":wa\n")
(file save and (quit|close)|squeak):
    user.vim_command_mode(":wq\n")
file (close|quite):
    user.vim_command_mode(":q\n")

# no \n as a saftey measure
(close|quit) all:
    user.vim_command_mode_exterm(":qa")

force (close|quit) all:
    user.vim_command_mode_exterm(":qa!")

force (close|quit):
    user.vim_command_mode_exterm(":q!\n")
refresh file:
    user.vim_command_mode(":e!\n")
edit [file|new]:
    user.vim_command_mode_exterm(":e ")
reload [vim] config:
    user.vim_command_mode_exterm(":so $MYVIMRC\n")

# For when the VIM cursor is hovering on a path
open [this] link: user.vim_normal_mode("gx")
open this file: user.vim_normal_mode("gf")
open this file offset: user.vim_normal_mode("gF")
open this file in [split|window]:
    user.vim_set_normal_mode()
    key(ctrl-w)
    key(f)
open this file in vertical [split|window]:
    user.vim_command_mode(":vertical wincmd f\n")
pillar this:
    user.vim_command_mode(":vertical wincmd f\n")


(show|list) current directory: user.vim_command_mode(":pwd\n")
change (buffer|current) directory: user.vim_command_mode(":lcd %:p:h\n")
reorient: user.vim_command_mode(":lcd %:p:h\n")

###
# Navigation, movement and jumping
#
# NOTE: Majority of more core movement verbs are in code/vim.py
###
# XXX - line conflicts too much with nine,
#[(go|jump)] [to] line <number>:
[go] row <number>:
    user.vim_command_mode_exterm(":{number}\n")

# These are especially useful when in terminal mode and you want to jump to
# something in normal mode that is in the history. Doubley so if you use
# set relativenumber in terminal mode
[go] relative up [line] <number_small>:
    user.vim_normal_mode_exterm("{number_small}k")

[go] relative down [line] <number_small>:
    user.vim_normal_mode_exterm("{number_small}j")

# XXX - add support for [{, [(, etc
matching: user.vim_any_motion_mode_key("%")
matching <user.symbol_key>: user.vim_any_motion_mode("f{symbol_key}%")

# jump list
show jump list: user.vim_command_mode_exterm(":jumps\n")
clear jump list: user.vim_command_mode_exterm(":clearjumps\n")
go (last|prev|previous) jump [entry]: user.vim_normal_mode_exterm_key("ctrl-o")
go (next|newer) jump [entry]: user.vim_normal_mode_exterm_key("ctrl-i")
(go|jump) [to] last change: user.vim_normal_mode("g;")
(go|jump) [to] next change: user.vim_normal_mode("g,")
# XXX - add jump to <id>

# ctags/symbol
(jump|dive) [to] (symbol|tag): user.vim_normal_mode_key("ctrl-]")
(pop|leave) (symbol|tag): user.vim_normal_mode_key("ctrl-t")

# scrolling and page position
# NOTE counted scrolling his handled in vim.py
(focus|orient) [on] line <number>: user.vim_command_mode_exterm(":{number}\nzt")
center [on] line <number>: user.vim_command_mode_exterm(":{number}\nz.")
scroll top: user.vim_normal_mode_exterm("zt")
scroll (center|middle): user.vim_normal_mode_exterm("zz")
scroll bottom: user.vim_normal_mode_exterm("zb")
scroll top reset cursor: user.vim_normal_mode_exterm("z\n")
scroll middle reset cursor: user.vim_normal_mode_exterm("z.")
scroll bottom reset cursor: user.vim_normal_mode_exterm("z ")

###
# Text editing, copying, and manipulation
###

change remaining line: user.vim_normal_mode_key("C")
change line: user.vim_normal_mode("cc")
# XXX - this might be suited for some automatic motion thing in vim.py
swap characters:
    user.vim_normal_mode("x")
    user.vim_normal_mode("p")
swap words:
    user.vim_normal_mode("dww")
    user.vim_normal_mode("P")
swap lines:
    user.vim_normal_mode("dd")
    user.vim_normal_mode("p")
swap paragraph:
    user.vim_normal_mode("d}}")
    user.vim_normal_mode("p")
replace <user.unmodified_key>:
    user.vim_any_motion_mode("r{unmodified_key}")
replace (ship|upper|upper case) <user.letters>:
    user.vim_any_motion_mode_key("r")
    user.insert_formatted(letters, "ALL_CAPS")

# indenting
# XXX - are temporarily disabled for speed testing
# indent [line] <number> through <number>$:
#     user.vim_command_mode(":{number_1},{number_2}>\n")
# unindent [line] <number> through <number>$:
#     user.vim_command_mode(":{number_1},{number_2}>\n")
# XXX - double check against slide right/left
(shift|indent) right: user.vim_normal_mode(">>")
(shift|indent) left: user.vim_normal_mode("<<")

# deleting
(delete|trim) remaining [line]:
    user.vim_normal_mode_key("D")
# XXX - are temporarily disabled for speed testing
#delete line [at|number] <number>$:
#    user.vim_command_mode(":{number}d\n")
#delete (line|lines) [at|number] <number> through <number>$:
#    user.vim_command_mode(":{number_1},{number_2}d\n")
#delete (until|till) line <number>:
#    user.vim_normal_mode_np("m'")
#    insert(":{number}\n")
#    user.vim_set_visual_line_mode()
#    insert("''d")


# XXX - seems buggy
#clear line:
#    user.vim_insert_mode_key("ctrl-u")

wipe line:
    user.vim_normal_mode("0d$")

# delete a line without clobbering the paste register
# XXX - this should become a general yank, delete, etc command prefix imo
forget line:
    user.vim_normal_mode("\"_dd")

# copying
# XXX - are temporarily disabled for speed testing
#(copy|yank) line (at|number) <number>$:
#    user.vim_command_mode_exterm(":{number}y\n")
#(copy|yank) <number_small> lines at line <number>$:
#    user.vim_command_mode_exterm(":{number}\n")
#    user.vim_normal_mode_exterm("y{number_small}y")
#(copy|yank) line (at|number) <number> through <number>:
#    user.vim_command_mode_exterm(":{number_1},{number_2}y\n")
#    user.vim_command_mode(":{number_1},{number_2}y\n")
#    user.vim_command_mode("p")
#
#(copy|yank) line relative up <number>:
#    user.vim_command_mode_exterm("{number}k")
#    user.vim_command_mode("yy")
#(copy|yank) <number_small> lines relative up <number>:
#    user.vim_command_mode_exterm("{number}k")
#    user.vim_command_mode("{number_small}yy")
(copy|yank) (above|last) <number_small> lines:
    user.vim_normal_mode_exterm("{number_small}k")
    user.vim_normal_mode_exterm("y{number_small}y")
    user.vim_normal_mode_exterm("{number_small}j")

# duplicating
# These are multi-line like this to perserve INSERT.
# XXX - are temporarily disabled for speed testing
#(duplicate|paste) line <number> on line <number>$:
#    user.vim_command_mode(":{number_1}y\n")
#    user.vim_command_mode(":{number_2}\n")
#    user.vim_command_mode("p")
#(duplicate|paste) lines <number> through <number>$:
#     user.vim_command_mode(":{number_1},{number_2}y\n")
#     user.vim_command_mode("p")
#(duplicate|paste) line <number>$:
#    user.vim_command_mode(":{number}y\n")
#    user.vim_command_mode("p")
(dup|duplicate) line: user.vim_normal_mode_np("Yp")

# start ending at end of file
append file:
    user.vim_normal_mode_np("Go")

push:
    user.vim_normal_mode_np("$a")
push <user.unmodified_key>:
    user.vim_normal_mode_np("$a{unmodified_key}")

# paste to the end of a line
# XXX
push it:
    user.vim_normal_mode_np("A ")
    key(escape p)


insert <user.text>:
    user.vim_insert_mode("{text}")

# helpful for fixing typos or bad lexicons that miss a character
(inject|cram) <user.unmodified_key> [before]:
    user.vim_insert_mode_key("{unmodified_key}")
    # since there is no ctrl-o equiv coming from normal
    key(escape)

(inject|cram) <user.unmodified_key> after:
    user.vim_normal_mode_key("a {unmodified_key}")
    # since we can't perserve mode with ctrl-o
    key(escape)

# XXX - look into how this works
filter line: "=="

[add] gap above:
    user.vim_command_mode(":pu! _\n")
    user.vim_command_mode(":'[+1\n")
[add] gap below:
    user.vim_command_mode(":pu _\n")
    user.vim_command_mode(":'[-1\n")

# XXX - This should be a callable function so we can do things like:
#       '.swap on this <highlight motion>'
#       'swap between line x, y'
# assumes visual mode
swap (selected|highlighted):
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("s///g")
    key(left)
    key(left)
    key(left)

sort (selected|highlighted):
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("sort\n")

# assumes visual mode
reswap (selected|highlighted):
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    key(up)

# Selects current line in visual mode and triggers a word swap
swap [word] on [this] line:
    key(V)
    insert(":")
    sleep(50ms)
    insert("s///g")
    key(left:3)

# assumes visual mode
deleted selected empty lines:
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("g/^$/d\\j")

swap global:
    user.vim_command_mode(":%s///g")
    key(left:3)

###
# Buffers
###
((buf|buffer) list|list (buf|buffer)s): user.vim_command_mode_exterm(":ls\n")
(buf|buffer) (close|delete) <number_small>: user.vim_command_mode_exterm(":bd {number_small} ")
(close|delete) (buf|buffer) <number_small>: user.vim_command_mode_exterm(":bd {number_small} ")
(buf|buffer) close current: user.vim_command_mode(":bd\n")
(delete|close) (current|this) buffer: user.vim_command_mode_exterm(":bd\n")
botch: user.vim_command_mode_exterm(":bd\n")
force botch: user.vim_command_mode_exterm(":bd!\n")
force (buf|buffer) close: user.vim_command_mode_exterm(":bd!\n")
(buf|buffer) open: user.vim_command_mode_exterm(":b ")
[go] (buf|buffer) (first|rewind): user.vim_command_mode_exterm(":br\n")
[go] (buf|buffer) (left|prev): user.vim_command_mode_exterm(":bprev\n")
[go] (buf|buffer) (right|next): user.vim_command_mode_exterm(":bnext\n")
[go] (buf|buffer) flip: user.vim_command_mode_exterm(":b#\n")
[go] (buf|buffer) last: user.vim_command_mode_exterm(":bl\n")
close (bufs|buffers): user.vim_command_mode_exterm(":bd ")
[go] (buf|buffer) <number_small>: user.vim_command_mode_exterm(":b {number_small}\n")
# creates a split and then moves the split to a tab. required for when the
# current tab has only one split
(buf|buffer) (move to|make) tab:
    user.vim_normal_mode_exterm(":split\n")
    key(ctrl-w)
    key(T)
(buf|buffer) rename: user.vim_command_mode_exterm(":file ")
(buf|buffer) rename <user.text>: user.vim_command_mode_exterm(":file {text}")
new (empty|unnamed) buffer: user.vim_command_mode_exterm(":enew\n")
(buf|buffer) do: user.vim_command_mode_exterm(":bufdo ")

###
# Splits
#
# XXX - it may be cleaner to have these in a vim.py function
# XXX - most split open commands should be able to take a buffer argument
###
# creating splits
(split new [horizontal]|river):
    user.vim_set_normal_mode_exterm()
    key("ctrl-w")
    key(s)

(split new vertical|pillar):
    user.vim_set_normal_mode_exterm()
    key("ctrl-w")
    key(v)

new top left split:
    user.vim_command_mode_exterm(":to split\n")

new left above split:
    user.vim_command_mode_exterm(":lefta split\n")

new right below split:
    user.vim_command_mode_exterm(":rightb split\n")

new (bot|bottom) right split:
    user.vim_command_mode_exterm(":bo split\n")

new vertical top left split:
    user.vim_command_mode_exterm(":vertical to split\n")

new vertical left above split:
    user.vim_command_mode_exterm(":vertical lefta split\n")

new vertical right below split:
    user.vim_command_mode_exterm(":vertical rightb split\n")

new vertical (bot|bottom) right split:
    user.vim_command_mode_exterm(":vertical bo split\n")

# open specified buffer in new split
split (buf|buffer) <number_small>:
    user.vim_set_normal_mode_exterm()
    insert("{number_small}")
    key("ctrl-w")
    key("ctrl-^")

# open specified buffer in new vertical split
vertical split (buf|buffer) <number_small>:
    user.vim_command_mode_exterm(":vsplit {number_small}")

# creating and auto-entering splits

split (close|quit):
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(q)

# technically this won't always work
split reopen vertical:
    user.vim_command_mode_exterm(":vsplit#\n")
split reopen [horizontal]:
    user.vim_command_mode_exterm(":split#\n")

new (empty|unnamed) [horizontal] split:
    user.vim_command_mode_exterm(":new\n")
new (empty|unnamed) (vertical|v) split:
    user.vim_command_mode_exterm(":vnew\n")

# navigating splits
split <user.vim_arrow>:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key("{vim_arrow}")
(split flip|spitter):
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(p)
split top left:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(t)
split next:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(w)
split (previous|prev):
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(W)
split bottom right:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(b)
split preview:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(P)
split <number_small>:
    user.vim_set_normal_mode_exterm()
    insert("{number_small}")
    key(ctrl-w ctrl-w)

# personal convenience shortcuts

# split right
sprite:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(l)

# split left
spleff:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(h)

# split top left
splop:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(t)

# split bottom left
splot:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(t)
    key(ctrl-w)
    key(j)

sprot:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(b)


# moving windows
split (only|exclusive):
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(o)
split rotate [right]:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(r)
split rotate left:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(R)
split move (up|top):
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(K)
split move (down|bottom):
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(J)
split move right:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(L)
split move left:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(H)
split (move to|make) tab:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(T)

# window resizing
(split equalize|balance):
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(=)

# atm comboing these with ordinals is best, but may add number support
split taller:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(+)
    user.vim_set_normal_mode_exterm()
split shorter:
    user.vim_set_normal_mode_exterm()
    key(ctrl-w)
    key(-)
    user.vim_set_normal_mode_exterm()
split fatter:
    key(ctrl-w)
    key(>)
    user.vim_set_normal_mode_exterm()
split skinnier:
    key(ctrl-w)
    key(<)
set split width:
    user.vim_command_mode_exterm(":resize ")
set split height:
    user.vim_set_command_mode_exterm(":vertical resize ")

(split|window) do:
    user.vim_command_mode_exterm(":windo ")

###
# Diffing
###
(split|window) start diff:
    user.vim_command_mode_exterm(":windo diffthis\n")

(split|window) end diff:
    user.vim_command_mode_exterm(":windo diffoff\n")

buffer start diff:
    user.vim_command_mode_exterm(":bufdo diffthis\n")

buffer end diff:
    user.vim_command_mode_exterm(":bufdo diffthis\n")

# XXX - talon doesn't like the word diff
(refresh|update) (changes|diff):
    user.vim_command_mode_exterm(":diffupdate\n")

[go] next (conflict|change):
    user.vim_normal_mode_exterm("]c")

[go] (prev|previous) (conflict|change):
    user.vim_normal_mode_exterm("[c")

###
# Tab
#
# This is a combination of Talon generic commands from `misc/tab.talon` and my
# own extras.
###

# `misc/tab.talon` versions
action(app.tab_open): user.vim_command_mode_exterm(":tabnew\n")
action(app.tab_close): user.vim_command_mode_exterm(":tabclose\n")
action(app.tab_next): user.vim_command_mode_exterm(":tabnext\n")
[go] tab <number_small>: user.vim_normal_mode_exterm("{number_small}gt")


(list|show) tabs: user.vim_command_mode(":tabs\n")
[go] tab (next|right): user.vim_command_mode_exterm(":tabnext\n")
[go] tab (left|prev|previous): user.vim_command_mode_exterm(":tabprevious\n")
[go] tab first: user.vim_command_mode_exterm(":tabfirst\n")
[go] tab last: user.vim_command_mode_exterm(":tablast\n")
([go] tab flip|tipper): user.vim_normal_mode_exterm("g\t")
tab edit: user.vim_command_mode_exterm(":tabedit ")
tab move right: user.vim_command_mode_exterm(":tabm +\n")
tab move left: user.vim_command_mode_exterm(":tabm -\n")
edit (buf|buffer) <number_small> [in] new tab: user.vim_command_mode_exterm(":tabnew #{number_small}\n")

[new] tab terminal: user.vim_command_mode_exterm(":tabe term://bash\n")

###
# Settings
###
# XXX - this is a weird edge case because we actually probably want to slip back
# to the terminal mode after setting options, but atm
# user.vim_normal_mode_exterm() implies no preservation
(show|set) highlight search: user.vim_command_mode_exterm(":set hls\n")
lights out:
    user.vim_command_mode_exterm(":set nohls\n")
lights on:
    user.vim_command_mode_exterm(":set hls\n")
# only disable until next search
lights off:
    user.vim_command_mode_exterm(":noh\n")
(show|set) line numbers: user.vim_command_mode_exterm(":set nu\n")
(show|set) absolute [line] [numbers]:
    user.vim_command_mode_exterm(":set norelativenumber\n")
    user.vim_command_mode_exterm(":set number\n")
(show|set) relative [line] [numbers]:
    user.vim_command_mode_exterm(":set nonumber\n")
    user.vim_command_mode_exterm(":set relativenumber\n")
# XXX - make a vimrc function to toggle
(unset|set no|hide) line numbers: user.vim_command_mode_exterm(":set nonu\n")
show [current] settings: user.vim_command_mode_exterm(":set\n")
(unset paste|set no paste): user.vim_command_mode_exterm(":set nopaste\n")
# very useful for reviewing code you don't want to accidintally edit if talon
# mishears commands
set modifiable:
    user.vim_command_mode_exterm(":set modifiable\n")
(unset modifiable|set no modifiable):
    user.vim_command_mode_exterm(":set nomodifiable\n")
show filetype:
    user.vim_command_mode_exterm(":set filetype\n")
show tab stop:
    user.vim_command_mode_exterm(":set tabstop\n")
    user.vim_command_mode_exterm(":set shiftwidth\n")
set tab stop <digits>:
    user.vim_command_mode_exterm(":set tabstop={digits}\n")
    user.vim_command_mode_exterm(":set shiftwidth={digits}\n")
set see indent:
    user.vim_command_mode_exterm(":set cindent\n")
(set no see indent|unset see indent):
    user.vim_command_mode_exterm(":set nocindent\n")
set smart indent:
    user.vim_command_mode_exterm(":set smartindent\n")
(set no smart indent|unset smart indent):
    user.vim_command_mode_exterm(":set nosmartindent\n")
set file format unix:
    user.vim_command_mode_exterm(":set ff=unix\n")

###
# Marks
###
(new|create) mark <user.letter>:
#    user.vim_set_normal_mode_exterm()
#    key(m)
#    key(letter)
    user.vim_normal_mode_exterm_keys("m {letter}", "True")
(go|jump) [to] mark <user.letter>:
    user.vim_set_normal_mode_exterm()
    key(`)
    key(letter)
(del|delete) (mark|marks):
    user.vim_command_mode_exterm(":delmarks ")
(del|delete) all (mark|marks):
    user.vim_command_mode_exterm(":delmarks! ")
(list|show) [all] marks:
    user.vim_command_mode_exterm(":marks\n")
(list|show) specific marks:
    user.vim_command_mode_exterm(":marks ")
(go|jump) [to] last edit: user.vim_normal_mode("`.")
(go|jump) [to] last insert: user.vim_normal_mode("`^")
# differences this puts you into insert mode
continue last insert:user.vim_normal_mode("gi")
(go|jump) [to] last (cursor|location): user.vim_normal_mode_exterm("``")

###
# Session
###
(make|save) session: user.vim_command_mode_exterm(":mksession ")
force (make|save) session: user.vim_command_mode_exterm(":mksession! ")
# XXX - this should be made into a setting
(load|open) session: user.vim_command_mode_exterm(":source ~/.vim/sessions/")

###
# Macros and registers ''
###
(register|registers|macros) list: user.vim_command_mode_exterm(":reg\n")
show (register|macro) <user.letter>: user.vim_command_mode(":reg {letter}\n")
play macro <user.letter>: user.vim_any_motion_mode("@{letter}")
(repeat|re) macro: user.vim_any_motion_mode("@@")
record macro <user.letter>: user.vim_any_motion_mode("q{letter}")
(finish macro|cancel macro|stop macro|stop recording): user.vim_any_motion_mode("q")
modify [register|macro] <user.letter>:
    user.vim_command_mode(":let @{letter}='")
    key(ctrl-r)
    key(ctrl-r)
    insert("{letter}")
    key(')

[copy] register <user.unmodified_key> [in] to [register] <user.unmodified_key>:
    user.vim_command_mode(":let@{any_2}=@{any_1}\n")
(paste from register|put) <user.unmodified_key>: user.vim_any_motion_mode('"{unmodified_key}p')
yank (into|to) register <user.unmodified_key>:
    user.vim_any_motion_mode('"{unmodified_key}y')
#clear (into|to) register <user.unmodified_key>:
#    user.vim_any_motion_mode('"{unmodified_key}d')

# XXX - this should allow counted yanking, into register should become an
# optional part of vim.py matching
yank <user.vim_text_objects> [(into|to)] register <user.unmodified_key>:
    user.vim_any_motion_mode('"{unmodified_key}y{vim_text_objects}')
#clear <user.vim_text_objects> [(into|to)] register <user.unmodified_key>:
#    user.vim_any_motion_mode('"{unmodified_key}d{vim_text_objects}')



###
# Informational
###
display current line number: user.vim_normal_mode_key(ctrl-g)
file info: user.vim_normal_mode_key(ctrl-g)
# shows buffer number by pressing 2
extra file info:
    key(2)
    key(ctrl-g)
vim help: user.vim_command_mode_exterm(":help ")
show ask e code:
    key(g 8)
show last output:
    key(g <)
open man page: user.vim_command_mode_exterm(":Man ")
man page this: user.vim_normal_mode("K")

###
# Mode Switching
###
normal mode: user.vim_set_normal_mode_np()
insert mode: user.vim_set_insert_mode()
# command mode: user.vim_set_command_mode()
command mode: user.vim_any_motion_mode_exterm_key(":")
(replace mode|overwrite): user.vim_set_replace_mode()
visual replace mode: user.vim_set_visual_replace_mode()
visual mode: user.vim_set_visual_mode()
visual line mode: user.vim_set_visual_line_mode()
# visual block mode: user.vim_set_vblock_mode()
# XXX - This will perserve INSERT atm, so not really a proper mode switch
visual block mode: user.vim_any_motion_mode_exterm_key("ctrl-v")


###
# Searching
###
search:
    user.vim_any_motion_mode_exterm("/\\c")

search sensitive:
    key(escape)
    user.vim_any_motion_mode_exterm("/\\C")

search <user.text>$:
    user.vim_any_motion_mode_exterm("/\\c{text}\n")

search <user.text> sensitive$:
    user.vim_any_motion_mode_exterm("/\\C{text}\n")

search <user.ordinals> <user.text>$:
    user.vim_any_motion_mode_exterm("{ordinals}/\\c{text}\n")

search (reversed|reverse) <user.text>$:
    user.vim_any_motion_mode_exterm("?\\c{text}\n")

search (reversed|reverse):
    user.vim_any_motion_mode_exterm("?\\c")

search (reversed|reverse) sensitive:
    user.vim_any_motion_mode_exterm("?\\C")

# XXX - is it possible to integrate these with vim_motions_with_character?
# ordinals work different for `t` for some reason, so we don't need to -1
till <user.ordinals> <user.unmodified_key>:
    user.vim_any_motion_mode("t{unmodified_key}{ordinals};")

till (reversed|previous) <user.ordinals> <user.unmodified_key>:
    user.vim_any_motion_mode("T{unmodified_key}{ordinals};")

find <user.ordinals> <user.unmodified_key>:
    user.vim_any_motion_mode("f{unmodified_key}{ordinals-1};")

find (reversed|previous) <user.ordinals> <user.unmodified_key>:
    user.vim_any_motion_mode("F{unmodified_key}{ordinals-1};")

###
# Visual Text Selection
###
(visual|select|highlight) line: user.vim_visual_mode("V")
block (visual|select|highlight): user.vim_any_motion_mode_exterm_key("ctrl-v")
(visual|select|highlight) block: user.vim_any_motion_mode_exterm_key("ctrl-v")

(select|highlight) <user.vim_select_motion>:
    user.vim_visual_mode("{vim_select_motion}")

# XXX - swap was something that doesn't go higher than 10k for line count
(select|highlight) lines <number> through <number>:
    user.vim_normal_mode_np("{number_1}G")
    user.vim_set_visual_mode()
    insert("{number_2}G")

# XXX - swap was something that doesn't go higher than 10k for line count
block (select|highlight) lines <number> through <number>:
    user.vim_normal_mode_np("{number_1}G")
    user.vim_set_visual_block_mode()
    insert("{number_2}G")

(select|highlight) <number_small> lines:
    user.vim_set_visual_line_mode()
    insert("{number_small-1}j")

block (select|highlight) <number_small> lines:
    user.vim_set_visual_block_mode()
    insert("{number_small-1}j")

(select|highlight) <number_small> lines at line <number>:
    user.vim_normal_mode_np("{number}G")
    user.vim_set_visual_line_mode()
    insert("{number_small-1}j")

block (select|highlight) <number_small> lines at line <number>:
    user.vim_normal_mode_np("{number}G")
    user.vim_set_visual_block_mode()
    insert("{number_small-1}j")

(select|highlight) <number_small> above:
    user.vim_normal_mode_np("{number_small}k")
    user.vim_set_visual_line_mode()
    insert("{number_small-1}j")

block (select|highlight) <number_small> above:
    user.vim_normal_mode_np("{number_small}k")
    user.vim_set_visual_block_mode()
    insert("{number_small-1}j")

(select|highlight) (until|till) line <number>:
    user.vim_normal_mode_np("m'")
    insert(":{number}\n")
    user.vim_set_visual_line_mode()
    insert("''")

block (select|highlight) (until|till) line <number>:
    user.vim_normal_mode_np("m'")
    insert(":{number}\n")
    user.vim_set_visual_block_mode()
    insert("''")

# Greedily highlight whatever is under the cursor. Doesn't work if on the first
# character of the entry, in which case you should say a normal motion like
# "select big end", etc
select this:
    user.vim_normal_mode_np("B")
    user.vim_visual_mode("E")

###
# Visual Text Editing
###
prefix <user.vim_select_motion> with <user.unmodified_key>:
    user.vim_visual_mode("{vim_select_motion}")
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("s/^/{unmodified_key}/g\n")

# Assumes visual mode
# XXX - possibly worth moving to a file that actually triggers on a visual mode
# title
prefix with <user.unmodified_key>:
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("s/^/{unmodified_key}/g\n")


###
# Visual Mode
###
(select|highlight) all: user.vim_normal_mode_exterm("ggVG")
reselect: user.vim_normal_mode_exterm("gv")
make ascending: user.vim_normal_mode_key("g ctrl-a")

###
# Terminal mode
#
# NOTE: Only applicable to newer vim and neovim. Duplicate command with
# vim_terminal.talon, but included in case user doesn't have `VIM mode:t` in
# titlestring
###
(escape|pop) terminal:
    key(ctrl-\)
    key(ctrl-n)

new terminal:
    user.vim_normal_mode_exterm(":term\n")

force new terminal:
    user.vim_normal_mode_exterm(":term!\n")

[new] (split|horizontal) (term|terminal):
    # NOTE: if your using zsh you might have to switch this, though depending
    # on your setup it will still work (this loads zsh on mine)
    user.vim_normal_mode_exterm(":split term://bash\n")

[new] vertical split (term|terminal):
    user.vim_normal_mode_exterm(":vsplit term://bash\n")

###
# Folding
###
fold (lines|line): user.vim_normal_mode("fZ")
fold line <number> through <number>$: user.vim_normal_mode(":{number_1},{number_2}fo\n")
(unfold|open fold|fold open): user.vim_normal_mode("zo")
(close fold|fold close): user.vim_normal_mode("zc")
open all folds: user.vim_normal_mode("zR")
close all folds: user.vim_normal_mode("zM")

###
# QuickFix list
###
vim grep:
    user.vim_command_mode(":vimgrep // */*")
    key(left:5)

quick [fix] next: user.vim_command_mode(":cn\n")
quick [fix] (prev|previous): user.vim_command_mode(":cp\n")
quick [fix] (show|hide): user.vim_command_mode(":cw\n")
quick [fix] close: user.vim_command_mode(":ccl\n")
quick [fix] bottom: user.vim_command_mode(":cbo\n")
quick [fix] do:
    user.vim_command_mode(":cdo | update")
    key(left:9)
set auto write all: user.vim_command_mode(":set autowriteall\n")

###
# Functions
###
function list:
    user.vim_command_mode(":function\n")

function show:
    user.vim_command_mode(":function ")
function show brief:
    user.vim_command_mode(":function! ")
function search:
    user.vim_command_mode(":function / ")
function call:
    user.vim_command_mode(":call ")
recall last function:
    user.vim_command_mode(":call ")
    key(up)
    key(enter)

###
# Argument list
#
# TODO missing write and movement ex: :wnext
###
(arg|argument) do:
    user.vim_command_mode(":argdo | update")
    key(left:9)
(arg|argument) files:
    user.vim_command_mode(":arg ")
(arg|argument) list show:
    user.vim_command_mode(":arg\n")
(arg|argument) add:
    user.vim_command_mode(":argadd ")
(arg|argument) next:
    user.vim_command_mode(":next\n")
(arg|argument) previous:
    user.vim_command_mode(":prev\n")
(arg|argument) first:
    user.vim_command_mode(":first\n")
(arg|argument) last:
    user.vim_command_mode(":last\n")

###
# Command mode
###
last command:
    user.vim_command_mode(":!!\n")

messages show:
    user.vim_command_mode(":messages\n")

# This allows to see plug-in and script errors from the messages screen in a
# new editable buffer.
# WARNING: clobbers register a
messages extract:
    user.vim_command_mode(":vsplit\n")
    user.vim_command_mode(":enew\n")
    user.vim_command_mode(":redir @a\n")
    user.vim_command_mode(":silent messages\n")
    user.vim_command_mode(":redir END\n")
    user.vim_normal_mode('"ap')
    user.vim_normal_mode('G')

###
# Spell check
#
# Recommend you `set spellfile` somewhere
###

change (directory|dir|dur):
	insert(":chdir ")
spell add: user.vim_normal_mode('zg')
spell wrong: user.vim_normal_mode('zw')
spell undo add: user.vim_normal_mode('zug')
spell undo wrong: user.vim_normal_mode('zug')
spell suggest: user.vim_normal_mode('z=')
spell next: user.vim_normal_mode(']s')
spell last: user.vim_normal_mode('[s')

###
# Convenience
###
force last:
    user.vim_command_mode_exterm(":")
    key(up !)

left align paragraph:
    user.vim_visual_mode("}:left\n")

###
# Command execution
###

# Run the current script view the command line
# XXX - These should only enable in python lang mode
invoke this:
    user.vim_command_mode(":!%\n")
run python:
    user.vim_normal_mode_np(":w\n")
    insert(":exec '!python' shellescape(@%, 1)\n")
run sandbox:
    user.vim_normal_mode_np(":w\n")
    insert(":exec '!env/bin/python3' shellescape(@%, 1)\n")

remove trailing white space: user.vim_normal_mode(":%s/\\s\\+$//e\n")
(remove all|normalize) tabs: user.vim_normal_mode(":%s/\\t/    /eg\n")
# assumes visual mode
(delete|trim) empty lines:
    insert(":")
    sleep(100ms)
    insert("g/^$/d\n")

show unsaved changes:
    user.vim_command_mode(":w !diff % -\n")

swap again:
    key(g &)

# remove first byte from a line
pinch: user.vim_normal_mode("0x")
prefix <user.unmodified_key>: user.vim_normal_mode("I{unmodified_key}")
squish: user.vim_command_mode(":s/  / /g\n")
# XXX - this could be a generic talon thing
magnet: user.vim_normal_mode("f x")
magnet back: user.vim_normal_mode("F x")


# useful for turning a git status list already yanked into a register into a
# space delimited list you can peace unto the command line
remove newlines from register <user.unmodified_key>:
    user.vim_command_mode(":let @{unmodified_key}=substitute(strtrans(@{unmodified_key}),'\\^@',' ','g')\n")

###
# Custom
#
# For really user-specific customizations I suggest a different file, but this
# section can be used for experimentation, etc.
###
