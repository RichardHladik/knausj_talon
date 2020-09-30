os: linux
tag: terminal
-
(rerun|run) last [command]: "!!\n\n"
interrupt: key("ctrl-c")
damn it: key("ctrl-d")

# fzf keybindings
search history: key(ctrl-r)
#fuzzy (dir|dear|dur): key(alt-c)
#fuzzy (dir|dear|dur) <user.text>:
#    key(alt-c)
#    insert("{text}")

# zsh commands
reload shell config: "source ~/.zshrc\n"
