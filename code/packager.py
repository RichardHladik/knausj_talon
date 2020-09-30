from talon import Context, Module, actions, app

mod = Module()
ctx = Context()
ctx.matches = r"""
os: linux
tag: user.terminal
"""

mod.tag("packager_yay", desc="arch packager")


@mod.action_class
class Actions:
    def packager():
        """Run the default packager"""

    def package_search():
        """Search the package database"""

    def package_search_by_name(name: str):
        """Search for the specified package in the package database"""

    def package_install():
        """Install from the package database"""

    def package_install_by_name(name: str):
        """Install specified package from the package database"""

    def package_remove():
        """Uninstall the package"""

    def package_remove_by_name(name: str):
        """Uninstall the package by name"""

    def package_update():
        """Update from the package database"""

    def package_update_by_name(name: str):
        """Update specified package from the package database"""

    def package_update_all():
        """Update everything from the package database"""

    def package_upgrade_system():
        """Update the entire system point release"""

    def package_list():
        """List installed packages"""
