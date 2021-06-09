mode: user.vimscript
and code.language: vimscript
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
# XXX - revisit these
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"
    
    
    ###
    # Generic Actions - see appropriate generic talon file for spoken command
    ###
    
    # operators - see lang/operators.talon


###
# VIM Script Specific
###
assign [<user.vimscript_scope>] (variable|var) [<user.text>] [over]:
    insert("let ")
    insert(vimscript_scope or '')
    user.code_private_variable_formatter(text)
    
[<user.vimscript_scope>] (variable|var) [<user.text>] [over]:
    insert(vimscript_scope or '')
    user.code_private_variable_formatter(text)
    
    # see lang/vimscript/vimscript.py for list
<user.vimscript_functions>:
    insert("{vimscript_functions} ")
    
    # XXX - possibly overlap with some programming.talon
state command: "command! "
state end if: "endif"
state end for: "endfor"
state end while: "endwhile"
state end function: "endfunction"
state continue: "continue"
funk <user.text>:
    insert(user.formatted_text(text, "snake"))
    insert("()")
    edit.left()
