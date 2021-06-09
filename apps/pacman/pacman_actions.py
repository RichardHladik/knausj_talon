from talon import Context, actions
ctx = Context()
ctx.matches = r"""
os: linux
tag: user.packager_pacman
"""

@ctx.action_class('user')
class UserActions:
    # see yay.py per additional actions
    def packager():        actions.auto_insert('pacman ')
    def package_search():  actions.auto_insert('pacman -sS ')
    def package_install(): actions.auto_insert('pacman -S ')
    def package_remove():  actions.auto_insert('pacman -R ')
