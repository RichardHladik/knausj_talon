# -1 because we are repeating, so the initial command counts as one
repeat <user.ordinals>: core.repeat_command(ordinals-1)
<user.ordinals_small>: core.repeat_command(ordinals_small-1)
(repeat that|twice): core.repeat_command(1)
<number_small> times: core.repeat_command(number_small)

