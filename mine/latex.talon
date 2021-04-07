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


(emphasize|emphasized) selected:
	insert("x")
	user.vim_insert_mode("\\emph{}")
	key(left)
    user.vim_normal_mode("P")
	key(right)

math for all: "\\forall "
set minus: " \\setminus "
empty set:
	key(\\)
	key({)
	key(\\)
	key(})
	key(left)
	key(left)
empty set builder:
	key(\\)
	key({)
	key(\\ ,)
	insert("\\mid ")
	key(\\ ,)
	key(\\)
	key(})
	key(left:9)

label:
	'\\label{}'
	key(left)
label equation:
	'\\label{}'
	key(left)
	'eq:'
next (place holder|placeholder):
	user.vim_set_normal_mode_np()
	insert("/xxx\n")
first (place holder|placeholder):
	user.vim_set_normal_mode_np()
	insert("gg/xxx\n")
lower dots:
	insert("\\ldots ")
centered dots:
	insert("\\cdots ")
begin remark:
	mimic("begin block rem")
footnote:
	insert("\\footnote{}")
	key(left)

math (l|ell|el):
	insert("\\ell")
math left: "\\left"
math right: "\\right"
math text:
	insert("\\text{}")
	key(left)
math tag:
	insert("\\tag{}")
	key(left)
k flow|keyflow|kayflow:
	insert("\\kflow{} ")
to do:
	insert("\\todo{}")
	key(left)
union: " \\cup "
cartesian [product]: " \\times "
subset equal: " \\subseteq "
math conformal: " \\conformal "
