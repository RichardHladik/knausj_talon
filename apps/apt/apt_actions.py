from talon import Context, actions
ctx = Context()
ctx.matches = r"""
os: linux
tag: user.packager_apt
"""

@ctx.action_class('user')
class UserActions:
    # see apt.py per additional actions
    # XXX - switch to generic packages
    def packager(): actions.auto_insert('apt ')
