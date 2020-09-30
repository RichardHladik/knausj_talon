mode: command
mode: dictation
code.language: tex
-
in line math:
	insert("$$")
	key(left)

display math:
	insert("$$$$")
	key(left)
	key(left)

begin block [over]:
	key(enter)
	insert('\end{}')
	key(up)
	insert("\\begin{}")
	key(enter)


begin block <user.text> [over]:
	key(enter)
	key(enter)
	insert('\end{')
	insert(user.formatted_text(user.text, "smash"))
	insert('}')
	key(up)
	key(up)
	insert("\\begin{")
	insert(user.formatted_text(user.text, "smash"))
	insert('}')
	key(enter)
	key(enter)
	key(tab)

item:
	insert("\\item ")

math in:
	insert(" \\in ")

real numbers:
	insert("\R")
natural numbers:
	insert("\\N")

italic selected:
	insert("x")
	user.vim_insert_mode("\\textit{}")
	key(left)
    user.vim_normal_mode("P")
	key(right)
bold selected:
	insert("xi\\textbf{}")
	key(left)
    user.vim_normal_mode("P")
	key(right)
(emphasize|emphasized) selected:
	insert("x")
	user.vim_insert_mode("\\emph{}")
	key(left)
    user.vim_normal_mode("P")
	key(right)

math sum:
	insert("\\sum_{}")
	key(left)

group:
	insert('{}')
	key(left)

size of:
	insert("||")
	key(left)


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
	insert("_")
action(user.code_operator_assignment): ' \coloneqq '
action(user.code_operator_subtraction): ' - '
action(user.code_operator_addition): ' + '
action(user.code_operator_multiplication): ' \cdot '
action(user.code_operator_exponent): '^'
action(user.code_operator_division): ' / '
action(user.code_operator_modulo): ' \bmod '
action(user.code_operator_equal): ' = '
action(user.code_operator_not_equal): ' \\ne '
action(user.code_operator_greater_than): ' > '
action(user.code_operator_greater_than_or_equal_to): ' \ge '
action(user.code_operator_less_than): ' < '
action(user.code_operator_less_than_or_equal_to): ' \le '
action(user.code_operator_and): ' \wedge '
action(user.code_operator_or): ' \vee '
action(user.code_operator_bitwise_and): ' \& '
action(user.code_operator_bitwise_or): ' | '
action(user.code_operator_bitwise_exlcusive_or): ' \oplus '
action(user.code_null): '\emptyset'
action(user.code_comment): '%'

greek alpha: '\\alpha'
greek big alpha: '\\Alpha'
greek big delta: '\\Delta'
greek row: '\\rho'
pseudo flow: "pseudoflow"
math for all: "\\forall "
set minus: " \\setminus "
empty set:
	key(\)
	key({)
	key(\)
	key(})
	key(left)
	key(left)
empty set builder:
	key(\)
	key({)
	key(\ ,)
	insert("\\mid ")
	key(\ ,)
	key(\)
	key(})
	key(left:9)

excess flow:
	'\\flowex()'
	key(left)
label:
	'\\label{}'
	key(left)
label equation:
	'\\label{}'
	key(left)
	'eq:'
(place holder|placeholder|plays holder|plate holder|please hold (the|a|up)|shit happens):
	insert("$xxx$ ")
^(place holder|placeholder|plays holder|plate holder|please hold (the|a|up)|shit happens)$:
	user.vim_set_insert_mode()
	key(ctrl-g u)
	insert("$xxx$ ")
next (place holder|placeholder):
	user.vim_set_normal_mode_np()
	insert("/xxx\n")
first (place holder|placeholder):
	user.vim_set_normal_mode_np()
	insert("gg/xxx\n")
equation (place holder|placeholder):
	user.vim_set_insert_mode()
	key(ctrl-g u)
	key(backspace)
	insert("\n%\n\\begin{")
	insert("equation*}\n\txxx.\n")
	key(backspace)
	insert("\\end{")
	insert("equation*}\n%\n")
display (place holder|placeholder):
	user.vim_set_insert_mode()
	key(ctrl-g u)
	key(backspace)
	insert("\n$$xxx$$\n")
lower dots:
	insert("\\ldots ")
centered dots:
	insert("\\cdots ")
begin remark:
	mimic("begin block rem")
italic:
	insert("\\textit{}")
	key(left)
bold:
	insert("\\textbf{}")
	key(left)
footnote:
	insert("\\footnote{}")
	key(left)

en pee:
	insert("\\NP")

np-hard:
	insert("\\NP-hard")


to do reference:
	insert("\\ref{")
	insert("?} ")

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
