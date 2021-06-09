from talon import Context, actions
ctx = Context()
ctx.matches = r"""
# Its note that this is not actual EMACS itself, but refers to the default
# command line editing mode enabled in most common linux shells like bash, zsh,
# is also used by lots of command line tools/interfaces, for example gdb
# command line interface.
#
# It more information about the commands can be found here:
# https://www.gnu.org/software/bash/manual/html_node/Command-Line-Editing.html
#
# The idea is that certain shell tools can assert the tag to ensure that the
# generic talon line editing commands will still work. Is also allows for
# things like zsh being configured in vi mode, but then using gdb with the more
# traditional emacs-style keyboard shortcuts

tag: user.readline
"""

@ctx.action_class('edit')
class EditActions:
    def undo():
        actions.key('ctrl-x ctrl-u')
    def up():
        actions.key('up')
    def down():
        actions.key('down')
    def left():
        actions.key('left')
    def right():
        actions.key('right')
    def word_left():
        actions.key('alt-b')
    def word_right():
        actions.key('alt-f')
    def line_start():
        actions.key('ctrl-a')
    def line_end():
        actions.key('ctrl-e')
    def delete_line():
        actions.key('ctrl-a')
        actions.key('ctrl-k')

@ctx.action_class('user')
class UserActions:
    def delete_line_beginning():
        actions.key('ctrl-u')
    def delete_line_remaining():
        actions.key('ctrl-k')
    def delete_word_right():
        actions.key('alt-d')
    def delete_word_left():
        actions.key('ctrl-w')
        # XXX - make this generic
