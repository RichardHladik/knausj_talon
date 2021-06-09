mode: command
-
quick open {user.quick_url}:
	user.quick_url_new("{user.quick_url}", 1)
quick open {user.quick_url_template}:
	user.quick_url_new("{user.quick_url_template}", 0)
quick eat {user.quick_url}:
	user.quick_url_current("{user.quick_url}", 1)
quick eat {user.quick_url_template}:
	user.quick_url_current("{user.quick_url_template}", 0)
