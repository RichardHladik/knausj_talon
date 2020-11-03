# grammars that are only set when the picker window is open

mode: user.replay_picker_open
-

hide: user.replay_picker_hide()
pick <number_small>:
    user.replay_pick(number_small)
    user.replay_picker_hide()
