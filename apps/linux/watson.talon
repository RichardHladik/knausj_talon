mode: command
-
watson stop: user.watson_stop()
watson stop at: user.watson_stop(1)
watson cancel: user.watson_cancel()
watson search: user.watson_search()
watson start ({user.watson_activity})+: user.watson_start(user.watson_activity_list)
watson start ({user.watson_activity})+ at: user.watson_start(user.watson_activity_list, 1)
