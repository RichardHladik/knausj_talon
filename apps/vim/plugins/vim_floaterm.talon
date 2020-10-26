# https://github.com/voldikss/vim-floaterm
tag: user.vim_floaterm
-

float term: user.vim_command_mode_exterm(":FloatermNew\n")
float toggle: user.vim_command_mode_exterm(":FloatermToggle\n")
float kill: user.vim_command_mode_exterm(":FloatermKill\n")
# python repl
float python: user.vim_command_mode_exterm(":FloatermNew python\n")
# talon repl
float talon: user.vim_command_mode_exterm(":FloatermNew ~/.talon/bin/repl\n\n")
