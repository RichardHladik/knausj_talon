tag: user.zsh
-
tag(): user.zsh_cd_gitroot

# XXX - should be generic shell command
# zsh commands
reload shell config: "source ~/.zshrc\n"

^<user.zsh_completion>:
    insert(user.zsh_completion)
