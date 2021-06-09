from talon import Context, actions
ctx = Context()
ctx.matches = r"""
os: linux
tag: user.packager_yay
"""

@ctx.action_class('user')
class UserActions:
    # see yay.py for additional actions
    def packager():        actions.auto_insert('yay ')
    def package_search():  actions.auto_insert('yay -sS ')
    def package_install(): actions.auto_insert('yay -S ')
    def package_remove():  actions.auto_insert('yay -R ')
    def package_help():    actions.auto_insert('yay --help\n')
    def package_list():    actions.auto_insert('yay -Qe\n')
