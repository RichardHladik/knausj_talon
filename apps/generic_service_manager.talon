tag: user.terminal
-
tag(): user.service_manager
tag(): user.systemd

service: user.service()
service restart: user.service_restart()
service reload: user.service_reload()
service stop: user.service_stop()
service start: user.service_start()
service status: user.service_status()
service help: user.service_help()
service kill: user.service_kill()
service is enabled: user.service_is_enabled()
