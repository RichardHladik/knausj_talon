# -1 because we are repeating, so the initial command counts as one
<user.ordinal_repeater>: core.repeat_command(ordinal_repeater-1)
(repeat that|twice): core.repeat_command(1)
repeat that <number_small> [times]: core.repeat_command(number_small)
