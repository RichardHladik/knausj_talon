tag: user.systemctl
-

action(user.service): "systemctl --no-pager"
action(user.service_stop): "systemctl --no-pager stop "
action(user.service_start): "systemctl --no-pager start "
action(user.service_status): "systemctl --no-pager status "
action(user.service_enable): "systemctl --no-pager enable "
action(user.service_disable): "systemctl --no-pager disable "
