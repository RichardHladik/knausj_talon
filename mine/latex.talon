mode: command
code.language: tex
-
tag(): user.code_operators
tag(): user.code_comment
#tag(): user.code_generic
settings():
    user.code_private_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_function_formatter = "PROTECTED_CAMEL_CASE"
    user.code_public_function_formatter = "PROTECTED_CAMEL_CASE"
    user.code_private_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_variable_formatter = "PROTECTED_CAMEL_CASE"
    user.code_public_variable_formatter = "PROTECTED_CAMEL_CASE"

action(user.code_operator_subscript): 		
	insert("_{}")
	key(left)
action(user.code_operator_assignment): ' \\coloneqq '
action(user.code_operator_subtraction): ' - '
action(user.code_operator_addition): ' + '
action(user.code_operator_multiplication): ' \\cdot '
action(user.code_operator_exponent):
	insert('^{}')
	key(left)
action(user.code_operator_division): ' / '
action(user.code_operator_modulo): ' \\bmod '
action(user.code_operator_equal): ' = '
action(user.code_operator_not_equal): ' \\ne '
action(user.code_operator_greater_than): ' > '
action(user.code_operator_greater_than_or_equal_to): ' \\ge '
action(user.code_operator_less_than): ' < '
action(user.code_operator_less_than_or_equal_to): ' \\le '
action(user.code_operator_and): ' \\wedge '
action(user.code_operator_or): ' \\vee '
action(user.code_operator_bitwise_and): ' \\& '
action(user.code_operator_bitwise_or): ' | '
action(user.code_operator_bitwise_exclusive_or): ' \\oplus '
action(user.code_null): '\\emptyset'
action(user.code_comment): '%'
action(user.code_operator_in): ' \\in '
