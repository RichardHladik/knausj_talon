# This file is specifically for when navigating the git status pane
# https://github.com/tpope/vim-fugitive
# It currently relies on you using ${FugitiveStatusLine()} in your titlestring
# ex: let &titlestring ='VIM MODE:%{mode()} RPC:%{v:servername} %{FugitiveStatusline()} (%f) %t'
# XXX - need to make sure not to conflict with vim bindings
# XXX - missing a significant amount of commands

tag: vim
and win.title: /Git/
# XXX - need to figure out how to include the `[` in the regex
-

# Staging/unstaging maps

stage: key(s)
un stage: key(u)
un stage (all|everything): key(U)
discard change: key(key)
in line dif: key(=)
exclude this file: "gI"

# Diff maps

# Navigation maps
open file: key(o)
open vertical file: key(gO)
open tab file: key(O)
preview file: key(p)

# Commit maps

commit file: "cc"
amend last commit: "ca"

# Checkout/branch maps

# Stash maps

# Rebase maps

# Miscellaneous maps

close status: "gq"
fugitive help: "g?"

# Global maps
