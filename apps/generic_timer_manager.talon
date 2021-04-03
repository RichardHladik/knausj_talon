tag: user.timer_manager
-

#timer: user.timer()
system timer restart: user.timer_restart()
system timer reload: user.timer_reload()
system timer stop: user.timer_stop()
system timer start: user.timer_start()
system timer status: user.timer_status()
system timer enable: user.timer_enable()
system timer disable: user.timer_disable()
system timer help: user.timer_help()
system timer kill: user.timer_kill()
system timer is enabled: user.timer_is_enabled()

# timer's specific to user vs system-wide
systerm timer user: user.timer()
systerm timer user restart: user.timer_user_restart()
systerm timer user reload: user.timer_user_reload()
systerm timer user stop: user.timer_user_stop()
systerm timer user start: user.timer_user_start()
systerm timer user status: user.timer_user_status()
systerm timer user enable: user.timer_user_enable()
systerm timer user disable: user.timer_user_disable()
systerm timer user help: user.timer_user_help()
systerm timer user kill: user.timer_user_kill()
systerm timer user is enabled: user.timer_user_is_enabled()
