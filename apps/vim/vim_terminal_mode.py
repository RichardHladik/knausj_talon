from talon import Context, Module, actions, settings, ui

ctx = Context()
ctx.matches = r"""
tag: user.vim_terminal
"""


def parse_vim_term_title(window):
    """a variety of parsing to gracefully handle various shell commands
    running inside of a vim terminal.
    :returns: TODO

    """

    if (window != ui.active_window() or 
        not window.title.startswith("VIM MODE:t") or 
        "TERM:" not in window.title):

        ctx.tags = []
        return

    # pull a TERM: line out of something potentially like 
    # VIM MODE:t RPC:/tmp/nvimlVeccr/0  TERM:gdb (term://~//161917:/usr/bin/zsh) zsh
    index = window.title.find("TERM:")
    shell_command = window.title[index+len("TERM:"):]
    if ":" in shell_command:
        shell_command = shell_command.split(":")[0]
    shell_command = shell_command.split(" ")[0]

    populate_shell_tags(shell_command)
    populate_language_modes(shell_command)

def populate_language_modes(shell_command):
    """TODO: Docstring for populate_language_modes.

    :shell_command: TODO
    :returns: TODO

    """
    language_specific_commands = {
        "repl": "python",
    }

    for command in language_specific_commands.keys():
        if shell_command.endswith(command):
            actions.user.code_set_context_language(language_specific_commands[command])
            return

    actions.user.code_clear_context_language()
    return

def populate_shell_tags(shell_command):
    """TODO: Docstring for populate_shell_tags.
    :returns: TODO

    """
    shell_tags = {
        "zsh": "terminal",
        "bash": "terminal",
        "sh": "terminal",
        # TODO - fix this
        "root@oedo": "terminal",
        "ssh": "terminal",
        "gdb": "user.gdb",
        "htop": "user.htop",
        "taskwarrior-tui": "user.taskwarrior_tui",
        "~/.talon/bin/repl": "user.talon_repl",
    }
    # XXX - there's probably a better way to deal with this
    fuzzy_shell_tags = {
        # Match on stuff like fzf running in floating term
        #"term://": "user.readline",
    }
    print(shell_command)
    if shell_command in shell_tags:
        ctx.tags = [shell_tags[shell_command]]
    else:
        found_fuzzy = False
        for tag in fuzzy_shell_tags:
            if shell_command.startswith(tag):
                ctx.tags = [shell_tags[shell_command]]
                found_fuzzy = True
                break
        #ctx.tags = ["terminal"]
#        if not found_fuzzy:
#            print(f"WARNING: missing tag for shell cmd: {shell_command}")
#            print(f"WARNING: consider updating vim_terminal.py: {shell_command}")
#

ui.register("win_title", parse_vim_term_title)
ui.register("win_focus", parse_vim_term_title)
