os: linux
tag: user.packager_yay
-
# see yay.py for additional actions
action(user.packager): "yay "
action(user.package_search): "yay -sS "
action(user.package_install): "yay -S "
action(user.package_remove): "yay -R "
action(user.package_help): "yay --help\n"
action(user.package_list): "yay -Qe\n"
package fetch build: "yay --getpkgbuild "
