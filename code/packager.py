from talon import Context, Module, actions, app

mod = Module()
ctx = Context()
ctx.matches = r"""
os: linux
tag: terminal
"""

mod.tag("package_manager", desc="linux package manager")
mod.tag("packager_yay", desc="Arch Linux YAY packager")
mod.tag("packager_pacman", desc="Arch Linux YAY packager")
mod.tag("packager_pamac", desc="Manjaro Linux packager")
mod.tag("packager_apt", desc="Debian/Ubuntu Linux packager")
mod.tag("packager_snap", desc="Snap packager")
mod.tag("packager_zypper", desc="SuSE packager")
mod.tag("packager_dnf", desc="Fedora DNF packager")
mod.tag("packager_yum", desc="Fedora YUM packager")
mod.tag("packager_npm", desc="Node package manager")


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

    def package_help():
        """List the packages help menu"""
