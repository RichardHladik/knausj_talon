# this is largely based on bash.talon. any problems you find that aren't
# explicitly in zsh functionality you may want to see if they also exist there

mode: user.zsh
mode: command
and code.language: zsh
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
#action(user.code_operator_exponent): " ** "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "
action(user.code_operator_modulo): " % "
action(user.code_operator_modulo_assignment): " %= "
action(user.code_operator_equal): " == "
action(user.code_operator_not_equal): " != "
action(user.code_operator_greater_than): " > "
action(user.code_operator_greater_than_or_equal_to): " >= "
action(user.code_operator_less_than): " < "
action(user.code_operator_less_than_or_equal_to): " <= "
action(user.code_operator_and): " && "
action(user.code_operator_or): " || "
action(user.code_operator_bitwise_and): " & "
action(user.code_operator_bitwise_and_assignment): " &= "
action(user.code_operator_bitwise_or): " | "
action(user.code_operator_bitwise_or_assignment): " |= "
action(user.code_operator_bitwise_exclusive_or): " ^ "
action(user.code_operator_bitwise_exclusive_or_assignment): " ^= "
action(user.code_operator_bitwise_left_shift): " << "
action(user.code_operator_bitwise_left_shift_assignment): " <<= "
action(user.code_operator_bitwise_right_shift): " >> "
action(user.code_operator_bitwise_right_shift_assignment): " >>= "


action(user.code_include_local):
    insert('source ')
action(user.code_comment): "#"

# XXX - redundant with snippets
action(user.code_state_if):
  insert("if [];")
  key(left)

# XXX - redundant with snippet
# XXX - should use the env line instead
call interpreter: "#!/usr/bin/zsh\n"
(new sub|state) command: "$()"
(new|state) expression: "$(())"
# XXX
parameter:
    insert("${}")
    edit.left()

# XXX - check how other talon files invoke variable names
state [empty] (variable|var):
    insert("${}")
    key(left)

# XXX - check how other talon files invoke variable names
state (variable|var) <user.text>$:
    insert("${}")
    edit.left()
    snake_text = user.formatted_text(text, "snake")
    upper_text = user.formatted_text(snake_text, "upper")
    insert(upper_text)

state echo: "echo "

# XXX will overlap somewhat with core shell commands use terminals, show me one
# to combine somehow
copy file:
    insert("cp ")

recursive copy file:
    insert("cp -R ")

state redirect out: "1>&2"
state redirect error: "2>&1"
