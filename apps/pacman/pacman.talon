os: linux
tag: user.packager_pacman
-
pacman search <user.text>: "pacman -sS {text}"
pacman install <user.text>: "pacman -S {text}"

# see yay.py per additional actions
action(user.packager): "pacman "
action(user.package_search): "pacman -sS "
action(user.package_install): "pacman -S "
action(user.package_remove): "pacman -R "
