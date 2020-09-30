os: linux
tag: user.packager_yay
-
# see yay.py per additional actions
action(user.packager): "yay "
action(user.package_search): "yay -sS "
action(user.package_install): "yay -S "
action(user.package_remove): "yay -R "
