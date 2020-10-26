os: linux
tag: user.terminal
-
(rerun|run) last [command]: "!!\n\n"
cancel [that]: key("ctrl-c")
damn (it|that): key("ctrl-d")

# fzf keybindings
search history: key(ctrl-r)
#fuzzy (dir|dear|dur): key(alt-c)
#fuzzy (dir|dear|dur) <user.text>:
#    key(alt-c)
#    insert("{text}")

# zsh commands
reload shell config: "source ~/.zshrc\n"
