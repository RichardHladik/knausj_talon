mode: dictation
-
settings():
    user.warn_dictation_mode = 1

#everything here should call auto_insert to preserve the state to correctly auto-capitalize/auto-space.
<user.text>:
	insert(text)
	insert(" ")
period: key(backspace . space)
(comma | kama): key(backspace , space)
question mark: key(backspace ? space)
(bang | exclamation [mark]): key(backspace ! space)
dash: key(backspace - space)
colon: key(backspace : space)
(semi colon | semicolon): key(backspace ; space)
(cap|cab) <user.text>:
    result = user.formatted_text(user.text, "CAPITALIZE_FIRST_WORD")
    auto_insert(result)
#navigation
go up <number_small> lines:
    edit.up()
    repeat(number_small - 1)
go down <number_small> lines:
    edit.down()
    repeat(number_small - 1)
go left <number_small> words:
    edit.word_left()
    repeat(number_small - 1)
go right <number_small> words:
    edit.word_right()
    repeat(number_small - 1)
go line start: edit.line_start()
go line end: edit.line_end()
#selection
select left <number_small> words:
    edit.extend_word_left()
    repeat(number_small - 1)
select right <number_small> words:
    edit.extend_word_right()
    repeat(number_small - 1)
select left <number_small> characters:
    edit.extend_left()
    repeat(number_small - 1)
select right <number_small> characters:
    edit.extend_right()
    repeat(number_small - 1)
clear left <number_small> words:
    edit.extend_word_left()
    repeat(number_small - 1)
    edit.delete()
clear right <number_small> words:
    edit.extend_word_right()
    repeat(number_small - 1)
    edit.delete()
clear left <number_small> characters:
    edit.extend_left()
    repeat(number_small - 1)
    edit.delete()
clear right <number_small> characters:
    edit.extend_right()
    repeat(number_small - 1)
    edit.delete()
#formatting
formatted <user.format_text>:
    user.auto_format_pause()
    auto_insert(format_text)
    user.auto_format_resume()
^format selection <user.formatters>$:
    user.formatters_reformat_selection(formatters)
#corrections
scratch that: user.clear_last_utterance()
scratch selection: edit.delete()
select that: user.select_last_utterance()
spell that <user.letters>: auto_insert(letters)
spell that <user.formatters> <user.letters>:
    result = user.formatted_text(letters, formatters)
    user.auto_format_pause()
    auto_insert(result)
    user.auto_format_resume()
#escape, type things that would otherwise be commands
^escape <user.text>$:
    auto_insert(user.text)
