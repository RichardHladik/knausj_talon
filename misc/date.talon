# Expose a number of common commands for printing out dates in various formats
# TODO - add some unix epoch, microsoft

-
date time: insert(user.date_now())
date today: insert(user.date_today())
date yesterday: insert(user.date_yesterday())
date tomorrow: insert(user.date_tomorrow())
<number_small> (hours|hour) <number_small> (minutes|minute): insert(user.time_format("{number_small_1}", "{number_small_2}"))
military time <number_small> <number_small>: insert(user.time_format("{number_small_1}", "{number_small_2}"))
